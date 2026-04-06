// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
<주소.balance>
-> 해당 특정 주소의 현재 갖고있는 이더 잔액을 나타낸다
(msg.value 는 송금할 금액)

<msg.sender>
-> 스마트컨트랙을 사용하는 주체
-> 중요함!!

*/

contract MobileBanking{

    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    function sendEther(address payable _to) public payable {
        require((msg.sender).balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender,(msg.sender).balance);
    }

    function checkValueNow() public {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    //여기서 _to ->스마트컨트랙의 주소
    function checkUserMoney(address _to) public {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }

}