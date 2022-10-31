trigger CaseTrigger on Case (before insert, before update) {
    if (trigger.isInsert) {
        system.debug('before insert case');
    }
    if (trigger.isUpdate) {
        CaseTriggerHandler.countTriggerExecution++;
        system.debug('case trigger execution count ==> ' + CaseTriggerHandler.countTriggerExecution);
        CaseTriggerHandler.countTriggerRecords += Trigger.size;
        system.debug('case trigger record count ==> ' + CaseTriggerHandler.countTriggerRecords);
    }
    
}