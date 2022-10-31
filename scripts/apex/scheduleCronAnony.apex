AccountsSchedulable ac = new AccountsSchedulable();

String cronExp = '0 0 13 * * ?';
system.schedule('accupdatejob', cronExp, ac);