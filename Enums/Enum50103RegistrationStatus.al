// Enum 50103 - RegistrationStatus
enum 50103 RegistrationStatus
{
    Extensible = true;

    value(0; New)
    {
        Caption = 'New';
    }
    value(1; PendingApproval)
    {
        Caption = 'Pending Approval';
    }
    value(2; Approved)
    {
        Caption = 'Approved';
    }
    value(3; Rejected)
    {
        Caption = 'Rejected';
    }
}