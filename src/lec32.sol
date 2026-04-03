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

    
}