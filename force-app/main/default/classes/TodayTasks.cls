public class TodayTasks {
    public TodayTasks(){
        takeShower();
        haveBreakfast();
        carServicing();
        movieWithGirlFriend();                
    }
    
    public static void takeShower(){
        System.debug('I am taking shower');        
    }
    public static void haveBreakfast(){
        System.debug('I am having BF');
    }
    @future
    public static void carServicing(){
        System.debug('Car is being repaired');
    }
    public static void movieWithGirlFriend(){
        System.debug('I am on Date');
    }
    
}