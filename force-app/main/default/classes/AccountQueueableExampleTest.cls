@isTest
public class AccountQueueableExampleTest {
    @TestSetup
    static void makeData(){
       list<account> accs = new list<account>();
       for (Integer i = 0; i < 200; i++) {
           account a = new account(name = 'Test Account ' + i);
           accs.add(a);
       }
       insert accs;
    }

    @isTest
    private static void testQueeuable() {
        List<account> allAccs = [select id, name from account];
        AccountQueueableExample aq = new AccountQueueableExample(allAccs);
        Test.startTest();
        system.enqueueJob(aq);
        Test.stopTest();

        list<account> resultAcc = [select id,name from account where name like '%SI%'];
        system.assertEquals(200, resultAcc.size());
    }
}
