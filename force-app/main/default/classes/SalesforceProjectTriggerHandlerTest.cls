@isTest
public class SalesforceProjectTriggerHandlerTest {
    @isTest
    private static void testFuture1() {
        //prepare data
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test future';
        sp.Description__c = 'test description';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Test future2';
        sp2.Description__c = 'test description2';
        
        List<Salesforce_Project__c> insertSP = new List<Salesforce_Project__c>{sp, sp2};
        insert insertSP;

        set<id> setId = new set<id> {sp.id, sp2.id};

        Test.startTest();
        SalesforceProjectTriggerHandler.updateProjectDescription(setId);
        Test.stopTest();

        List<Salesforce_Project__c> resultSP = [select id, description__c from Salesforce_Project__c];
        system.assert(resultSP[0].description__c.contains('future'));
    }
}
