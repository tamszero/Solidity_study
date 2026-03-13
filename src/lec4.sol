//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec3{

    //코드 길이에 따라 가스 길이가 책정 -> string 이나 modifer를 사용하는경우 가스가 더 많이 들어감

    //1 ether = 10^9 Gwei = 10^18 wei
    //0.000000000000000001 ether = 1^-18 = 1 wei
    //0.01 ether = 10^16wei

    // 가스를 만든이유는 DDoS(Distributed Denial of Service) 공격에서 좀 더 자유로워 지기 위해서 


    uint256 public value = 1 ether;
    uint256 public value2 = 1 wei;
    uint256 public value3 = 1 gwei;
}
