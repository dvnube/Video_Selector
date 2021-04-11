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

    public List<Opportunity> selectByStageNames(Set<String> stageNames) {
        String query = buildQuery();
        query += ' WHERE StageName IN :stageNames';

        return (List<Opportunity>) Database.query(query);
    }

}

