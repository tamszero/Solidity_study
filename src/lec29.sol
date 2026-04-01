// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//return 명 명시하기
//주로 리턴 명이 많아질 때 이렇게 써줌

contract lec29{

    //리턴명 없음 
    function add(uint256 _num1, uint256 _num2) public pure returns(uint256){

        uint256 total = _num1 + _num2;
        return total;
    }

    //리턴명 있음
    function add2(uint256 _num1, uint256 _num2) public pure returns(uint256 total){
        total = _num1 + _num2;
        return total;
    }
}

