//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;


//상속

contract Father{
    string public familyName = "Kim";
    string public  givenName = "Jung";
    uint public money = 100;

    constructor(string memory _givenName) public {
        givenName = _givenName;
    }

    function getFamilyName() view public returns (string memory){
        return familyName;
    }

    function getGivenName() view  public  returns(string memory){
        return givenName;
    }

    function getMoney() view public returns (uint256){
        return money;
    }

}

//Son에게 Father 상속하기 
//James로  givenName 초기
contract Son is Father("James") {



}