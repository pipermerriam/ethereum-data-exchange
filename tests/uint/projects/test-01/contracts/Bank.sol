import "exchange_uint";


contract Bank is exchange_uint {
        mapping (bytes32 => address) public accounts;

        function registerAccountant(bytes32 accountNumber, address accountant) public {
                accounts[accountNumber] = accountant;
        }

        function getAccountBalance(bytes32 accountNumber) public returns (uint) {
                address accountant = accountant[accountNumber];
                bytes4 remoteFuncSig = bytes4(sha3("retrieveAccountBalance(address,bytes4,bytes32,bytes32)"));
                bytes4 receiveFuncSig = bytes4(sha3("receiveInteger(bytes32,uint256,uint16)"));
                accountant.call(remoteFuncSig, receiveFuncSig, 'test-key')
        }
}
