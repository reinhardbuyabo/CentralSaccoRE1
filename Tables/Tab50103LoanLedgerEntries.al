table 50103 LoanLedgerEntries
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Bank No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Member No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Loan No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document Type"; Enum "Bank Ledger Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Transaction Type"; Enum "Loan Transaction Type")
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "User ID"; Code[50]) // ??
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.")
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

    // Configure No. Series here
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        // Get User ID for the Ledger Entry
        "User ID" := USERID;

        // No. Series for Entry No.
        "Entry No." := NoSeriesMgt.GetNextNo('LOANLEDGERS', WorkDate, true)
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