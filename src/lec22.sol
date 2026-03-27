// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//반복문
//for, while, do-while


contract lec22{
    //for loop
    event CountryIndexName(uint indexed _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    function forLoopEvents() public {
        for(uint256 i = 0; i<countryList.length; i++){
            emit CountryIndexName(i, countryList[i]);
        }
    }

    //while loop
    function whileLoopEvents() public {
        uint256 i = 0;
        while (i < countryList.length){
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
    }

    //do-while문
    function dowhileloopEvent() public {
        uint256 i = 0;
        do{
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
        while (i < countryList.length);
    }
}