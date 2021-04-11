public class OpportunitiesSelector extends Selector {
    private static OpportunitiesSelector instance = null;

    public static OpportunitiesSelector getInstance() {
        if (instance == null) {
            instance = new OpportunitiesSelector();
        }
        return instance;
    }

    public OpportunitiesSelector() {
        sObjType = Opportunity.getSObjectType();
        fieldSet = SObjectType.Opportunity.FieldSets.Selector;
    }

}

