table 50102 "Next of Kin"
{
    Caption = 'Next of Kin';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[8])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation = Registration;
        }
        field(2; "ID No."; Integer)
        {
            Caption = 'ID No.';
            DataClassification = CustomerContent;
        }
        // Member No.
        field(3; "Member No."; Integer)
        {
            Caption = 'Member No.';
            DataClassification = CustomerContent;
            TableRelation = Registration;
        }
        field(15; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(17; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(50000; Relationship; Option)
        {
            Caption = 'Relationship';
            OptionMembers = " ",Parent,Child,Sibling,Spouse,Other;
        }
        field(50001; Beneficiary; Boolean)
        {
            Caption = 'Beneficiary';
        }
        field(50002; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(50003; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(50005; "%Allocation"; Decimal)
        {
            Caption = '% Allocation';
            DecimalPlaces = 2;
            MinValue = 0;
            MaxValue = 100;
        }
        field(50006; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Primary,Secondary,Tertiary;
        }
        field(50007; Deceased; Boolean)
        {
            Caption = 'Deceased';
        }
        field(50008; Spouse; Boolean)
        {
            Caption = 'Spouse';
        }
        field(50015; Name; Text[50])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(PK; "ID No.", "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // ValidateAllocation();
    end;

    trigger OnModify()
    begin
        // ValidateAllocation();
    end;

    procedure ValidateAllocation()
    var
        NextOfKin: Record "Next of Kin";
        ValidateTotalAllocation: Codeunit "Next of Kin Management";
    begin
        // Validate total allocation
        ValidateTotalAllocation.ValidateTotalAllocation(Rec."No.");
    end;
}