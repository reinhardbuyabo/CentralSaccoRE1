// Credit Account Card Page
page 50109 "Credit Account Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Credit Account";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(account_no; Rec."Account No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the account number';
                    Editable = false;
                }
                field(member_no; Rec."Member No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member number';
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
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
                    trigger OnValidate()
                    begin
                        FormatAccountNumber();
                    end;
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
                    trigger OnValidate()
                    begin
                        ValidateAmount();
                    end;
                }
            }
        }
    }
    
    var
        MemberRec: Record Membership; // Assuming there's a Member table
        InvalidAmountErr: Label 'The amount cannot be less than 500/-';
        
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        FormatAccountNumber();
        exit(true);
    end;
    
    local procedure ValidateAmount()
    begin
        if Rec.amount < 500 then
            Error(InvalidAmountErr);
    end;
    
    local procedure FormatAccountNumber()
    var
        LoanTypePrefix: Text[3];
    begin
        case Rec."Loan Type" of
            Rec."Loan Type"::Personal: LoanTypePrefix := 'PER';
            Rec."Loan Type"::Business: LoanTypePrefix := 'BUS';
            Rec."Loan Type"::Mortgage: LoanTypePrefix := 'MTG';
            // Add other loan types as needed
        end;
        
        if (LoanTypePrefix <> '') and (Rec."Member No" <> 0) then
            Rec."Account No" := PadStr(LoanTypePrefix + '-', Rec."Member No");
    end;
    
    local procedure GetMemberName(): Text[100]
    begin
        if MemberRec.Get(Rec."Member No") then
            exit(Format(Rec."Member Name"))
        else
            exit('');
    end;
}