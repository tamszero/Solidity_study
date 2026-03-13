//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec2{



    //data type은 총 4가지
    //1. boolean : true / false
    bool public b = false;

    bool public b1 = !false;
    bool public b2 = false || true;
    bool public b3 = false == true;
    bool public b4 = false && true;

    //2. byte: 1~32비트까지 저장 가능
    bytes4 public  bt = 0x12345678;
    bytes public bt2 = "STRING";

    //3. address : 이 주소를 통해서, 디지털 코인을 보내기도하고, 스마트 컨트랙을 불러오기도 한다 
    address public addr = 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8;

    //4. int vs uint
    //int8 -> -2^7~2^7-1
    int8 public it = 4;
    //uint8 -> 0~2^8-1
    uint256 public uit = 132213;
    //uint public uit2 = 257; -> 범위 밖이라 오

}
