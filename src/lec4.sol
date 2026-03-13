//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec4{

    //function정의하기
    //함수 정의 경우의 수 3가지
    
    uint256 public a = 3;

    //1. parameter와 return값이 없는 function 정의
    function changeA1() public {
        a = 5;
    }

    //2. parameter는 있고, return값이 없는 function 정의
    function changeA2(uint256 _value) public{
        a = _value;
    }

    //3. parameter있고, return 값도 있는 function 정의
    function changeA3(uint256 _value) public returns(uint256){
        a = _value;
        return a;
    }
}
