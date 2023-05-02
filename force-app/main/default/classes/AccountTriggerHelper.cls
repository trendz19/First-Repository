public class AccountTriggerHelper 
{
    public static void updateRating(Account a)
    {
        a.Rating='Hot';
    }
    public static void CopyBillingAddressToShipping(Account ac)
    {
        /*ac.ShippingStreet = String.isNotBlank(ac.BillingStreet) ? ac.BillingStreet : ac.ShippingStreet;
        
        if(String.isNotBlank(ac.BillingStreet)){
            ac.ShippingStreet = ac.BillingStreet;
        }
        ac.ShippingStreet = String.isNotBlank(ac.ShippingStreet) ? ac.ShippingStreet : ac.BillingStreet;
        
        if(String.isBlank(ac.ShippingStreet)){
            ac.ShippingStreet = ac.BillingStreet;
        }*/
        ac.ShippingStreet = ac.BillingStreet;
        ac.ShippingCity = ac.BillingCity;
        ac.ShippingCountry = ac.BillingCountry;
        ac.ShippingState = ac.BillingState;
        ac.ShippingPostalCode = ac.BillingPostalCode;
    }
    public static List<Contact> createContact(Account a2, List<Contact> conList1)
    {
        Contact c1= new Contact();
        c1.LastName=a2.Name+' '+'Contact';
        c1.Phone=a2.Phone;
        c1.AccountId=a2.Id;
        conList1.add(c1);
        return conList1;
    }
    public static List<Opportunity> createOpportunity(Account a3, List<Opportunity> oppList1)
    {
        Opportunity opp=new Opportunity();
        opp.Name = a3.Name+' '+'Opportunity';
        opp.AccountId= a3.Id;
        opp.CloseDate=date.today()+30;
        opp.StageName='Prospecting';
        oppList1.add(opp);
        return oppList1;
    }
    public static void createCaseOnAccount()
    {
        
    }
}