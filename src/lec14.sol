// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//indexed 키워드 사용 -> 특정 이벤트만 필터링하여 출력 가능 
contract lec14  {
    event numberTracker(uint256 num, string str); //필터링 불가
    event numberTracker2(uint256 indexed num, string str);

    uint256 num =0;
    function PushEvent(string memory _str) public {
        emit numberTracker(num,_str);
        emit numberTracker2(num,_str);
        num ++;
    }
}