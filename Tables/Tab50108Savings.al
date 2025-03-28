table 50108 Savings
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Account No." := "Product Code" + '-' + Format("Member No.");
            end;
        }
        field(3; "Member No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Member Name"; Text[200])
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = LOOKUP(Membership.name WHERE(member_no = field("Member No.")));
        }
        field(4; "Product Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Types"; // To Be Implemented
        }
        field(5; "Product Type"; Text[50])
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = LOOKUP("Product Types"."Product Name" WHERE("Product Code" = field("Product Code")));
        }
        field(6; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Account No.")
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