table 50112 "Withdrawal Charges"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Withdrawal Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Calculation Method"; Enum "Withdrawal Calculation")
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Withdrawal Code")
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