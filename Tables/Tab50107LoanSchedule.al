table 50107 "Loan Scheduler"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Loan Scheduler No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Loans."Loan No.";
        }
        field(3; "Payment Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Payment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Principal Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Interest Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Monthly Repayment"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Loan Scheduler No.")
        {
            Clustered = true;
        }
        key(FK; "Loan No.")
        {
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