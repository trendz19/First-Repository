public class SecondJobQueueable implements Queueable{
    public void execute(QueueableContext qContx2){
        Delete [Select id from Contact where createddate=LAST_YEAR];
    }
}