trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //create default salesforce ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);
        //call future method.
        SalesforceProjectTriggerHandler.updateProjectDescription(trigger.newmap.keySet());
        //update project here.
    }
    // if(trigger.isBefore && Trigger.isUpdate){
    //     SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    // }
    if (Trigger.isAfter && trigger.isUpdate) {
        SalesforceProjectTriggerHandler.spCompletedProject(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}