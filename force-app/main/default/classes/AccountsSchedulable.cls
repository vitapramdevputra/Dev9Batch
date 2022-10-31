public class AccountsSchedulable implements Schedulable {
    public void execute(SchedulableContext sc){
        //here we can write any apex code.
        //list
        //for each
        //update

        //to call batch here.
        database.executeBatch(new accountsBatch());
    }
}
