public class SoqlDemo2 {
    public static void childToParent_SOQL1() {
        list<contact> listContact = [select name, phone, account.name, account.industry 
                        from contact where account.industry = 'Energy'];
        for (contact eachContact : listContact) {
            string accName = eachContact.account.name;
            string accIndustry = eachContact.account.Industry;
            //string accPHone = eachContact.account.phone; //will this work? 
            system.debug('contact name is ' + eachContact.Name + ', its account name is ' + accName);
        }
    }

    public static void parentToChild_SOQL1() {
        list<account> accountWithOpps = [select id, name, annualrevenue, type, 
                                        (select name, amount, stageName from opportunities where stageName = 'Closed Won') 
                                        from account where type = 'Customer - Direct'];
        for (account eachAcc : accountWithOpps) {
            system.debug('account name is ' + eachAcc.Name + ' and annual revenue is ' + eachAcc.AnnualRevenue);
            system.debug('----');
            List<Opportunity> accOpportunities = eachAcc.Opportunities;
            for (opportunity eachOpp : accOpportunities) {
                system.debug('opp name is ' + eachOpp.Name + ' AND amount is ' + eachOpp.Amount);
            }
            system.debug('============');
        }
    }

    public static void parentToChild_SOQL2() {
        //soql query on Project and also fetch all tickets.
        List<salesforce_project__c> listSP = [select name, project_name__c, status__c, 
                                ( select name, subject__c, priority__c from salesforce_tickets__r ) 
                                    from salesforce_project__c];
        integer totalHP = 0;
        for (salesforce_project__c eachSP : listSP) {
            system.debug('project name IS ' + eachSP.Project_Name__c + ' and autonumber is ' + eachSP.Name);
            List<Salesforce_Ticket__c> listST = eachSP.Salesforce_Tickets__r;
            system.debug('total tickets in ' + eachSP.Name + ' are ' + listST.size());
            integer eachProjectHP = 0;

            for (salesforce_ticket__c eachST : listST) {
                //check if eachST priority is HIGH
                if (eachST.Priority__c == 'High') {
                    eachProjectHP++;
                    totalHP++;
                }
            }
            system.debug('projects # of high priority tickets ===> ' + eachProjectHP );
        }
        system.debug('total # of high priority tickets ==> ' + totalHP);
    }
}
