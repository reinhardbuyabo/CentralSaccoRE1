table 50109 "Loan Charges"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Charge Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Charge Method"; Enum "Withdrawal Calculation")
        {
            DataClassification = ToBeClassified;
        }
        field(4; Percentage; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(PK; "Charge Code")
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
    begin

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