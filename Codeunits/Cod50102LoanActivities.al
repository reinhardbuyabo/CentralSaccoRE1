codeunit 50102 "Loan Activities"
{
    procedure PostLoan(PostingDate: Date; Description: Text[100]; Amount: Decimal; "Member No.": Code[20]; "Document No.": Code[20]; "Loan No.": Code[20]; "Bank No.": Code[20]; "Document Type": Enum "Bank Ledger Document Type"; "Transaction Type": Enum "Loan Transaction Type"; "Approved Amount": Decimal; "Loan Product Code": Code[20]; "Charge Code": Code[20])
    var
        myInt: Integer;
    begin
        BankAccount.Get("Bank No.");
        RecordsUpdate.InsertBankLedgers("Bank No.", PostingDate, "Member No.", "Document Type"::"Loan Disbursement", "Document No.", (Amount * -1), Description);
        RecordsUpdate.InsertSavingLedgers("Bank No.", PostingDate, "Member No.", "Document No.", "Document Type"::"Loan Disbursement", "Document No.", Amount, Description);

        // Loan Charges - Filter Loan Charges Lines Table by Loan No.
        TableLoanChargesLines.SetRange("Loan Number", "Loan No.");

        // Find the Loan Charges Lines
        if TableLoanChargesLines.FindSet() then begin
            repeat
                "Charge Code" := TableLoanChargesLines."Charge Code";
                TableLoanCharges.SetRange("Charge Code", "Charge Code");
                if TableLoanCharges.FindSet() then begin
                    repeat
                        "Charge Code" := TableLoanCharges."Charge Code";
                        TableLoanCharges.Get("Charge code");
                        if TableLoanCharges."Charge Method" = TableLoanCharges."Charge Method"::Flat then begin
                            TableLoanChargesLines."Charge Amount" := TableLoanCharges.Amount;
                        end else if TableLoanCharges."Charge Method" = TableLoanCharges."Charge Method"::"% of Amount" then begin
                            TableLoanChargesLines."Charge Amount" := (TableLoanCharges.Percentage * "Approved Amount") / 100;
                        end;

                        // Insert in G/L for Charges
                        RecordsUpdate.InsertGLEntries(
                            RecordsUpdate.GetNextGLEntryNo(RecordsUpdate.GetGLAccountFromLoanCharges("Charge Code")),
                            PostingDate, RecordsUpdate.GetGLAccountFromLoanCharges("Charge Code"),
                            TableLoanCharges.Description, (TableLoanChargesLines."Charge Amount" * -1),
                            "Loan No.", '', "Member No."
                        );
                    until TableLoanCharges.Next() = 0;
                end;
            until TableLoanChargesLines.Next() = 0;

            // Insert to Loan Ledger Entries
            RecordsUpdate.InsertLoanLedgers("Bank No.", PostingDate, "Member No.", "Loan No.", "Document Type"::"Loan Disbursement", "Transaction Type"::"Loan Disbursement", "Document No.", "Approved Amount", Description);

            // Insert Principal G/L
            RecordsUpdate.InsertGLEntries(
                RecordsUpdate.GetNextGLEntryNo(RecordsUpdate.GetGLAccountFromLoanProductPrincipal("Loan Product Code")), // 1. Entry No. : Integer
                PostingDate, // 2. Posting Date : Date
                RecordsUpdate.GetGLAccountFromLoanProductPrincipal("Loan Product Code"), // 3. G/L Account : Code[20]
                'Loan Disbursement', // 4. Description : Text[100]
                "Approved Amount", // 5. Amount : Decimal
                "Loan No.", // 6. Document No. : Code[20]
                '', // 7. Balance Account No. : Code[20]
                "Member No." // 8. External Document No. : Code[20]
                );

            // Insert in Member Wallet G/L
            RecordsUpdate.InsertGLEntries(
                RecordsUpdate.GetNextGLEntryNo(RecordsUpdate.GetGLAccountFromProduct("Document No.")),
                PostingDate, RecordsUpdate.GetGLAccountFromProduct("Document No."), 'Loan Disbursement',
                (Amount * -1), "Loan No.", "Document No.", "Member No."
            );

            BankAccount.Balance -= Amount;
            BankAccount.Modify();

            // Insert in Bank G/Ls
            RecordsUpdate.InsertGLEntries(
                RecordsUpdate.GetNextGLEntryNo(RecordsUpdate.GetGLAccountFromBankAccount(BankAccount."Bank Account")),
                PostingDate, RecordsUpdate.GetGLAccountFromBankAccount(BankAccount."Bank Account"), 'Loan Disbursement',
                (Amount * -1), "Loan No.", "Document No.", BankAccount."Bank Account"
            );

        end;
    end;

    trigger OnRun()
    begin

    end;

    var
        BankAccount: Record "Bank Accounts";
        RecordsUpdate: Codeunit "Records Update";
        TableLoanCharges: Record "Loan Charges";
        TableLoanChargesLines: Record "Loan Charges Lines";
}