public class OpportunityTriggerHelper 
{
    public static void createAccUpdateOppAmount(Opportunity op2)
    {
        List<Account> accList=new List<Account>();
        List<Opportunity> oppList= new List<Opportunity>();
        
        Account acc= new Account();
        acc.Name =op2.Name;
        acc.Recent_Opportunity_Amount__c=op2.Amount;
        acc.Id=op2.AccountId;
        accList.add(acc);
        
        if(accList.Size()>0)
        {
            insert accList;
        }
        
        Opportunity opp=new Opportunity();
        opp.Id=op2.Id;
        opp.AccountId=acc.Id;
        oppList.add(opp);
        
        if(oppList.Size()>0)
        {
            update oppList;
        }
    }
}