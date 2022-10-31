List<account> listAccount = new list<account>();

account acc1 = new Account();
acc1.Name = 'bulk acc 1';
//insert acc1;
listAccount.add(acc1);

account acc2 = new Account();
acc2.Name = 'bulk acc 2';
//insert acc2;
listAccount.add(acc2);

account a1 = new account();
account a2 = new account();

listAccount.add(a1);
listAccount.add(a2);

List<Database.SaveResult> results =  database.insert(listAccount, false);
for(Database.SaveResult sr : results){
    if(sr.isSuccess()){
        system.debug('acc inserted successfully, acc id is ' + sr.getId());
    } else {
        system.debug('acc error is ... ' + sr.getErrors());
    }
}