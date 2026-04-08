// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


/*
<enum>
: 상수 세트 타입 -> 사람이 읽을 수 있게, 사용자/개발자에 의해 정의가 가능하다

    enum 이름 {
        
    }


*/


contract lec38{

    enum CarStatus{

        TurnOff, // 0
        TurnOn, //1
        Driving, //2
        Stop //3
        
    }

    //carstatus라는 변수 생성 
    CarStatus public carstatus;

    constructor(){
        //배포시, 생성자에 의해 carstatus는 turnoff가 됨 
        carstatus = CarStatus.TurnOff;
    }

    //carstatus타입을 숫자로 출력하기 위해 uint256으로 형변환을 해줌  
    event carCurrentStatus(CarStatus _carStatus, uint256 _carStatusInInt);

    function turnOnCar() public {
        //CarStatus(0) 으로 써도 똑같음 
        require(carstatus == CarStatus.TurnOff, "To turn on, your car must be turned off");
        carstatus = CarStatus.TurnOn;
        emit carCurrentStatus(carstatus, uint256(carstatus));
    }

    function DrivingCar() public {
        require(carstatus == CarStatus.TurnOn, "To drive a car, your car must be turned on");
        carstatus = CarStatus.Driving;
        emit carCurrentStatus(carstatus, uint256(carstatus));

    }

    function StopCar() public {
        require(carstatus == CarStatus.Driving, "To stop a car, your car must be driving");
        carstatus = CarStatus.Stop;
        emit carCurrentStatus(carstatus, uint256(carstatus));   
    }

    function turnOffCar() public {
        require(carstatus == CarStatus.TurnOn || carstatus == CarStatus.Stop, "To turn off, your car must be turned on or driving");
        carstatus = CarStatus.TurnOff;
        emit carCurrentStatus(carstatus, uint256(carstatus));

    }

    function CheckStatus() public view returns(CarStatus){
        return carstatus;
    }
}