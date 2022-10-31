trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('====trigger start======');
    if (trigger.isBefore ) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {

        AccountQueueableExample aq = new AccountQueueableExample(Trigger.new);
        system.enqueueJob(aq);
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        AccountTriggerHandler.updateVIPforAllContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    
    system.debug('====trigger end====');
    





















    
    /*

    if (trigger.isAfter && trigger.isUpdate) {

        integer countWSChanged = 0;

        Map<id, account> newMapAcc = trigger.newmap;
        Map<id, account> oldMapAcc = trigger.oldMap;
        set<id> accIds = newMapAcc.keySet();

        for (Id eachId : accIds) {
            //eachId is updated Account's ID (if any field is updated.)
            //we want to check OLD Account's webiste != New Account's website
            account oldAcc = oldMapAcc.get(eachId);
            string oldWebSite = oldAcc.Website;

            account newAcc = newMapAcc.get(eachId);
            string newWebSite = newAcc.Website;
            
            if (oldWebSite != newWebsite) {
                countWSChanged++;
                //For Account accName, website is changed to newWebsite
                system.debug('For account ' + newAcc.name + ', website is change to ' + newWebSite);
            }
        }
        system.debug('total # account where website is changed ==> ' + countWSChanged);
    }


    Map<id, account> newMapAcc = trigger.newMap;
    map<id, account> oldMapAcc = trigger.oldMap;
    if (trigger.isUpdate && trigger.isAfter) {
        //get keySet from maps
        Set<id> accIds = newMapAcc.keySet();
        
        for (id eachId : accIds) {
            system.debug('eachId ==> ' + eachId);
            //get value from key in newMap and oldMap
            Account newAccount = newMapAcc.get(eachId);
            system.debug('new account name ==> ' + newAccount.Name);
            Account oldAccount = oldMapAcc.get(eachId);
            system.debug('old account name ==> ' + oldAccount.Name);
        }
    }


    Map<id, account> newMapAcc = trigger.newMap;
    map<id, account> oldMapAcc = trigger.oldMap;
    if (trigger.isInsert && trigger.isBefore) {
        system.debug('before insert Trigger.OldMap ==> ' + oldMapAcc);//null
        system.debug('before insert Trigger.NewMap ==> ' + newMapAcc);//n
    }
    if (trigger.isInsert && trigger.isAfter) {
        system.debug('after insert Trigger.OldMap ==> ' + oldMapAcc);
        system.debug('after insert Trigger.NewMap ==> ' + newMapAcc);
    }
    if (trigger.isUpdate && trigger.isBefore) {
        system.debug('before update Trigger.OldMap ==> ' + oldMapAcc);
        system.debug('before update Trigger.NewMap ==> ' + newMapAcc);
    }
    if (trigger.isUpdate && trigger.isAfter) {
        system.debug('after update Trigger.OldMap ==> ' + oldMapAcc);
        system.debug('after update Trigger.NewMap ==> ' + newMapAcc);
    }



    if (Trigger.isAfter && Trigger.isUpdate) {
        List<account> newAccounts = trigger.new;
        set<id> newAccIds = new set<id>();
        for (Account eachAccnew : newAccounts) {
            system.debug('new id ==> ' + eachAccnew.Id + ' new name ==> ' + eachAccnew.Name);
            newAccIds.add(eachAccnew.Id);
        }
        system.debug('set of ids ==> ' + newAccIds);
    }



     if (trigger.isInsert && trigger.isBefore) {
        system.debug('before insert Trigger.Old ==> ' + trigger.old);
    }
    if (trigger.isInsert && trigger.isAfter) {
        system.debug('after insert Trigger.Old ==> ' + trigger.old);
    }
    if (trigger.isUpdate && trigger.isBefore) {
        system.debug('before update Trigger.Old ==> ' + trigger.old);
    }
    if (trigger.isUpdate && trigger.isAfter) {
        system.debug('after update Trigger.Old ==> ' + trigger.old);
    }

     //trigger.new   ALWAYS  gives List<sObject>. ALWAYS. Even if we updating/inserting JUST one record.
        //ALWAYS list<sObject>
    List<account> newAccounts = trigger.new;
        //why?? Trigger RUNS only once when we process multiple records at a time.
        system.debug('number of records --> ' + newAccounts.size());
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('before trigger trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('after trigger trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }

    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('before update trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('after update trigger.new ==> ' + newAccounts);
        for (account acc : newAccounts) {
            system.debug('acc id ==> ' + acc.Id + ' + acc name ==> ' + acc.Name);
        }
    }
    */

    /*
    if (trigger.isBefore) {
        system.debug('BEFORE(insert or update) trigger called.');
        if (trigger.isInsert) {
            system.debug('before insert trigger called');
        }
        if(trigger.isUpdate){
            system.debug('before update trigger called');
        }
    }
    if (trigger.isAfter) {
        system.debug('AFTER(insert or update) trigger called.');
        if (trigger.isInsert) {
            system.debug('after insert trigger called');
        }
        if(trigger.isUpdate){
            system.debug('after update trigger called');
        }
    }
    */

    /*
     if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('Before insert account trigger called.');
    } 
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('After insert account trigger called.');
    }
    
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('Before update account trigger called.');
    } 
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('After update account trigger called.');
    }
    */

    /*if (Trigger.isInsert) {
        system.debug('before insert account trigger called.');    
    }
    if(Trigger.isUpdate){
        system.debug('before update account trigger called');
    }*/
    
    
    /*0
    //print before insert debug only in BEFORE TRIGGER
    if (Trigger.isBefore) {
        system.debug('before insert account trigger called.');
    }
    ////print after insert debug only in AFTER TRIGGER
    if (Trigger.isAfter) {
        system.debug('AFTER insert account trigger called.');
    }*/
   
}