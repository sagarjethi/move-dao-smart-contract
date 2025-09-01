module addr::dao_test {
    use std::string::{Self, String};
    use std::option;
    use aptos_framework::aptos_coin::AptosCoin;
    use addr::governance;

    #[test_only]
    use aptos_framework::account;
    #[test_only]
    use aptos_framework::coin;

    #[test]
    fun initialize_and_propose() {
        let admin = @0xA11CE;
        let admin_signer = account::create_signer_for_test(admin);

        governance::initialize_dao(
            &admin_signer,
            string::utf8(b"Test DAO"),
            86400,
            3600,
            2500,
            0,
            0,
            false,
            option::none<address>()
        );

        let cfg = governance::get_dao_config(admin);
        assert!(cfg.voting_period == 86400, 100);
    }
}
