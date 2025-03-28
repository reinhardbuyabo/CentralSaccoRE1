table 50106 "Bank Accounts"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Bank Account"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Account No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "GL Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(6; "Ledger Fees G/L"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(7; "Excise Duty G/L"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Other Charges G/L"; cODE[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(9; "Telephone"; Code[13])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Address"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Branch"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Bank Account")
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

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        // if "Bank Account" = '' then begin
        //     "Bank Account" := NoSeriesMgt.GetNextNo('Bank Account');
        // end;
        "Bank Account" := NoSeriesMgt.GetNextNo('BANK', WorkDate, true);
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