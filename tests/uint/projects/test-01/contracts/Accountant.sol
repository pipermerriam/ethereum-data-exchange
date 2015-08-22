import "exchange_uint";


contract Accountant is exchange_uint {
        uint balance;

        function getAccountBalance() public returns (uint) {
            return balance;
        }

        function retrieveAccountBalance(bytes4 signature, bytes32 key) {
            transmitInteger(msg.sender, signature, key, balance, 256);
        }
}
