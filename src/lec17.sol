// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//mapping : 키와 벨류값으로 이루어짐
//length가 없다 

contract lec17{
    //mapping정의 
    //mapping(키 타입 => 벨류타입) 접근제한자 이름 
    mapping(string=>uint256) private priceList;
    mapping(uint256=>string) private nameList;
    mapping(uint256=>uint256) private ageList;
    
    //맵정의 
    function setAgeList(uint256 _key,uint256 _age) public {
        ageList[_key] = _age;
    }
    
    //맵출력 
    function getAge(uint256 _key) public view returns(uint256){
        return ageList[_key];
    }
    
    function setNameList(uint256 _key,string memory _name) public {
        nameList[_key] = _name;
    }
    
    function getName(uint256 _key) public view returns(string memory){
        return nameList[_key];
    }
    
    function setPriceList(string memory _itemName,uint256 _price) public {
        priceList[_itemName] = _price;
    }
    
    function getPriceList(string memory _key) public view returns(uint256){
        return priceList[_key];
    }
    
}