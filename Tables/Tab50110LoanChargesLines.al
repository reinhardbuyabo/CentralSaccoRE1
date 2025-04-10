table 50110 "Loan Charges Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }

        field(2; "Charge Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Loan Charges";
        }
        field(3; Description; Text[100])
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = LOOKUP("Loan Charges".Description WHERE("Charge Code" = field("Charge Code")));
        }
        field(4; "Charge Method"; Enum "Withdrawal Calculation")
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = LOOKUP("Loan Charges"."Charge Method" WHERE("Charge Code" = field("Charge Code")));
        }
        field(5; "Charge Amount"; Decimal)
        {
            // DataClassification = ToBeClassified;
            Caption = 'Amount';
            FieldClass = FlowField;
            CalcFormula = LOOKUP("Loan Charges".Amount WHERE("Charge Code" = field("Charge Code")));
        }
        field(6; "Loan Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Loans;
        }
    }

    keys
    {
        key(PK; "No.", "Loan Number")
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