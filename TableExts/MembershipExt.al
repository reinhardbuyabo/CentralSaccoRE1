// Also add validation to the Membership table (Table 50100)
tableextension 50100 MembershipExt extends Membership
{
    fields
    {
        modify(phone_no)
        {
            trigger OnBeforeValidate()
            var
                Registration: Record Registration;
                Membership: Record Membership;
                PhoneRegEx: Codeunit Regex;
                PhonePattern: Text;
            begin
                // Check if empty
                if Rec.phone_no = '' then
                    Error('Phone number cannot be empty.');
                    
                // Basic format validation
                PhonePattern := '^[0-9+\(\)\s-]{10,15}$'; // Allows digits, +, (), spaces, and - with 10-15 characters
                if not PhoneRegEx.IsMatch(Rec.phone_no, PhonePattern) then
                    Error('Invalid phone number format. Please use a valid format (e.g., +123-456-7890).');
                
                // Check for duplicate in Registration table
                Registration.Reset();
                Registration.SetRange(phone_no, Rec.phone_no);
                if Registration.FindFirst() then
                    Error('This phone number is already registered for %1 %2 (Registration No: %3).', 
                        Registration.first_name, Registration.last_name, Registration.registration_no);
                
                // Check for duplicate in Membership table (excluding current record)
                Membership.Reset();
                Membership.SetFilter(member_no, '<>%1', Rec.member_no); // Exclude current record
                Membership.SetRange(phone_no, Rec.phone_no);
                if Membership.FindFirst() then
                    Error('This phone number is already assigned to member %1 %2 (Member No: %3).', 
                        Membership.first_name, Membership.last_name, Membership.member_no);
            end;
        }
    }
}