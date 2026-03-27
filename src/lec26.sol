// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//에러 핸들러 : require, revert, assert, try/catch
/*
    0.8.0 포함X
    0.8.1~
    assert : 오직 내부 에러 테스트 용도, 불변성 체크 용도
            assert가 에러 발싱시, panic(uint256) 이라는 에러타입의 에러를 발생시킴
*/

contract lec26{

    //0.8버전부터의 aasert는 가스를 환불받을 수 있음 
    function assertNow() public pure{
        assert(false);
    }

}