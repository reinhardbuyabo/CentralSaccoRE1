// Table 50100 - Membership
table 50101 Membership
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(2; member_no; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Member No.';
        }
        field(3; id_no; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'ID No.';
        }
        field(4; first_name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'First Name';
        }
        field(5; last_name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Last Name';
        }
        // identity type
        field(11; identity_type; Enum IdentityType)
        {
            DataClassification = CustomerContent;
            Caption = 'Identity Type'; 
            NotBlank = true;

            trigger OnValidate()
            begin
                if Rec.identity_type = IdentityType::"National ID" then
                    Rec."Passport No." := ''
                else if Rec.identity_type = IdentityType::"Passport" then
                    Rec."ID No." := ''
            end;
        }
        field(12; "ID No."; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'ID No.';
        }
        field(13; "Passport No."; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Passport';
        }
        field(6; phone_no; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Phone No.';
        }
        field(7; location; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Location';
        }
        field(8; status; Enum MemberStatus)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
        field(9; captured_by; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Captured By';
        }
        // Concatenation of first name and last name
        field(10; name; Text[100]) {
            DataClassification = CustomerContent;
            Caption = 'Name';
            Editable = false;
        }
    }
    
    keys
    {
        key(PK; member_no)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        myInt: Integer;
    begin
        if Rec.name = '' then
            Error('Name is required');
    end;
}