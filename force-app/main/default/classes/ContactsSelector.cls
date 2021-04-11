public class ContactsSelector extends Selector {
    private static ContactsSelector instance = null;

    public static ContactsSelector getInstance() {
        if (instance == null) {
            instance = new ContactsSelector();
        }
        return instance;
    }

    public ContactsSelector() {
        sObjType = Contact.getSObjectType();
        fieldSet = SObjectType.Contact.FieldSets.Selector;
    }

}
