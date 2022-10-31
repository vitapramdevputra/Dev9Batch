public class AccountUpdateHelper {
    @invocableMethod
    public static void updateAccountWebsite(List<id> accIds) {
        List<account> updateAccounts = new list<account>();
        for (account eachAccount : [select id, website from account where id in :accIds]) {
            eachAccount.Website = 'www.softinnovas.com';
            updateAccounts.add(eachAccount);
        }
        update updateAccounts;
    }
}
