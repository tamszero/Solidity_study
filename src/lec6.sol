//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec5{

    /*
    function 이름 () public/ private/ internal/ external){} 
    */

    /*
    function get_a() external view returns (uint256) 
    */

    /*
    view : function 밖의 변수들을 읽을 수 있으나 변경 불가능
    pure : function 밖의 변수들을 읽을 수 없음, 변경도 불가능
    view,pure 둘다 명시 안할 때 : function 밖의 변수들을 읽어서, 변경을 해야함
    */

    //1. view
    uint256 public a = 1;

    function read_a() public view returns (uint256){
        return a+2; //-> 변경 불가능하므로 func값은 3 이지만, a=1이 바뀌진 않음.
    }

    //2. pure
    function read_a2() public  pure returns(uint256){
        uint256 b = 1;
        return  4 + 2+ b;
    }

    //3. 둘다 x ->리턴값이 따로 나오지 않고, explain contract를 통해 확인이 가능함
    function read_a3() public returns(uint256){
        a = 13;
        return a;
    }






}