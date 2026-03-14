//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec7{

    /*
    storage: 대부분의 변수, 함수들이 저장되며, 영속적으로 저장되어 가스 비용이 비싸다.
    memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장된다. 그러나 storage처럼 영속적이지 않고, 함수 내에서만 유효하기에 storage보다 싸다.
    Colldata: 주로 external function의 파라미터에서 사용된다.
    stack: EVM(ethereum virtual machine)에서 stack data를 관리할 때 쓰는 영역인데 1024Mb로 제한적이다.
    */

    //function -string. -> string은 기본 데이터타입X 레퍼런스임
    // 파라미터나 리턴값으로 쓸 때 memory를 붙여줘야함
    function get_string(string memory _str) public pure returns(string memory){
        return _str;
    } //함수 내에서만 사용하기 때문에 pure를 붙였음

    //uint같은 건 기본 데이터 타입이기 때문에 memory붙일 필요 X 
}