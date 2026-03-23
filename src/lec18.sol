// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;
 

//배열 array 
//0부터 시작하는 인덱스, 길이 length값이 있다

contract lec18{
    
    //Array정의
    //타입[] 접근제한자 이름 
    uint256[] public ageArray;
    uint256[10] public ageFixedSizeArray; //미리 길이까지 정의 
    string[] public nameArray= ["Kal","Jhon","Kerri"]; //미리 값까지 넣기 
  
    //배열 길이 
    function AgeLength()public view returns(uint256) {
        return ageArray.length;
    }
    
    //배열에 값 추가 
    function AgePush(uint256 _age)public{
        ageArray.push(_age);
    }
    //배열의 값 변경 
    function AgeChange(uint256 _index, uint256 _age)public{
        ageArray[_index] = _age;
    }
    //배열의 값 출력 
    function AgeGet(uint256 _index)public view returns(uint256){
        return ageArray[_index];
    }
    //pop -> 가장 최신 값 삭제됨 -> real삭제 -> 배열 길이 줄어듬 
    function AgePop()public {
        ageArray.pop();
    }
    //delete -> 값을 0으로 변경 -> 가짜삭제 -> 배열 길이 똑같음 
    function AgeDelete(uint256 _index)public {
        delete ageArray[_index];
    }


}