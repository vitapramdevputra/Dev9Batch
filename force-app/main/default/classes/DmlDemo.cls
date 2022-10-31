public class DmlDemo {
    public static void dmlInsertDemo_StndObj1() {
        //1. create new instance
        account acc = new account();
        //2. set field values
        acc.Name = 'SoftInnovas';
        //3.set other fields
        acc.phone = '987654321';

        //4. insert NOW
        insert acc; //THAT IS IT. PEOPLE.
        system.debug(acc);

    }

    public static void dmlInsertDemo_cstmObj1() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Teach DML to Batch9 the great';
        sp.Description__c = 'All 50% are great learners.';
        insert sp;
    }

    public static void dmlUpdateDemo_1() {
        Account acc = new account();
        acc.name ='anything';
        system.debug('before inserting acc ===> ' + acc);
        insert acc;
        system.debug('after INSERT acc ===> ' + acc);

        acc.Name = 'Salesforce Inc.';
        update acc;
        system.debug('after update acc ===> ' + acc);
    }

    public static void dmlUpdateDemo_2() {
        account acc = [select id, name from account where name = 'SoftInnovas' limit 1];

        //change the name in acc
        acc.name = 'SoftInnovas Inc.';
        //update dml
        update acc;
        
    }

    public static void dmlInsertDemo_2() {
        account acc = [select id, name from account 
                        ORDER BY CreatedDate desc limit 1];

        //create contact for LATEST created account
        contact cont = new contact();
        cont.LastName = 'Biden';
        cont.AccountId = acc.id;
        insert cont;

    }

    public static void dmlInsertDemo_3() {
        Salesforce_Project__c sp = [select id from Salesforce_Project__c ORDER BY CreatedDate desc limit 1];

        //new ticket
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Learn APEX DML';
        st.Description__c = 'kinda simple';
        st.Priority__c = 'High';
        st.Status__c = 'New';
        st.Requested_by_date__c = date.newInstance(2022, 8, 1);
        //set relationship field
        st.Salesforce_Project__c = sp.id;
        insert st;
    }

    public static void dmlInsertWRONG1() {
          //1. create new instance
          account acc = new account();
          //2. set field values
          acc.Name = 'SoftInnovas88';
          //3.set other fields
          acc.phone = '987654321';
  
          //4. insert NOW
          insert acc; //THAT IS IT. PEOPLE.

        for (Integer i = 0; i < 160; i++) {
            account acc1 = new account();
            acc1.Name = 'SoftInnovas99';
            acc1.phone = '987654321';
            insert acc1; 
        }    
        
    }

    public static void dmlMultipleRecordInsert_right1() {
        List<account> listAccount = new list<account>();

        account acc1 = new Account();
        acc1.Name = 'bulk acc 1';
        //insert acc1;
        listAccount.add(acc1);

        account acc2 = new Account();
        acc2.Name = 'bulk acc 2';
        //insert acc2;
        listAccount.add(acc2);

        account acc3 = new Account();
        acc3.Name = 'bulk acc 3';
        listAccount.add(acc3);

        insert listAccount;//insert LIST.
    }

    public static void dmlMultipleRecordInsert_right2() {
        List<account> listAcc = new list<account>();

        for (Integer i = 0; i < 155; i++) {
            account a = new account();
            a.Name = 'SoftInnovas 3Oct-v'+i;
            a.Active__c = 'Yes';
            listAcc.add(a);
            //insert a; //NOT work. why? 
            //this insert statement will be called for EACH iteration(155 times).
            //it will HIT limit of 150 DMLs.
            //solution?
            //add records to LIST 
        }
        insert listAcc;
    }

    public static void dmlMultipleRecordUpdate_right1() {
        list<account> fetchAccounts = [select id, name from account ORDER BY CreatedDate DESC limit 155];
        
        List<Account> updateAcc = new list<account>();

        for (account eachAcc : fetchAccounts) {
            eachAcc.Name += ' via B.0';
            eachAcc.AccountNumber = '987454ABCZ';
            updateAcc.add(eachAcc);
        }
        if (!updateAcc.isEmpty()) {
            update updateAcc;
        }
        
    }
}
