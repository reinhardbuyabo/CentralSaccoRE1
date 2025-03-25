// Enum 50101 - LoanType
enum 50101 "Loan Type"
{
    Extensible = true;
    
    value(0; Personal)
    {
        Caption = 'Personal';
    }
    value(1; Business)
    {
        Caption = 'Business';
    }
    value(2; Mortgage)
    {
        Caption = 'Mortgage';
    }
    value(3; Emergency)
    {
        Caption = 'Emergency';
    }
}