// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//try-catch

/*
    - <어디에서 쓰는가?>
        외부 스마트 컨트랙의 함수를 부를 때
        외부 스마트 컨트랙을 생성할 때
        스마트 컨트랙 내에서 함수를 부를 때
*/


//외부 스마트 컨트랙을 생성할 때
contract character{
    string private name;
    uint256 private  power;

    constructor(string memory _name, uint256 _power){
        // revert("error");
        name = _name;
        power = _power;
    }
}

contract runner{
    event catchOnly(string _name, string _err);

    function playTryCatch(string memory _name, uint256 _power) public returns(bool successOrFail){
        
        //character 인스턴스화 
        try new character(_name, _power){
            revert("errors in the try/catch block");
            //try안에 revert가 있으면 -> catch잡기도 전에 에러 뜨고 종료 
            return true;


        //어떤 에런지 각각 잡을 필요가 없을 땐 그냥 catch만 써줘도 됨
        }catch {
            emit catchOnly("catch", "Errors!!");
            return false;
        }
    }
}


//스마트 컨트랙 내에서 함수를 부를 때
contract runner2{
    event catchOnly(string _name, string _err);

    function simple() public returns(uint256){
        return 4;
    }

    function playTryCatch() public returns(uint256, bool){

        //this -> runner2를 의미 
        try this.simple() returns (uint256 _value){
            //_value 에 4가 리턴되고 true
            return (_value, true);
        }catch {
            emit catchOnly("catch", "Errors!!");
            return (0, false);
        }
    
    }
}