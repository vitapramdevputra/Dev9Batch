public class AccountsBatch  implements Database.Batchable<SObject>, database.stateful{
    integer numberOfRecords = 0;
    integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        //write query.
        //sobject is Account
        system.debug('batch started. congrats.');
        Database.QueryLocator ql = database.getQueryLocator([select id, description from account]);
        return ql;
    } 

    public void execute(Database.BatchableContext bc, List<account> scope){
        system.debug('execute method running.');
        //dmls
        for (account acc : scope) {
            acc.Description += '...Update via Batch.';
        }
        numberOfRecords+= scope.size();
        count++;
        system.debug('count is ' + count);
        system.debug('number of records updated till now is ' + numberOfRecords);
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        system.debug('finish method executed. Batch done. Simple.');
        system.debug('number of records updated: ' + numberOfRecords);
    }

}
