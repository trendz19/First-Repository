public class FirstJobQueueable implements Queueable {
    public void execute(QueueableContext qContx1){
        Delete[Select id from Account where createddate=LAST_YEAR];
        
        //Chain any job if you want
        System.enqueueJob(new SecondJobQueueable());
    }
}