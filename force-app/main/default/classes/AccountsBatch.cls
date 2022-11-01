//Updating description of ALL accounts.
//also getting statistics using stateful
public class AccountsBatch  implements Database.Batchable<SObject>, database.stateful{
    integer numberOfRecords = 0;
    integer count = 0;
    //start method soql query
    public Database.QueryLocator start(Database.BatchableContext bc){
        //write query.
        //sobject is Account
        system.debug('batch started. congrats.');
        Database.QueryLocator ql = database.getQueryLocator([select id, description from account]);
        return ql;
    } 
    //update dml happening in execute method.
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

    //finish method called once all records are processed.
    public void finish(Database.BatchableContext bc){
        system.debug('finish method executed. Batch done. Simple.');
        system.debug('number of records updated: ' + numberOfRecords);
    }

}
