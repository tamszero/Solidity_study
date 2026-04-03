// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//SPDX-License-Identifier의 목적
// -> 0.67버전까지는 안 써줘도 잘 돌아감

/*
1. 라이센스를 명시해줌으로써 스마트컨트랙에 대한 신뢰감을 높일 수 있음
2. 스마트 컨트랙 소스코드가 워낙 오픈되어 있으니, 저작권과 같은 관련된 문제를 해소

라이센스(GPL-30)를 꼭 안 써도 돌아감

주석
1. 블록단위 : 보통 블록단위의 주석은 스마트컨트랙, 함수등 많은 양의 설명
2. 행단위 : 행단위는 변수 바로 옆에 쓰여서, 짤막짤막한 설명

*/

contract lec31{

    /*
    add한수는 9를 리턴!
    */

    function add() pure public returns (uint256){
        return 4+5; // 4+5=9를 리턴
    }
}