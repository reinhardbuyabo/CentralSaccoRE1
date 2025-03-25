// Credit Account List Page
page 50108 "Credit Account List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Credit Account";
    CardPageId = "Credit Account Card";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(account_no; Rec."Account No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the account number';
                }
                field(member_no; Rec."Member No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member number';
                }
                field(MemberName; GetMemberName())
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the member';
                    Editable = false;
                }
                field(loan_type; Rec."Loan Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of loan';
                }
                field(loan_no; Rec."Loan No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan number';
                }
                field(amount; Rec.amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan amount';
                }
            }
        }
    }
    
    var
        MemberRec: Record Membership; // Assuming there's a Member table

    local procedure GetMemberName(): Text[100]
    begin
        if MemberRec.Get(Rec."Member No") then
            exit(Format(MemberRec.first_name + MemberRec.last_name))
        else
            exit('');
    end;
}