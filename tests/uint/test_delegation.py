import os


project_dir = os.path.join(os.path.dirname(__file__), 'projects/test-01')


def test_getting_account_balance(deployed_contracts, eth_coinbase):
    master = deployed_contracts.Master
    processor = deployed_contracts.Processor

    pre_value = master.uintStorage.call('test', _from=eth_coinbase)
    assert pre_value == 0
    master.delegateAdd(processor.address[2:], 3, 4, _from=eth_coinbase)

    post_value = master.uintStorage.call('test', _from=eth_coinbase)
    assert post_value == 7
