// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


/*
<Library>

Library : 기존에 만들던 스마트 컨트랙과 다른 종류의 스마트 컨트랙
          공통의 함수들을 전부 라이브러리에 넣어서 배포
          라이브러리를 사용함으로써 몇가지 이점과 제한사항이 있다.

이점
1. 재사용 : 블록체인에 라이브러리가 배포되면, 다른 스마트 컨트랙들에 적용 가능.
2. 가스 소비 줄임 : 라이브러리는 재사용 가능한 코드 -> 가스 소비량을 줄일 수 있다
3. 데이터 타입 적용 : 라이브러리의 기능들은 데이터 타입에 적용할 수 있기에, 좀 더 쉽게 사용 가능

제한사항
1. fallback 불가 : 폴백 함수를 라이브러리 안에 정의 불가 -> 이더를 갖고 있을 수 없다.
2. 상속 불가
3. payable 함수 정의 불가

*/

//오버플로우를 방지하는 코드
library SafeMath{
    //0~255
    function add(uint8 a, uint8 b) internal pure  returns(uint8){
        require(a+b >= a, "SafeMath: addition overflow");
        return a + b;
    }
}

contract lec40{
    using SafeMath for uint8;
    uint8 public a;

    function becomeOverflow(uint8 _num1, uint8 _num2) public {
        // a = _num1.add(_num2);
        a = SafeMath.add(_num1, _num2);
    }
}

//0.8~ 부터는 솔리디티 내부 자체에서 오버플로우 에러 처리를 해줌 