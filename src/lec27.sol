// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//에러 핸들러 try/catch

/*
    0.6버전 이후

    - <try catch 특징>
    1. try catch문 안에서, assert/revert/require을 통해 에러가 나면 -> catch는 에러를 잡지 못하고, 
        개발자가 의도한지 알고 정상적으로 프로그램을 끝냄
    2. try catch문 밖에서 assert/revert/require을 통해 에러가 난다면 catch는 에러를 잡고, 에러를 핸들할 수 있음

    - <3가지의 catch>
    catch Error(String memory reason){...} -> revert나 require을 통해 생성된 에러용도
    catch Panic(uint errorCode){ ... } -> assert를 통해 생성된 에러가 날 때 이 catch에서 잡힌다
        errorCode는 솔리디티에서 정의 panic 에러 별로 나옴
        ex)
        0x12: If you divide or modulo by zero
        ->나누기가 0이된다면 0x12(=18) errorcode를 리턴한다

        ** panic은 0.8.1버전 이후부터 존재 **

    catch(bytesmemoryLowLevelData){ ... } -> 로우 레벨에러를 잡는다

    - <어디서 쓰는가?>
    외부 스마트 컨트랙의 함수를 부를 때: 다른 스마트 컨트랙을 인스턴스화 하여, try/catch문이 있는 스마트 컨트랙의 함수를 불러와서 사용
    외부 스마트 컨트랙을 생설 할 때: 다른 스마트컨트랙을 인스턴스화 생성할 때 씀
    스마트 컨트랙 내에서 함수를 부를 때: this를 통해 try/catch를 씀

*/


// 외부 스마트 컨트랙의 함수를 부를 때
contract math{
    function division(uint256 _num1, uint256 _num2) public pure returns(uint256){
        require(_num1<10, "num1 should not be more than 10");
        return _num1 / _num2;
    }

}

contract runner{
    event catchErr(string _name, string _err);
    event catchPanic(string _name, uint256 _err);
    event catchLowLevelErr(string _name, bytes _err);

    math public mathInstance = new math();

    function playTryCatch(uint256 _num1, uint256 _num2) public returns(uint256, bool){
        
        //리턴값을 넘겨주기 위해서 value에 넣어줌 
        try mathInstance.division(_num1, _num2) returns(uint256 value){
            return (value, true);

        }catch Error(string memory _err){
            emit catchErr("revert/require", _err);
            return (0, false);

        }catch Panic(uint256 _errorCode){
            //만약 _num2에 0 을 넣으면 -> errorcode가 18이 나올거임 
            emit catchPanic("assertError/Panic", _errorCode);
            return (0, false);
        }catch (bytes memory _errorCode){
            emit catchLowLevelErr("LowLevelError", _errorCode);
            return (0, false);
        }

    
    }
}