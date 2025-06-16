public class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        if (String.isBlank(accountName)) {
            return null;
        }
        try {
            Account acct = new Account(
                Name = accountName,
                AccountNumber = '12345678'
            );
            insert acct;
            return acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage()); 
            return null;
        }
    }
}
