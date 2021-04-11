public class GenericController {
    @AuraEnabled
    public static List<Account> getAccountsWithContactsAndOpportunities(List<Id> ids) {
        try {
            Set<Selector> instances = new Set<Selector>();
            instances.add(ContactsSelector.getInstance());
            instances.add(OpportunitiesSelector.getInstance());

            return (List<Account>) AccountsSelector.getInstance().selectByIdWithChilds(new Set<Id>(ids), instances);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Contact> getContactsWithOpportunities(List<Id> ids) {
        try {
            Set<Selector> instances = new Set<Selector>();
            instances.add(OpportunitiesSelector.getInstance());

            return (List<Contact>) ContactsSelector.getInstance().selectByIdWithChilds(new Set<Id>(ids), instances);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Opportunity> getAllOpportunities() {
        try {
            return (List<Opportunity>) OpportunitiesSelector.getInstance().selectAll();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


}
