public class AccountTriggerHandler 
{
    public static void beforeInsert(List<Account> accList)
    {
       for(Account acc:accList)
       {
          if(string.isNotBlank(acc.Industry) && acc.Industry == 'Media')
          {
              AccountTriggerHelper.updateRating(acc); 
          }
          if(acc.CopyBillingToShipping__c)
          {
              AccountTriggerHelper.CopyBillingAddressToShipping(acc);
          }
       }
    }
    public static void afterInsert(Map<Id,Account> newAccMap)
    {  
       List<Contact> conList= new List<Contact>();
       List<Opportunity> oppList= new List<Opportunity>();
       for(Account a1:newAccMap.values())
       {
             AccountTriggerHelper.createContact(a1, conList);
       if(a1.Active__c =='Yes')
          {   
             AccountTriggerHelper.createOpportunity(a1, oppList);
          }     
       }
        if(conList.Size()>0)
        {
           insert conList; 
        }
        if(oppList.Size()>0)
        {
           insert oppList;
        }
    }
    
    public static void beforeUpdate(List<Account> accList, Map<Id,Account> oldAccIdMap)
    {
        for(Account acc:accList)
        {
            if(acc.Phone!=oldAccIdMap.get(acc.Id).Phone)
            {
             String NewValue=acc.Phone;
             String OldValue=oldAccIdMap.get(acc.Id).Phone;
             acc.Description= 'Phone is Updated! Old Value = '+ OldValue + ' & New Value = ' +NewValue;
            }
        }
    }
}