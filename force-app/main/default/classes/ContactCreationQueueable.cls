public class ContactCreationQueueable implements Queueable{
    private List<Account> accListToCreateContacts;
    
    public ContactCreationQueueable(List<Account> accListFromTrigger){
        this.accListToCreateContacts = accListFromTrigger;
    }
    
    public void execute(QueueableContext qContx3){
        List<Contact> conListToInsert = new List<Contact>();
        for(Account acc:accListToCreateContacts){
            Contact con= new Contact();
            con.LastName= acc.Name;
            con.AccountId= acc.Id;
            conListToInsert.add(con);
        }
        if(conListToInsert.size()>0)
        Insert conListToInsert;
    }
}