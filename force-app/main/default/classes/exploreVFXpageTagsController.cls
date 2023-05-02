public class exploreVFXpageTagsController {
    
    public String name {set;get;}
    public String description {set;get;}
    public String accessKey {set;get;}
    public String passkey {set; get;}
    public Boolean travelRequired {set;get;}
    
    public exploreVFXpageTagsController(){
        accessKey='akgnowlshgwyhosg';
    }
    
    public void save(){
        System.debug('This is save method');
    }
    
    public void cancel(){
        System.debug('This is cancel method');
    }
}