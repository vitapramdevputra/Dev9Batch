public with sharing class AccountQueueableExample implements Queueable {
    List<account> accList;
    public AccountQueueableExample(List<account> accList) {
        this.accList = accList;
    }

    public void execute(QueueableContext qc){
        List<account> updateAcc = new list<account>();
        for (account acc : accList) {
            Account a = new account();
            a.Id = acc.id;
            a.Name = acc.Name + ' -- SI';
            updateAcc.add(a);
        }
        update updateAcc;
    }

}
