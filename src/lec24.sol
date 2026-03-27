// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

//Linear search

contract lec24{
    event CountryIndexName(uint indexed _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    function linearSearch(string memory _search) public view returns(uint256, string memory){

        for(uint256 i=0; i<countryList.length; i++){
            //솔리디티에서 스트링 자체는 비교 못함
            //바이트로 변환 -> 해시값을 비교 
            if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search))){
                return (i, countryList[i]);
            }
    
        }
        return (0, "null");
    }
}