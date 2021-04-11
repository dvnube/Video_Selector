public class AccountsSelector extends Selector {
    private static AccountsSelector instance = null;

    public static AccountsSelector getInstance() {
        if (instance == null) {
            instance = new AccountsSelector();
        }
        return instance;
    }

    public AccountsSelector() {
        sObjType = Account.getSObjectType();
        fieldSet = SObjectType.Account.FieldSets.Selector;
    }

}

