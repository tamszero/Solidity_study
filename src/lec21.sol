// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//if문

contract lec21{

    //case1 : if-else문
    //else를 안 써도 실행이 됨 
    string private outcome = "";
    function isIt5(uint256 _number) public returns(string memory){
        if(_number == 5){
            outcome = "Yes it is 5";
            return outcome;
        }
        else {
            outcome = "No, it is not 5";
            return outcome;
        }
    }

    //case2: if-else if-else
    function isIt5or3or1(uint256 _number) public returns(string memory){
        if(_number == 5){
            outcome = "Yes it is 5";
            return outcome;
        }
        else if(_number == 3){
            outcome = "Yes it is 3";
            return outcome;
        }
        else if(_number == 1){
            outcome = "Yes it is 1";
            return outcome;
        }
        else {
            outcome = "No it is not 5,3 or 1";
            return outcome;
        }
    }
}