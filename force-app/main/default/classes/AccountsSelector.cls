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

    public List<Account> selectByIdWithContacts(Set<Id> ids) {
        String query = buildQueryWithChildRelationship(ContactsSelector.getInstance());
        if (ids != null && !ids.isEmpty()) {
            query += ' WHERE Id IN :ids';
        }

        return (List<Account>) Database.query(query);
    }
}