// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


/*
interface : 스마트컨트랙 내에서 정의되어야 할 필요한 것

1. 함수는 external로 표시
2. enum, structs 가능
3. 변수, 생성자 불가

*/

interface ItemInfo {
    struct item{
        string name;
        uint256 price;
    }   

    //external필수!
    function addItemInfo(string memory _name, uint256 _price) external ;
    function getItemInfo(uint256 _index) external view returns(item memory);
}

//인터페이스에 있는 함수들을 전부 똑같이 써줘야함 
contract lec39 is ItemInfo{
    item[] public itemList;
    uint256[] public a;

    function addItemInfo(string memory _name, uint256 _price) override public {
        itemList.push(item(_name, _price));
    }
    function getItemInfo(uint256 _index) override public view returns(item memory){
        return itemList[_index];
    }
}