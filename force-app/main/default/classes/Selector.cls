public virtual class Selector {

    public Schema.SObjectType sObjType;
    public Schema.FieldSet fieldSet;

    public String buildQuery() {
        String query = ' SELECT ';
        query += getFields(fieldSet);
        query += ' FROM ' + sObjType;

        return query;
    }
 
    public String buildQueryWithChildRelationship(Set<Selector> childsInstances) {
        String query = ' SELECT ';
        query += getFields(this.fieldSet);
        for (Selector childInstance : childsInstances) {
            query += buildRelationshipQuery(childInstance);
        }        
        query += ' FROM ' + this.sObjType;

        return query;
    }

    private String getFields(Schema.FieldSet fieldSet) {
        String fields = '';
        for (Schema.FieldSetMember f : fieldSet.getFields()) {
            fields += f.getFieldPath() + ', ';
        }
        fields = fields.substringBeforeLast(',');
        
        return fields;
    }

    private String buildRelationshipQuery(Selector childInstance) {
        String query = '';

        if (childInstance.fieldSet != null) {
            String relationshipName = getRelationshipName(childInstance.sObjType);
            if (String.isNotBlank(relationshipName)) {
                query += ' , ( ';
                query += childInstance.buildRelationshipQuery(relationshipName);
                query += ' ) ';
            }            
        }

        return query;
    }

    private String buildRelationshipQuery(String relationshipName) {
        String query = ' SELECT ';
        query += getFields(fieldSet);
        query += ' FROM ' + relationshipName;

        return query;
    }
    
    private String getRelationshipName(Schema.SObjectType childSObjectType) {
        for (Schema.ChildRelationship cr : this.sObjType.getDescribe().getChildRelationships()) {
            if (cr.getChildSObject() === childSObjectType) {
                return cr.getRelationshipName();
            }
        }
        
        return null;
    }

}
