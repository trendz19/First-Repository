public class ContactTriggerHandler 
{
    public static void afterInsert(List<Contact> newContactsList)
    {
        Set<Id> accIds = new Set<Id>();
        for(Contact con:newContactsList)
        {
            accIds.add(con.AccountId);
        }
        
        List<Account> contactsRelatedToAccounts =[SELECT Id,No_of_Contacts__c,Sum_of_Amount__c,(SELECT Id,Amount__c FROM Contacts) FROM Account WHERE Id IN :accIds];
        for(Account acc:contactsRelatedToAccounts)
        {
            acc.No_of_Contacts__c=acc.Contacts.Size();
            Decimal sumOfAllAmounts=0;
            for(Contact con:acc.Contacts)
            {
                sumOfAllAmounts=sumOfAllAmounts+con.Amount__c;
            }
            acc.Sum_of_Amount__c=sumOfAllAmounts;
        }
        update contactsRelatedToAccounts;
    }
    
    public static void afterDelete(List<Contact> oldContactsList)
    {
        Set<Id> accIds1=new Set<Id>();
        for(Contact con1:oldContactsList)
        {
            accIds1.add(con1.AccountId);
        }
        List<Account> contactsRelatedToAccounts1=[SELECT Id,No_of_Contacts__c,Sum_of_Amount__c,(SELECT Id,Amount__c FROM Contacts) FROM Account WHERE Id IN :accIds1];
        for(Account acc1:contactsRelatedToAccounts1)
        {
            acc1.No_of_Contacts__c= acc1.Contacts.Size();
            Decimal sumOfAllAmounts=0;
            for(Contact con:acc1.Contacts)
            {
                sumOfAllAmounts=sumOfAllAmounts+con.Amount__c;
            }
            acc1.Sum_of_Amount__c=sumOfAllAmounts;
        }
        update contactsRelatedToAccounts1;
    }
    
    public static void afterUpdate(List<Contact> newContactsList1, Map<Id,Contact> oldConMap)
    {
        Set<Id> accIds2= new Set<Id>();
        for(Contact con2:newContactsList1)
        {
            accIds2.add(con2.AccountId);
            Contact OldvalueOfThatContact=oldConMap.get(con2.Id);
            accIds2.add(OldvalueOfThatContact.AccountId);
        }
        List<Account> contactsRelatedToAccounts= [SELECT Id,No_of_Contacts__c,Sum_of_Amount__c,(SELECT Id, Amount__c FROM Contacts) FROM Account WHERE Id IN :accIds2];
        for(Account acc2:contactsRelatedToAccounts)
        {
            acc2.No_of_Contacts__c=acc2.Contacts.Size();
            Decimal sumOfAllAmounts=0;
            for(Contact con:acc2.Contacts)
            {
                sumOfAllAmounts=sumOfAllAmounts+con.Amount__c;
            }
            acc2.Sum_of_Amount__c=sumOfAllAmounts;
        }
        update contactsRelatedToAccounts;
    }
}