table 50111 "Product Types"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Product Code"; Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Product Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Product Type"; Enum "EProduct Types")
        {
            DataClassification = ToBeClassified;
        }
        field(4; "G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Withdrawal Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Withdrawal Charges";
        }
    }

    keys
    {
        key(PK; "Product Code")
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