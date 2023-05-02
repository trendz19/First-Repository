public class TestDemoQueueable implements Queueable{
    public void execute(QueueableContext qContx){
        Delete [Select Id from Case WHERE createddate=LAST_YEAR];
    }

}