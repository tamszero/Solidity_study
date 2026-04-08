// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*

<Delegate call>

Call vs Delegate call
Delegate call:
1. msg.sender 가 본래의 스마트 컨트랙 사용자를 나타낸다
    -> call의 경우 부른 컨트랙의 주소가 msg.sender가 됨
2. delegate call이 정의된 스마트 컨트랙(즉 caller)이 외부 컨트랙의 함수를 마치 자신의 것 처럼 사용(실질적인 값도 caller에 저장)
    -> call의 경우 부른 컨트랙 내부에서 함수가 실행이 됨 

조건
외부 스마트 컨트랙과 caller 스마트 컨트랙은 같은 변수를 갖고 있어야 한다.

why delegate call?
upgradable smart contract 용도
-> 컨트랙A,B가 존재, B의 내용이 바뀔 때 굳이 다 재배포를 할 필요가 없이
B를 버리고 새로 배포, A에서 addr만 새로운 B로 변경해주면 되는 용이함


*/


contract add{
    uint256 public num = 0;
    event Info(address _addr, uint256 _num);

    function plusOne() public {
        num = num + 1;
        emit Info(msg.sender, num);
    }

}

contract caller{
    uint256 public num = 0;
    function callNow(address _contractAddr) public payable {
        (bool success, ) = _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success, "failed to transfer ether");
    }

    function delegateCallNow(address _contractAddr) public payable {
        (bool success, ) = _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success, "failed to transfet ether");
    }
}