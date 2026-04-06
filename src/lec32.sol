// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;



//Payable, msg.value, 이더를 보내는 3가지 방법

contract lec32{
    /*
    - Payable 
    : 이더/토큰과 상호작용시 필요한 키워드
    send, transfer, call을 이용하여, 이더를 보낼 때 Payable이라는 키워드가 필요하다
    이 Payable은 주로 함수, 주소, 생성자에 붙여서 사용됨

    - msg.value
    :송금보낸 코인의 값

    - 이더를 보내는 3가지 방
        1. send : 2300 gas를 소비, 성공여부를 true, false로 리턴
        2. transfer : 2300 gas를 소비, 실패시 에러를 발생
        3. call : 가변적인 gas 소비(gas값 지정 가능), 성공여부를 true, return으로 리턴
                  재진입(reetrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천.

    */

    //_to -> 송금받을 사람의 주소 
    //_to는 스마트컨트랙 주소도 가능. -> 스마트 컨트랙도 이더를 받을 수 있다
    event howMuch(uint256 _value);

    function sendNow(address payable _to) public payable {
        bool sent = _to.send(msg.value); //송금의 성공 여부를 return함
        require(sent, "Failed to send Ether"); // 송금 실패시 에러
        emit howMuch(msg.value); 
    }

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value); //transfer는 자체적으로 에러처리가 되므로 따로 안 써줘도 됨
        emit howMuch(msg.value);
    }

    function callNow(address payable _to) public payable {
        //0.7버전 이상부터는 형식이 조금 달라짐
        //~0.7
        /*
        (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        require(sent, "Failed to sent either")
        */
        
        //0.7~
        (bool sent, ) = _to.call{value: msg.value, gas:1000}(""); //포크 이후 가스 가격이 오르기 때문에 가스를 지정해주지 않는 것이 좋음
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
    }

    
}