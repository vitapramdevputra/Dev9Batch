try{
    Account ac = new account();
    insert ac;
} catch(DmlException dx){
    system.debug('dml went wrong buddy');
} catch(exception ex){
    system.debug('something went wrong buddy.');
}

//will below line print
system.debug('Apex is simple');