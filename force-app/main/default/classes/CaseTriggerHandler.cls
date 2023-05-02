public class CaseTriggerHandler 
{
    public static void afterInsert(Map<Id,Case> newMap){
        
        List<Case> caseList = new List<Case>();
        Map<Id,Account> accIdMap = new Map<Id,Account>();
        
        for(Case cs: newMap.values()){
            if(String.isNotBlank(cs.AccountId)){
                caseList.add(cs);
                //CaseTriggerHelper.updateAccountWithLastestCaseNumber(Case cs, accIdMap);
            }
        }
        
        for(Case cs: caseList){
            if(accIdMap.containsKey(cs.AccountId)){
                Account acc = accIdMap.get(cs.AccountId);
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accIdMap.put(cs.AccountId,acc);
            } else{
                Account acc = new Account();
                acc.Id = cs.AccountId;
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accIdMap.put(cs.AccountId,acc);
            }
        }
        
        if(!accIdMap.keySet().isEmpty()){
            update accIdMap.values();
        }
    }
}