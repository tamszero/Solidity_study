// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
<fallback 함수>

목적
1. 스마트 컨트랙이 이더를 받을 수 있게 한다.
2. 이더를 받고 난 후 어떠한 행동을 취하게 할 수 있음 
3. call 함수로 없는 함수가 불려질때, 어떠한 행동을 취하게 할 수 있음

특징
1. 무기명 함수, 이름이 없는 함수이다
2. external 필수 (외부에서 이더를 보내기 때문에)
3. payable

~0.6
function() external payable{ }

0.6~
fallback이 receive와 fallback으로 두가지 형태로 나뉘게 됨
- receive : 순수하게 이더를 받을 때만 작동함
- fallback : 나머지 경우일 때 (2,3번 등) -> 함수를 실행하면서 이더를 보낼 때, 불려진 함수가 없을 때 작동함
            ex) call함수를 사용할 때 


//이더도 받고 함수도 실행할  때 
fallback() external payable{
    }
//이더만 받을 
receive() external payable{
    }   


*/

contract bank{

    event JustFallbackWithFunds(address _from, uint256 _value, string message);
    event JustFallback(address _from, string message);
    event ReceiveFallback(address _from, uint256 _value, string message);
    
    //~0.6
    /*
    function() external payable{
        emit JustFallbackWithFunds(msg.sender, msg.value, "JustFallbackWithFunds is called");
    }
    */

    //0.6~
    fallback() external {
        emit JustFallback(msg.sender, "JustFallback is called");
    }
    receive() external payable { 
        emit ReceiveFallback(msg.sender, msg.value, "receive is called");
    }
}

contract You{

    //receive()
    function DepositWithSend(address payable _to) public payable{
        bool success = _to.send(msg.value); //send와 transfer는 가스를  최대 2300만 소비해야하기 때문에 부족하면 에러가 날 수 있음!! -> 메세지를 안 받으면 가스 소비가 줄어들 수 있음 해봐 
        require(success, "Failed");
    }

    function DepositWithTransfer(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function DepositWithCall(address payable _to) public payable {
        //~0.7
        //(bool sent, ) = _to.call{value: msg.value}("");
        //require(sent, "Failed to send either");

        //0.7~
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed");
    }

    //fallback()
    function JustGiveMessage(address _to) public {
        //~0.7
        //(bool sent, ) = _to.call("Hi"); //call은 이더뿐만 아니라 함수도 부를 수 있음 -> 지금 Hi라는 다른? 함수를 부르는데 Bank에는 Hi라는 function이 없으므로 fallback에 걸리게 됨!!
        //require(sent, "Failed to send either");
        
        //0.7~
        (bool success, ) = _to.call("Hi");
        require(success, "Failed");

    }

    //To the fallback() with Funds
    function JustGiveMessageWithFunds(address payable _to) public payable {
        //~0.7
        //(bool sent, ) = _to.call.value(msg.value)("Hi");
        //require(sent, "Failed to sent either");

        //0.7~
        (bool success,) = _to.call{value:msg.value}("Hi");
        require(success, "Failed");
    }
}