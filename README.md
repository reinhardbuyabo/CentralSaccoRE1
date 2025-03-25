# AL Project: Cronus Central Sacco RE

## 📌 Overview
This project is a Microsoft Dynamics 365 Business Central extension for managing sacco (credit and savings) functionalities. It includes features for member registration, loan and savings products, and account management.

## 📂 Project Structure
```
|-- Codeunits
|   |-- Formatting.al
|   `-- RegistrationManagement.al
|-- Cronus_CentralSaccoRE1_1.0.0.0.app
|-- Enums
|   |-- IdentityType.al
|   |-- LoanType.al
|   |-- MemberStatus.al
|   |-- MemberStatusExt.al
|   |-- ProductType.al
|   `-- RegistrationStatus.al
|-- New.al
|-- Pages
|   |-- CreditAccountCard.al
|   |-- CreditAccountList.al
|   |-- LoanProductCard.al
|   |-- LoansProductList.al
|   |-- MemberList.al
|   |-- ProductList.al
|   |-- RegistrationCard.al
|   |-- RegistrationList.al
|   |-- SavingsAccountCard.al
|   |-- SavingsAccountList.al
|   |-- SavingsProductCard.al
|   `-- SavingsProductList.al
|-- ProductCard.al
|-- README.md
|-- TableExts
|   `-- MembershipExt.al
|-- Tables
|   |-- CreditAccount.al
|   |-- CreditProduct.al
|   |-- Members.al
|   |-- Product.al
|   |-- Registration.al
|   |-- SavingsAccount.al
|   `-- SavingsProduct.al
`-- app.json
```

## 📦 Components

### 🔹 **Tables**
These define the core data structures:
- `CreditAccount.al` - Stores credit account details.
- `CreditProduct.al` - Defines credit product offerings.
- `Members.al` - Holds member data.
- `Product.al` - Contains product definitions.
- `Registration.al` - Manages registration details.
- `SavingsAccount.al` - Stores savings account information.
- `SavingsProduct.al` - Defines savings products.

### 🔹 **Table Extensions**
- `MembershipExt.al` - Extends existing table structures to add membership-specific fields.

### 🔹 **Pages**
UI components for managing accounts, products, and members:
- **Member Management**: `MemberList.al`, `RegistrationCard.al`, `RegistrationList.al`
- **Credit Products**: `CreditAccountCard.al`, `CreditAccountList.al`, `LoanProductCard.al`, `LoansProductList.al`
- **Savings Products**: `SavingsAccountCard.al`, `SavingsAccountList.al`, `SavingsProductCard.al`, `SavingsProductList.al`
- **General Products**: `ProductList.al`, `ProductCard.al`

### 🔹 **Enums**
Custom enumerations for structured data:
- `IdentityType.al` - Defines types of identity documents.
- `LoanType.al` - Categorizes loan products.
- `MemberStatus.al` & `MemberStatusExt.al` - Member state tracking.
- `ProductType.al` - Differentiates product types.
- `RegistrationStatus.al` - Tracks the registration lifecycle.

### 🔹 **Codeunits**
Business logic encapsulation:
- `Formatting.al` - Handles formatting operations.
- `RegistrationManagement.al` - Manages member registration processes.

### 🔹 **Configuration Files**
- `app.json` - Contains project metadata and dependencies.
- `Cronus_CentralSaccoRE1_1.0.0.0.app` - Packaged extension file.

## 🚀 Installation & Deployment
1. Ensure Business Central development environment is set up.
2. Open the project in Visual Studio Code with the AL Language extension installed.
3. Modify `app.json` to match your target environment.
4. Deploy using:
   ```sh
   Ctrl + Shift + B (Build & Deploy)
   ```
5. Test functionality within Business Central.

## 📜 License
This project is under [MIT License](LICENSE). Feel free to modify and distribute.

## 🔗 Additional Resources
- [Microsoft AL Language Documentation](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-reference-overview)
- [Business Central Sandbox Setup](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-sandbox-overview)

---
Feel free to contribute and improve this project! 😊