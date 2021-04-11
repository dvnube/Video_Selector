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
        if (ids == null || ids.isEmpty()) {
            throw new EmptyIdsException('O parâmetro "ids" deve conter um Set<Id> não vazio');
        }

        String query = buildQueryWithChildRelationship(new Set<Selector>{ContactsSelector.getInstance()});
        query += ' WHERE Id IN :ids';

        return (List<Account>) Database.query(query);
    }

    public List<Account> selectByIdWithContactsAndOpportunities(Set<Id> ids) {
        if (ids == null || ids.isEmpty()) {
            throw new EmptyIdsException('O parâmetro "ids" deve conter um Set<Id> não vazio');
        }

        Set<Selector> instances = new Set<Selector>();
        instances.add(ContactsSelector.getInstance());
        instances.add(OpportunitiesSelector.getInstance());

        String query = buildQueryWithChildRelationship(instances);
        query += ' WHERE Id IN :ids';

        return (List<Account>) Database.query(query);
    }

    private String buildWhereClauseIdIn(Set<Id> ids) {

    }
}
