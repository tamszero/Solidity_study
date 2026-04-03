// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//modifier
//여러 함수에 한번에 적용 가능
// 함수 본문 실행 전에 모디파이어의 조건이 먼저 평가, 조건 불충족 시 `revert`로 실행을 멈춤

contract lec30{

    //모디파이어의 파라미터가 없을 때
    modifier onlyAdults{
        revert("You are not allowed to pay for the cigarette");
        _; //함수 실행부 -> 함수가 어디에 적용이 되는지 ;
    }

    function BuyCigarette() public onlyAdults returns(string memory){
        return "Your payment is succeeded";
    }

    //모디파이어가 파라미터 값을 받을 때

    modifier onlyAdults2(uint256 _age){
        require(_age>18, "You are not allowed to pay the cigarette");
        _; //함수 실행부

    }

    function BuyCigarette2(uint256 _age) public onlyAdults2(_age) returns (string memory){
        return "Your payment is succeeded";
    }
        
    
    
    uint256 public num = 5;
    modifier numChange{
        _;
        num = 10;
    }
    function numChangeFunction() public numChange{
        num = 15;
    }

    //num의 값은 10이 됨

}