# 🟣 AccountHandler - Salesforce Trailhead Challenge Solution

This repository contains a **working solution** for the Salesforce Trailhead challenge **"Create a method for inserting accounts"**.

## 📚 Challenge Description

Your task is to:

* **Create a public static method `insertNewAccount` in a public `AccountHandler` class.**
* The method should:

  * Take in **an account name** as a `String`.
  * If the name is not provided or is blank, it should return `null`.
  * Otherwise, it should **insert a new `Account` with the given name** and return it.
  * If a DML Exception occurs, it should return `null`.

## 🔴 Common Error

A frequently encountered error when attempting this challenge is:

```
Challenge not yet complete — Executing the insertNewAccount method failed. Either the method does not exist, is not static, or does not insert the proper account.
```

This typically occurs when:

* The method is not `public static`.
* The method name or parameters do not match exactly what the challenge expects.
* The DML (`insert`) is missing or not implemented correctly.

## ✅ Solution (Apex)

```apex
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
```

## 📁 Project Structure

```
force-app/
└─ main/
   └─ default/
      ├─ applications/
      ├─ aura/
      │  └─ .eslintrc.json
      ├─ classes/
      │  ├─ AccountHandler.cls
      │  └─ AccountHandler.cls-meta.xml
      ├─ contentassets/
      ├─ flexipages/
      ├─ layouts/
      ├─ lwc/
      │  ├─ .eslintrc.json
      │  └─ jsconfig.json
      ├─ objects/
      ├─ permissionsets/
      ├─ staticresources/
      ├─ tabs/
      └─ triggers/

```

## 🟣 Deployment

```bash
1️⃣ Clone this Repository:
git clone https://github.com/MatheusRodriguesdaSilveira/Manipulate-records-with-DML

2️⃣ Change directory:
cd Manipulate-records-with-DML

3️⃣ Authorize your Salesforce Organization:
 sfdx auth:web:login -a MyOrg

4️⃣ Deploy to your Organization:
 sfdx force:source:deploy -p force-app
```

## 🔹 Validation

Open Developer Console in Salesforce and execute:

```apex
Account acc = AccountHandler.insertNewAccount('Test Account'); 
System.debug(acc);
```

✅ If the deployment was successful, this should:

* Insert a new `Account` with the name **"Test Account"**.
* Display the newly created `Account` in the debug logs.

<sub>Example of account created in Salesforce.
![image](https://github.com/user-attachments/assets/786770f1-7814-453d-9262-3bf7a99f92c0)

</sub>
## 🟣 Summary

✅ The `AccountHandler` is now deployed to your Salesforce Organization.
✅ The `insertNewAccount` safely inserts a new account or returns `null` if something went awry.
✅ The provided instructions allow you to:

* 🔹Clone this repository
* 🔹Push code to your Salesforce Organization
* 🔹Validate it through Developer Console

--- 
<p align="center">
🚀 If you find this helpful, please **star ⭐ this repository!**
</p>
