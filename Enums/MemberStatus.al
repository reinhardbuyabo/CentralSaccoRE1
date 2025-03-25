// Enum 50100 - MemberStatus
enum 50100 MemberStatus
{
    Extensible = true;
    
    value(0; Active)
    {
        Caption = 'Active';
    }
    value(1; Inactive)
    {
        Caption = 'Inactive';
    }
    value(2; Suspended)
    {
        Caption = 'Suspended';
    }
    value(3; Terminated)
    {
        Caption = 'Terminated';
    }
}