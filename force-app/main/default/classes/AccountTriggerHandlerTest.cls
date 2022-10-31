@isTest
public class AccountTriggerHandlerTest {
    @IsTest
    private static void testUpdateDescription() {
          //prepare data
       account acc1 = new account();
       acc1.Name = 'SI Test';
       acc1.Industry = 'Energy';
       acc1.Active__c = 'Yes';

       account acc2 = new account();
       acc2.Name = 'UI Test';
       acc2.Industry = 'Energy';

       account acc3 = new account();
       acc3.Name = 'PI Test';
       acc3.Industry = 'Banking';

       List<account> accList = new List<account> {acc1, acc2, acc3};
       insert accList;

       //assertion
       list<account> resultAcc = [select id, name, active__c, description from account];
       for (account acc : resultAcc) {
           if (acc.Active__c == 'Yes') {
               system.assert(acc.Description.contains('Active'));
           } else {
               system.assert(String.isBlank(acc.Description));
           }
       }

    }
    @istest
    private static void testUpdateDescription2() {
           //prepare data
       account acc1 = new account();
       acc1.Name = 'SI Test';
       acc1.Industry = 'Energy';
       acc1.Active__c = 'Yes';

       account acc2 = new account();
       acc2.Name = 'UI Test';
       acc2.Industry = 'Energy';

       account acc3 = new account();
       acc3.Name = 'PI Test';
       acc3.Industry = 'Banking';

       List<account> accList = new List<account> {acc1, acc2, acc3};
       insert accList;

       acc2.Active__c = 'Yes';
       acc3.Active__c = 'Yes';
       List<account> accList2 = new List<account> {acc2, acc3};
       update accList2;

       //assertion
       list<account> resultAcc = [select id, name, active__c, description from account];
       for (account acc : resultAcc) {
           if (acc.Active__c == 'Yes') {
               system.assert(acc.Description.contains('Active'));
           } else {
               system.assert(String.isBlank(acc.Description));
           }
       }
    }

    @isTest
    private static void testUpdateVIP() {
        account acc1 = new account();
        acc1.Name = 'SI Test';
        acc1.Industry = 'Energy';
        acc1.Active__c = 'Yes';
 
        account acc2 = new account();
        acc2.Name = 'UI Test';
        acc2.Industry = 'Energy';
 
        List<account> accList = new List<account> {acc1, acc2};
        insert accList;

        List<contact> listContact = new list<contact>();
       for (Integer i = 0; i < 200; i++) {
           contact c = new contact();
           c.LastName = 'TEST Trigger ' + i;
           if (i< 100) {
               c.AccountId = acc1.id;
           } else if (i < 200) {
               c.AccountId = acc2.id;
           }
           listContact.add(c);
       }
       insert listContact;

       acc1.VIP__c = true;
       acc2.VIP__c = true;
       List<account> accList2 = new List<account> {acc1, acc2};
       //update will fire trigger
       update accList2;

       //assertion
       list<contact> resultContacts = [select id, vip__c from Contact];
       system.assertEquals(true, resultContacts[0].VIP__c);

    }
}
