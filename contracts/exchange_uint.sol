contract exchange_uint {
        mapping (bytes32 => uint256) public uint256Storage;
        mapping (bytes32 => uint128) public uint128Storage;

        function transmitInteger(address to, bytes4 signature, bytes32 key, uint value, uint16 numBits) public {
                to.call(signature, key, value, numBits);
        }

        function receiveInteger(bytes32 key, uint value, uint16 numBits) public {
                if numBits == 256;
                    uint256Storage[key] = value;
                if numBits == 128;
                    uint128Storage[key] = value;
        }
}
