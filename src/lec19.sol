// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//변수? 의 값만 변경한다고 맵,배열의 값이 바뀌지 않음
//update를 꼭 해줘야함 !

contract lec19{
   uint256 num = 89;
   mapping(uint256 => uint256) numMap;
   uint256[] numArray;
   
   //num 
   function changeNum(uint256 _num) public{
       num = _num;
   }
   function showNum() public view returns(uint256){
      return num;
   }
   
   function numMapAdd() public{
       numMap[0] = num;
   }
   function showNumMap() public view returns(uint256){
       return numMap[0];
   }

   //update
   function UpdateMap() public{
       numMap[0] = num;
   }
   
   function numArrayAdd() public{
       numArray.push(num);
   }
   function showNumArray() public view returns(uint256){
       return numArray[0];
   }
   //update
   function updateArray() public {
       numArray[0] = num;
   }
   
}