public class OpportunityTriggerHandler 
{
    public static void afterInsert(Map<Id,Opportunity> newOppMap)
    {
       
        for(Opportunity opp:newOppMap.values())
        {
            if(string.isBlank(opp.AccountId))
            {
                OpportunityTriggerHelper.createAccUpdateOppAmount(opp); 
            }
                             
        }
        
    }
}