// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
low level 함수인 call

1. 송금하기
2. 외부 스마트 컨트랙 함수 부르기
3. 가변적인 gas소비 가능
4. 이스탄불 하드포크 이후 가스 상승에 따른 call함수 사용 권장 (send, transfer 대신)
5. 재진입 공격 위험이 있기에, Checks_Effects_Interactions_pattern 사용

*/

contract add{
    event JustFallback(string _str);
    event JustReceive(string _str);
    function addNumber(uint256 _num1, uint256 _num2) public pure returns(uint256){
        return _num1 + _num2;
    }

    // caller가 add 컨트랙을 부를 때 없는 함수를 부르면 실행됨
    fallback() external payable  { 
        emit JustFallback("Justfallback is called");
    
    }

    //리시브를 통해 이더를 받을 수 있음 
    receive() external payable { 
        emit JustReceive("JustReceive is called");
    }


}

contract caller{
    event calledFunction(bool _success, bytes _output);

    //1. 송금하기
    function transferEther(address payable  _to) public payable {
        (bool success, ) = _to.call{value:msg.value}(""); //0.7이후의 call 형식
        require(success, "failed to transfer ether");
    }

    //2. 외부 스마트 컨트랙 함수 부르기 
    // contractAddr -> 부를 contract의 주소가 필요함 
    // 이 때 우리가 부를 함수는 addNum이라는 함수인데 얘가 두개의 인자값을 받으므로 num1,num2가 필요
    // 이더를 보내지 않으므로 vlaue값은 필요X

    function callMethod(address _contractAddr, uint256 _num1, uint256 _num2) public {
        //bytes memory -> addNum함수가 실행된 후 나온 리턴값(num_1 + num_2)을 바이트화 한 것 
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call(
            
            //abi.encodeWithSignature : 외부 컨트랙의 함수를 부를 때 필요한 함수(?)
            //""안에 부르려는 함수의 이름, 파라미터 값을 써주면 됨
            abi.encodeWithSignature("addNumber(uint256,uint256)", _num1, _num2));

        require(success, "failed to tranfer ether");
        emit calledFunction(success, outputFromCalledFunction); 
    }


    //fallback이 실행되도록 없는 함수를 부르면서 이더를 보내기 
    function callMethod2(address _contractAddr) public payable {

        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call{value:msg.value}(
            abi.encodeWithSignature("Nothing()")
            );

        require(success, "failed to tranfer ether");
        emit calledFunction(success, outputFromCalledFunction); 

    }

}