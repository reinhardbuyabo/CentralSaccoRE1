codeunit 50103 "Records Update"
{
    procedure CheckGLRange(GLNumber: Code[20]; StartRange: Code[20]; EndRange: Code[20]): Boolean
    var
        myInt: Integer;
    begin
        GLAccount.Reset();
        GLAccount.SetRange("No.", StartRange, EndRange);
        if GLAccount.Get(GLNumber) then begin
            exit(true);
            GLAccount.Reset();
        end;
        exit(false);
    end;

    procedure InsertGLEntries("Entry No.": Integer; "Posting Date": Date; "G/L Account No.": Code[20]; Description: Text[100]; Amount: Decimal; "Document No.": Code[20]; "Bal Account No.": Code[20]; "External Doc No.": Code[20])
    var
        myInt: Integer;
    begin
        GLEntries."Entry No." := "Entry No.";
        GLEntries."Posting Date" := "Posting Date";
        GLEntries."G/L Account No." := "G/L Account No.";
        GLEntries."Description" := Description;
        GLEntries."Amount" := Amount;
        GLEntries."Document No." := "Document No.";
        GLEntries."Bal. Account No." := "Bal Account No.";
        GLEntries."External Document No." := "External Doc No.";
        GLEntries.Insert();
    end;

    procedure InsertBankLedgers("Bank No.": Code[20]; "Posting Date": Date; "Member No.": Code[20]; "Document Type": Enum "Bank Ledger Document Type"; "Document No.": Code[20]; Amount: Decimal; Description: Text[100])
    begin
        BankLedgerEntry.Init();
        BankLedgerEntry."Entry No." := NoSeriesMgt.GetNextNo('BANKLEDGERS', WorkDate, true);
        BankLedgerEntry."Bank No." := "Bank No.";
        BankLedgerEntry."Posting Date" := "Posting Date";
        BankLedgerEntry."Member No." := "Member No.";
        BankLedgerEntry."Document Type" := "Document Type";
        BankLedgerEntry."Document No." := "Document No.";
        BankLedgerEntry."Amount" := Amount;
        BankLedgerEntry."Description" := Description;
        BankLedgerEntry.Insert();
    end;

    procedure InsertLoanLedgers("Bank No.": Code[20]; "Posting Date": Date; "Member No.": Code[20]; "Loan No.": Code[20]; "Document Type": Enum "Bank Ledger Document Type"; "Transaction Type": Enum "Loan Transaction Type"; "Document No.": Code[20]; Amount: Decimal; Description: Text[100])
    begin
        LoanLedgerEntry.Init();
        LoanLedgerEntry."Entry No." := NoSeriesMgt.GetNextNo('LOANLEDGERS', WorkDate, true);
        LoanLedgerEntry."Bank No." := "Bank No.";
        LoanLedgerEntry."Posting Date" := "Posting Date";
        LoanLedgerEntry."Member No." := "Member No.";
        LoanLedgerEntry."Loan No." := "Loan No.";
        LoanLedgerEntry."Document Type" := "Document Type";
        LoanLedgerEntry."Transaction Type" := "Transaction Type";
        LoanLedgerEntry."Document No." := "Document No.";
        LoanLedgerEntry."Amount" := Amount;
        LoanLedgerEntry."Description" := Description;
        LoanLedgerEntry.Insert();
    end;

    procedure InsertSavingLedgers("Bank No.": Code[20]; "Posting Date": Date; "Member No.": Code[20]; "Account No.": Code[20]; "Document Type": Enum "Bank Ledger Document Type"; "Document No.": Code[20]; Amount: Decimal; Description: Text[100])
    begin
        SavingLedgerEntry.Init();
        SavingLedgerEntry."Entry No." := NoSeriesMgt.GetNextNo('SAVINGLEDGERS', WorkDate, true);
        SavingLedgerEntry."Bank No." := "Bank No.";
        SavingLedgerEntry."Posting Date" := "Posting Date";
        SavingLedgerEntry."Member No." := "Member No.";
        SavingLedgerEntry."Account No." := "Account No.";
        SavingLedgerEntry."Document Type" := "Document Type";
        SavingLedgerEntry."Document No." := "Document No.";
        SavingLedgerEntry."Amount" := Amount;
        SavingLedgerEntry."Description" := Description;
        SavingLedgerEntry.Insert();
    end;

    procedure GetGLAccountFromBankAccount(DebitAccNo: Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        if BankAccount.Get(DebitAccNo) then begin
            exit(BankAccount."GL Account");
        end else begin
            Error('Bank Account %1 not found', DebitAccNo);
        end;
    end;

    procedure GetGLAccountFromLoanCharges("Charge Code": Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        if TableLoanCharges.Get("Charge Code") then begin
            exit(TableLoanCharges."G/L Account");
        end else begin
            Error('Bank Account %1 not found', "Charge Code");
        end;
    end;

    procedure GetGLAccountFromLoanProductPrincipal("Loan Product Code": Code[20]): Code[20]
    begin
        if LoanProductCodeTable.Get("Loan Product Code") then begin
            exit(LoanProductCodeTable."Principal G/L Account");
        end else begin
            Error('Loan Product Principal %1 not found', "Loan Product Code");
        end;
    end;

    procedure GetGLAccountFromLoanProductIntReceivable("Loan Product Code": Code[20]): Code[20]
    begin
        if LoanProductCodeTable.Get("Loan Product Code") then begin
            exit(LoanProductCodeTable."Interest Receivable");
        end else begin
            Error('Interest Receivable %1 not found', "Loan Product Code");
        end;
    end;

    procedure GetGLAccountFromLoanProductIntIncome("Loan Product Code": Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        if LoanProductCodeTable.Get("Loan Product Code") then begin
            exit(LoanProductCodeTable."Interest Income G/L");
        end else begin
            Error('Interest Income %1 not found', "Loan Product Code");
        end;
    end;

    procedure GetGLAccountFromProduct(DebitAccNo: Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        NewProductCode := CopyStr(DebitAccNo, 1, 2);
        if ProductTypes.Get(NewProductCode) then begin
            exit(ProductTypes."G/L Account");
        end else begin
            Error('GL Account for Savings Product %1 not found', DebitAccNo);
        end;
    end;

    procedure GetWithdrawalCodeFromProduct(DebitAccNo: Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        NewProductCode := CopyStr(DebitAccNo, 1, 2);
        if ProductTypes.Get(NewProductCode) then begin
            exit(ProductTypes."Withdrawal Code");
        end else begin
            Error('Product Type %1 not found', DebitAccNo);
        end;
    end;

    procedure GetWithdrawalGLFromWithdrawalCharges(DebitAccNo: Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        if WithdrawalCharges.Get(DebitAccNo) then begin
            exit(WithdrawalCharges."G/L Account");
        end else begin
            Error('Product Type %1 not found', DebitAccNo);
        end;
    end;

    procedure GetProductCode(DebitAccNo: Code[20]): Code[20]
    var
        myInt: Integer;
    begin
        NewProductCode := CopyStr(DebitAccNo, 1, 2);
        exit(NewProductCode);
    end;

    procedure GetNextGLEntryNo("GL Account": Code[20]): Integer
    var
        myInt: Integer;
    begin
        if GLAccount.Get("GL Account") then begin
            if GLEntries.FindLast() then begin
                exit(GLEntries."Entry No." + 1);
                Message(Format(GLEntries."Entry No."));
            end else begin
                exit(1);
            end;
        end;
    end;

    trigger OnRun()
    begin

    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        BankLedgerEntry: Record "Bank Ledger Entries";
        SavingLedgerEntry: Record "Savings Ledger Entries";
        BankAccount: Record "Bank Accounts";
        GLAccount: Record "G/L Account";
        GLEntries: Record "G/L Entry";
        ProductTypes: Record "Product Types";
        NewProductCode: Code[2];
        LoanProductCodeTable: Record "Loan Product Types";
        TableLoanCharges: Record "Loan Charges";
        LoanLedgerEntry: Record "Loan Ledger Entries";
        WithdrawalCharges: Record "Withdrawal Charges";
}