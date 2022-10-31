public class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
        try {
            List<Salesforce_Ticket__c> listST = new List<Salesforce_Ticket__c>();
            DefaultTicketInfo__c dt = DefaultTicketInfo__c.getOrgDefaults();

            for (salesforce_project__c eachSP : spTriggerNew) {
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = dt.Subject__c;
                st.Description__c = dt.description__c;
                st.Priority__c = 'Medium';
                st.Salesforce_Project__c = eachSP.id;
                listST.add(st);
            }
            if (!listST.isEmpty()) {
                insert listST;
            }
        } catch (Exception ex) {
            system.debug('exception ex: ' + ex);
            system.debug('contact admini');   
            //call the code to LOG ERROR.
            //throw ex;
            for (salesforce_project__c eachSP : spTriggerNew) {
                eachSP.addError('Error in creating default ticket. Please contact admin, not dev.');
            }
        }
    }

    public static void validateProjectCompletion(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld,
                             Map<id, salesforce_project__c> spTriggerNewMap, Map<id, salesforce_project__c> spTriggerOldMap) {
        //get project for which status is updated to 'Completed'
        //compare old and new status to get if project changed to completed.
        set<id> setProjectCompletedIds = new set<id>();
        for (salesforce_project__c eachSP : spTriggerNew) {
            if(spTriggerOldMap.get(eachSP.id).Status__c != spTriggerNewMap.get(eachSP.id).Status__c
            && eachSP.Status__c == 'Completed'){
                setProjectCompletedIds.add(eachSP.Id);
            }
        }

        //get all tickets which are not completed
        List<Salesforce_Ticket__c> listST = [select id, name, status__c, Salesforce_Project__c from Salesforce_Ticket__c
                                 where Salesforce_Project__c in :setProjectCompletedIds and status__c !='Completed'];

        for (Salesforce_Ticket__c eachST : listST) {
            Salesforce_Project__c sp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            sp.addError('Cannot complete project because all its tickets are not completed.');
        }
    }
    @future
    public static void updateProjectDescription(set<id> setIds) {
        system.debug('called from future.');
        system.debug('set of ids ==> ' + setIds);
        
        //fetch project records of given setIds.
        List<Salesforce_Project__c> listSP = [select id, description__c from Salesforce_Project__c where id in :setIds];

        //for each loop and update description of fetched projects
        for (salesforce_project__c sp : listSP) {
            sp.Description__c += '. updated from future it is.';
        }
        //update dml
        update listSP;
    }

    public static void spCompletedProject(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld,
                                Map<id, salesforce_project__c> spTriggerNewMap, Map<id, salesforce_project__c> spTriggerOldMap) {
        set<id> spIds = new set<id>();

        for (salesforce_project__c spNew : spTriggerNew) {
            salesforce_project__c spOld = spTriggerOldMap.get(spNew.Id);
            if (spNew.Status__c == 'Completed' && spOld.Status__c != 'Completed') {
                spIds.add(spNew.Id);
            }
        }

        system.debug('sp Ids where status is completed -> ' + spIds);
        //call future method and pass this spIds.
        if (!spIds.isEmpty()) {
            updateTicketStatusCompleted(spIds);
        }
        
    }

    @future
    private static void updateTicketStatusCompleted(set<id> spIds) {
        List<Salesforce_Ticket__c> listST = [select id, status__c from 
                                Salesforce_Ticket__c where Status__c != 'Completed' and Salesforce_Project__c in :spIds];
        for (salesforce_ticket__c st : listST) {
            st.Status__c = 'Completed';
        }
        update listST;
    }
}
