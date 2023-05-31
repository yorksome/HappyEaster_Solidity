//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract HappyEaster {
    uint256 public year;
    uint256 public month;
    uint256 public day;
    uint256 public date;

    function markOnChain(uint256 _year, uint256 _month, uint256 _day) public {
        require(_year <= 9999, "Invalid year input");
        require(_month >= 1 && _month <= 12, "Invalid month input");
        require(_day >= 1 && _day <= 31, "Invalid day input");

        year = _year;
        month = _month;
        day = _day;
    }

    function get() public view returns (string memory) {
        string memory dayStr = uint2str(day);
        string memory monthStr = uint2str(month);
        string memory yearStr = uint2str(year);
        string memory result = string(
            abi.encodePacked(
                "Happy Easter ",
                yearStr,
                ".",
                monthStr,
                ".",
                dayStr 
            )
        );
        return result;
    }

    function uint2str(uint _i) internal pure returns (string memory str) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = uint8(48 + uint8(_i % 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        str = string(bstr);
    }
    
}
