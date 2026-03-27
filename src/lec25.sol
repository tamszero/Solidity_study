// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//에러 핸들러 : require, revert, assert, try/catch
//라이브러리 버전마다 다름

/*
    0.4.22 ~0.7.x
    assert : gas를 다 소비한 후, 특정 조건에 부합하지 않으면 에러를 발생 
    revert : 조건없이 에러를 발생, gas를 환불시켜준다
    require : 특정 조건에 부합하지 않을시(false일 때) 에러를 발생, gas를 환불시켜준다

*/

contract lec25{

    //assert -> 가스를 다 소비함
    //주로 테스트할때 사용 
    function assertNow() public pure{
        assert(false);
    }

    //revert -> 가스 환불시켜줌 execution cost 보면 assert에 비해 매우 작은걸 확인 가능
    function revertNow() public pure{
        revert("error!"); //메세지 리턴가능 
    }

    //require -> if + revert
    function requireNow() public pure{
        require(false, "occurred");
    }
    function onlyAdults(uint256 _age) public pure returns(string memory){
        if(_age < 19){
            revert("You are not allowed to pay for the cigarette");
        }
        return "Your payment is succeeded";
    }

    function onlyAdults2(uint256 _age) public pure returns(string memory){
        require(_age > 19, "You are not allowed to pay for the cigarette");
        return "Yout payment is succeeded";
    }
}