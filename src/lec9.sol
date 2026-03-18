//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

//생성자 constructor -> 초기화를 위한


contract A{

    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age){
        name = _name;
        age = _age;
    }

    function change(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }

}

contract B{

    //인스턴스 값 초기화
    A instance = new A("Alice", 52);

    function get() public view returns(string memory, uint256){
        return (instance.name(), instance.age());
    }

    function change(string memory _name, uint256 _age) public {
        instance.change(_name, _age);
    }
}

//A만 배포하려면 -> 에러가남 -> constructor를 통해 초기화를 시켜주는게 필요하기 때문에 

//사실 인스턴스화 해서 멤버를 가져오는건 가스 소비가 큼