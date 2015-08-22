contract arst {
        mapping (bytes32 => uint) public uintStorage;

        function transmitInteger(address to, bytes4 signature, bytes32 key, uint value) public {
                to.call(signature, key, value);
        }

        function receiveInteger(bytes32 key, uint value) public {
                uintStorage[key] = value;
        }
}


contract Master is arst {
        function delegateAdd(address to, uint a, uint b) public returns (uint) {
                to.call(bytes4(sha3("doAdd(address,bytes4,bytes32,uint256,uint256)")), address(this), bytes4(sha3("receiveInteger(bytes32,uint256)")), 'test', a, b);
        }
}


contract Processor is arst {
        function add(uint a, uint b) public returns (uint) {
                return a + b;
        }

        function doAdd(address to, bytes4 signature, bytes32 key, uint a, uint b) {
                uint value = add(a, b);
                transmitInteger(to, signature, key, value);
        }
}
