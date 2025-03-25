// Table 50100 - Registration (temporary storage for client information)
table 50100 Registration
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; registration_no; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'Registration No.';
        }
        field(2; id_no; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'ID No.';
        }
        field(3; first_name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'First Name';
        }
        field(4; last_name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Last Name';
        }
        field(11; full_name; Text[100]) {
            DataClassification = CustomerContent;
            Caption = 'Full Name';
            Editable = false;
        }
        field(5; phone_no; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Phone No.';
            
            trigger OnValidate()
            var
                Registration: Record Registration;
                Membership: Record Membership;
                PhoneRegEx: Codeunit Regex;
                PhonePattern: Text;
            begin
                // Check if empty
                if phone_no = '' then
                    Error('Phone number cannot be empty.');
                    
                // Basic format validation (adjust pattern as needed for your country format)
                PhonePattern := '^[0-9+\(\)\s-]{10,15}$'; // Allows digits, +, (), spaces, and - with 10-15 characters
                if not PhoneRegEx.IsMatch(phone_no, PhonePattern) then
                    Error('Invalid phone number format. Please use a valid format (e.g., +123-456-7890).');
                
                // Check for duplicate in Registration table
                Registration.Reset();
                Registration.SetFilter(registration_no, '<>%1', Rec.registration_no); // Exclude current record
                Registration.SetRange(phone_no, phone_no);
                if Registration.FindFirst() then
                    Error('This phone number is already registered for %1 %2 (Registration No: %3).', 
                        Registration.first_name, Registration.last_name, Registration.registration_no);
                
                // Check for duplicate in Membership table
                Membership.Reset();
                Membership.SetRange(phone_no, phone_no);
                if Membership.FindFirst() then
                    Error('This phone number is already assigned to member %1 %2 (Member No: %3).', 
                        Membership.first_name, Membership.last_name, Membership.member_no);
            end;
        }
        field(6; location; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Location';
        }
        field(7; status; Enum RegistrationStatus)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            InitValue = New;
        }
        field(8; captured_by; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Captured By';
        }
        field(9; approval_date; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Approval Date';
        }
        field(10; approved_by; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Approved By';
        }
    }
    
    keys
    {
        key(PK; registration_no)
        {
            Clustered = true;
        }
        key(PhoneIndex; phone_no)
        {
            // Secondary key for phone number to improve lookup performance
        }
    }
    
    // Trigger that runs when a record is inserted
    trigger OnInsert()
    begin
        Rec.captured_by := UserId;
    end;
}