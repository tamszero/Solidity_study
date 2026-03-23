// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//이벤트 정의
//이벤트 : 블록에 특정값을 기록함 
//솔리디티는 print가 따로 없고 로그에 이벤트를 사용해 출력을 한다 

contract lec13 {
   
   //event 이벤트이름(타입 이름, 타입 이름, ...)
    event info(string name, uint256 money);
    
    function sendMoney() public {
        emit info("KimDaeJin", 1000);
    }
}