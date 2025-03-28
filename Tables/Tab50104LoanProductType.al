table 50104 "Loan Product Types"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Loan Product Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Interest Rate"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Minimum Installement"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Maximum Installment"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Minimum Loan"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Maximum Loan"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Principal G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            ToolTip = 'Represents the ledger account where the Principal Amount of a loan or receivable is recorded. Example impact: When a loan is disbursed, this account is debited (asset increase). When the loan is repaid, it is credited (asset decrease).';
            Caption = 'Affects the asset or liability side of the balance sheet, depending on whether it’s a loan given (asset) or a loan taken (liability).';
        }
        field(9; "Interest Receivable"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            ToolTip = 'Represents the G/L account where accrued interest is recorded, meaning interest that has been earned but not yet received. Example impact: When interest accrues, this account is debited (asset increase). When interest is paid, it is credited (asset decrease).';
            Caption = 'Affects accounts receivable (asset) on the balance sheet.';
        }
        field(10; "Interest Income G/L"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            Tooltip = 'Represents the income account where interest earnings are recorded. Example impact: When interest income is recognized, this account is credited (income increase).';
            Caption = 'Affects the income statement (P&L account), increasing revenue.';
        }
        field(11; "Penalty Receivable"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            ToolTip = 'Represents the G/L account where penalty charges that are due but unpaid are recorded. Example impact: When a penalty is charged, this account is debited (asset increase). When the penalty is paid, it is credited (asset decrease).';
            Caption = 'Similar to "Interest Receivable," this is an asset account on the balance sheet.';
        }
        field(12; "Penalty Income"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
            ToolTip = 'Represents the income account where penalty revenue is recorded. Example impact: When a penalty is charged, this account is credited (income increase).';
            Caption = 'Affects the income statement (P&L account).';
        }
    }

    keys
    {
        key(PK; "Loan Product Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
        NoSeriesMgt: Codeunit "No. Series";

    trigger OnInsert()
    begin
        // No Series for Primary Key
        "Loan Product Code" := NoSeriesMgt.GetNextNo('LOANPROD', WorkDate, true);
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}