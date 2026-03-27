// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//반복문의 break, continue
//continue : 다음 반복문으로 이동
//break : 반복문을 끝냄

contract lec23{

    event CountryIndexName(uint indexed _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    function useContinue() public {
        for(uint256 i = 0; i<countryList.length; i++){
            if(i % 2 == 1){
                continue ;
            }
            //짝수일때만 출력하도록 함 
            emit CountryIndexName(i, countryList[i]);
        }
    }

    function useBreak() public {
        for(uint256 i = 0; i < countryList.length; i++){
            if(i==2){
                break; //루프를 완전히 끝냄
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }



}