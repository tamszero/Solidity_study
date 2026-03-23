// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    event FatherName(string name);
    function who() public virtual{
        emit FatherName("KimDaeho");
    }
}

contract Mother {
    event MotherName(string name);
    function who() public virtual{
        emit MotherName("leeSol");
    }
}

//오른쪽에 있을수록 최신으로 상속 받는 것이다
contract Son is Father, Mother{
    
    function who() public override(Father,Mother){
        super.who(); //이때 출력은 가장 최근 상속받은 Mother의 who() 결과가 나옴 
    }
}