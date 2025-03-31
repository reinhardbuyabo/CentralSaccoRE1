table 50113 "Bank Ledger Entries"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[20])
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
        field(4; "Member No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Type"; Enum "Bank Ledger Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "User ID"; Code[30])
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
        NoSeriesMgt: Codeunit "No. Series";

    trigger OnInsert()
    begin
        "User ID" := USERID;
        "Entry No." := NoSeriesMgt.GetNextNo('BANKLEDGERS', WorkDate, true);
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