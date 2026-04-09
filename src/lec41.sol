// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// ./ -> 같은 폴더 내에 
// ../ -> 외부 폴더에 
// import "깃주소"

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4-solc-0.7/contracts/math/SafeMath.sol";
//import "./lec41_1.sol";


contract lec41{
    //라이브러리 사용 
    using SafeMath for uint256;
    uint256 public a;

    uint256 maxinum = 2 ** 256 -1; //= 2^256
    function becomeOverflow(uint256 _num1, uint256 _num2) public {
        a = _num1.add(_num2);
    }
}