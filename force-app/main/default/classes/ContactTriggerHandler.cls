public class ContactTriggerHandler {
    public static void contactUpdateValidation1(List<contact> contTriggerNew, List<contact> contTriggerOld,
                                    Map<id, contact> contTriggerNewMap, Map<id, contact> contTriggerOldMap) {
            //prevent to update contact record IF leadSource is PartnerReferral
            for (contact eachCnt : contTriggerNew) {
                Contact oldContact = contTriggerOldMap.get(eachCnt.id);
                if (oldContact.LeadSource == 'Partner Referral') {
                    eachCnt.addError('Cannot update \'Partner Referral\' contact.');
                }
            }
    }


    public static void contactUpdateValidation2(List<contact> contTriggerNew, List<contact> contTriggerOld,
                                    Map<id, contact> contTriggerNewMap, Map<id, contact> contTriggerOldMap) {

        for (Contact eachContact : contTriggerNew) {
            if (eachContact.LeadSource != contTriggerOldMap.get(eachContact.id).LeadSource) {
                string customValidation = system.label.ContactValidation2;
                eachContact.LeadSource.addError(customValidation);
            }
        }
    }

    public static void updateAccNumberOfContacts(List<contact> contTriggerNew, list<contact> contTriggerOld) {
        set<id> accountIds = new set<id>();
        
        if (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
            for (Contact eachCont : contTriggerNew) {
                accountIds.add(eachCont.AccountId);
            }
        }
        if (Trigger.isUpdate || Trigger.isDelete) {
            for (Contact eachCont : contTriggerOld) {
                accountIds.add(eachCont.AccountId);
            }
        }

        if (!accountIds.isEmpty()) {
            //all accounts in accountIds, and all its contacts using inner query
            List<account> listAcc = [Select id, Number_of_contacts__c, (select id from contacts) from account where id in :accountIds];

            list<account> updateAcc = new list<account>();
            for (account eachAcc : listAcc) {
                eachAcc.Number_of_contacts__c = eachAcc.contacts.size();
                updateAcc.add(eachAcc);
            }

            update updateAcc;
        }
    }
}
