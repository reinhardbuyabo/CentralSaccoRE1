# Cronus Central Sacco RE1

## 📌 Overview
This project is a Microsoft Dynamics 365 Business Central extension for managing sacco (credit and savings) functionalities. It includes features for member registration, loan and savings products, and account management.

## 📂 Project Structure
```
|-- Codeunits
| |-- Cod50100RegistrationManagement.al 
| |-- Cod50101NextOfKinManagement.al 
| |-- Cod50102PostBankTransaction.al 
| |-- Cod50103RecordsUpdate.al 
|-- Cronus_CentralSaccoRE1_1.0.0.0.app 
-- Codeunits
|   |-- Cod50100RegistrationManagement.al
|   |-- Cod50101NextOfKinManagement.al
|   |-- Cod50102PostBankTransaction.al
|   `-- Cod50103RecordsUpdate.al
|-- Cronus_CentralSaccoRE1_1.0.0.0.app
|-- Enums
|   |-- Enum50100MemberStatus.al
|   |-- Enum50100MemberStatusExt.al
|   |-- Enum50101LoanType.al
|   |-- Enum50102ProductType.al
|   |-- Enum50103RegistrationStatus.al
|   |-- Enum50104IdentityType.al
|   |-- Enum50105BankDocumentType.al
|   |-- Enum50106LoanTransactionType.al
|   |-- Enum50107LoanStatus.al
|   |-- Enum50108LoanPaymentTypes.al
|   |-- Enum50110WithdrawalCalculation.al
|   `-- Enum50111ProductTypes.al
|-- LICENSE.md
|-- Pages
|   |-- Cards
|   |   |-- Pag50101RegistrationCard.al
|   |   |-- Pag50105LoanTypesCard.al
|   |   `-- Pag50107LoanCard.al
|   `-- Lists
|       |-- Pag50100RegistrationList.al
|       |-- Pag50102NextOfKinList.al
|       |-- Pag50103MemberList.al
|       |-- Pag50104LoanTypesList.al
|       |-- Pag50106LoanList.al
|       `-- Pag50108LoanChargesLinesList.al
|-- README.md
|-- TableExts
|   |-- MembershipExt.al
|   `-- RegistrationExt.al
|-- Tables
|   |-- Tab50100Registration.al
|   |-- Tab50101Members.al
|   |-- Tab50102NextOfKin.al
|   |-- Tab50103LoanLedgerEntries.al
|   |-- Tab50104LoanProductType.al
|   |-- Tab50105Loans.al
|   |-- Tab50106Banks.al
|   |-- Tab50107LoanSchedule.al
|   |-- Tab50108Savings.al
|   |-- Tab50109LoanCharges.al
|   |-- Tab50110LoanChargesLines.al
|   |-- Tab50111ProductTypes.al
|   |-- Tab50112WithdrawalCharges.al
|   |-- Tab50113BankLedgerEntries.al
|   |-- Tab50114SavingsLedgerEntries.al
|   `-- Tab50115LoanLedgerEntries.al
`-- app.json
```

---

## 📦 **Project Components**  

### **🔹 Codeunits**  
Encapsulates core business logic:  
- **Cod50100RegistrationManagement.al** - Handles member registration processes.  
- **Cod50101NextOfKinManagement.al** - Manages next-of-kin records.  
- **Cod50102PostBankTransaction.al** - Handles bank transactions posting.  
- **Cod50103RecordsUpdate.al** - Updates member and loan records.  

---

### **🔹 Enums**  
Defines structured data types for categorization:  
- **Enum50100MemberStatus.al** - Tracks member status.  
- **Enum50100MemberStatusExt.al** - Extends member status classification.  
- **Enum50101LoanType.al** - Categorizes loan types.  
- **Enum50102ProductType.al** - Classifies product types.  
- **Enum50103RegistrationStatus.al** - Handles registration lifecycle.  
- **Enum50104IdentityType.al** - Defines identity document types.  
- **Enum50105BankDocumentType.al** - Manages bank document classifications.  
- **Enum50106LoanTransactionType.al** - Categorizes loan transactions.  
- **Enum50107LoanStatus.al** - Tracks loan approval and repayment states.  
- **Enum50108LoanPaymentTypes.al** - Defines loan repayment methods.  
- **Enum50110WithdrawalCalculation.al** - Handles withdrawal computation logic.  
- **Enum50111ProductTypes.al** - Further categorizes product variations.  

---

### **🔹 Pages**  
User interface components to interact with the system:  

#### 📋 **Cards (Detailed View Pages)**  
- **Pag50101RegistrationCard.al** - Displays registration details.  
- **Pag50105LoanTypesCard.al** - Manages loan product types.  
- **Pag50107LoanCard.al** - Handles individual loan records.  

#### 📜 **Lists (Overview Pages)**  
- **Pag50100RegistrationList.al** - Lists all member registrations.  
- **Pag50102NextOfKinList.al** - Displays next-of-kin records.  
- **Pag50103MemberList.al** - Shows registered members.  
- **Pag50104LoanTypesList.al** - Lists loan product types.  
- **Pag50106LoanList.al** - Displays all loan applications.  
- **Pag50108LoanChargesLinesList.al** - Tracks loan charges.  

---

### **🔹 Tables**  
Defines the database structure:  
- **Tab50100Registration.al** - Manages member registration details.  
- **Tab50101Members.al** - Stores member information.  
- **Tab50102NextOfKin.al** - Maintains next-of-kin details.  
- **Tab50103LoanLedgerEntries.al** - Tracks loan transactions.  
- **Tab50104LoanProductType.al** - Defines types of loan products.  
- **Tab50105Loans.al** - Stores loan applications and approvals.  
- **Tab50106Banks.al** - Manages bank details.  
- **Tab50107LoanSchedule.al** - Tracks loan repayment schedules.  
- **Tab50108Savings.al** - Stores savings account details.  
- **Tab50109LoanCharges.al** - Handles loan-related charges.  
- **Tab50110LoanChargesLines.al** - Records individual loan charges.  
- **Tab50111ProductTypes.al** - Categorizes product types.  
- **Tab50112WithdrawalCharges.al** - Manages withdrawal-related charges.  
- **Tab50113BankLedgerEntries.al** - Logs bank transactions.  
- **Tab50114SavingsLedgerEntries.al** - Tracks savings transactions.  
- **Tab50115LoanLedgerEntries.al** - Maintains records of loan repayments.  

---

### **🔹 Table Extensions**  
Enhancements to standard tables:  
- **MembershipExt.al** - Adds additional membership attributes.  
- **RegistrationExt.al** - Extends registration details.  

---

### **🔹 Configuration Files**  
- **app.json** - Defines project metadata and dependencies.  
- **Cronus_CentralSaccoRE1_1.0.0.0.app** - Packaged Business Central extension.  
- **LICENSE.md** - Licensing details.  

---

## 🔧 **Installation & Deployment**  

### **Prerequisites**  
Ensure you have:  
✅ Microsoft Dynamics 365 Business Central development environment.  
✅ Visual Studio Code with the AL Language extension.  

### **Deployment Steps**  
1️⃣ Open the project in Visual Studio Code.  
2️⃣ Update `app.json` to match your Business Central environment.  
3️⃣ Build & deploy the extension:  
   ```sh
   Ctrl + Shift + B (Build & Deploy)
   ```
## 📜 License
This project is under [MIT License](LICENSE). Feel free to modify and distribute.

## 🔗 Additional Resources
- [Microsoft AL Language Documentation](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-reference-overview)
- [Business Central Sandbox Setup](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-sandbox-overview)

---