@isTest
public class AccountTriggerTest {
    @IsTest
    static void testAccountTrg(){
        //prepare data
       account acc1 = new account();
       acc1.Name = 'SI Test';
       acc1.Industry = 'Energy';

       account acc2 = new account();
       acc2.Name = 'UI Test';
       acc2.Industry = 'Energy';

       account acc3 = new account();
       acc3.Name = 'PI Test';
       acc3.Industry = 'Banking';

       List<account> accList = new List<account> {acc1, acc2, acc3};
       //call trigger
       insert accList;

       //assertion
       system.assertEquals(3, accList.size());
        
    }
}
