//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec5{

    /*
    function 이름 () public/ private/ internal/ external){} 

    <4개의 접근 제한자>
    public : 모든 곳에서 접근 가능
    external: 모든 곳에서 접근 가능 But, external이 정의된 자기자신 컨트랙 내에서는 접근 불가
    private: 오직 pricate이 정의된 자기 컨트랙트에서만 가능(상속받은 자식도 접근 불가)
    internal: 오직 정의된 자기 컨트랙에서만 가능, internal이 정의된 컨트랙을 상속받은 컨트랙도 접근 가능

    */

    //1. public
    uint256 public a = 5;

    //2. private
    uint256 private a2 = 5; //->얘는 배포해도 안 보임 -> lec5 컨트랙 외부에서 배포가 이루어지기 때문에

    
    

}

contract public_example{
        uint256 public a = 3;

        function changeA(uint256 _value) public {
            a = _value;
        }
        function get_a() view public returns (uint256){
            return a;
        }

    }

contract public_example_2{

        public_example instance = new public_example();

        function changeA_2(uint256 _value) public {
            instance.changeA(_value);
        

        }
        function use_public_example_a() view public returns (uint256){
            return instance.get_a();
        }
    }





contract external_example{
        //uint256 external  a = 3; 

        function changeA(uint256 _value) external {
            a = _value; //external로 정의된 a를 사용했기 때문에 오류가 남 
        }
        function get_a() view public returns (uint256){
            return a;
        }

    }


    