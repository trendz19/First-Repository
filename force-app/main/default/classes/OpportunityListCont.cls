public class OpportunityListCont {

   public ApexPages.StandardSetController opps{
   get{
       if(opps==null){
           opps=new ApexPages.StandardSetController(Database.getQueryLocator([Select Name, CloseDate from Opportunity]));
       }
       return opps;
   }
   set;
   
   }

    public List<Opportunity> getOpportunities() {
        return (List<Opportunity>)opps.getRecords();
    }

}