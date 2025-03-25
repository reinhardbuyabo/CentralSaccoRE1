page 50103 "Savings Account Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = SavingsAccount;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Account No."; Rec.account_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the account number.';
                    Editable = false;
                }
                field("Member No."; Rec.member_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member number.';
                    TableRelation = Membership;

                    trigger OnValidate()
                    var
                        // myInt: Integer;
                    begin
                        Rec.CalcFields(member_name);
                        FormatAccountNumber.FormatAccountNumber(Rec);
                    end;
                }
                field("Member Name"; Rec.member_name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the full name of the member.';
                    Editable = false;
                }
                field("Product No."; Rec.product_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product number.';
                    TableRelation = Product WHERE("Product Type" = const(Savings));

                    trigger OnValidate()
                    var
                        // myInt: Integer;
                    begin
                        
                        Rec.CalcFields(product_name);
                        // Rec.CalcFields(product_type);
                        FormatAccountNumber.FormatAccountNumber(Rec);;
                        Message('Validation');
                    end;
                }
                // field("Product Type"; Rec.product_type)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the product type.';
                //     Editable = false;
                // }
                field("Product Name"; Rec.product_name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product name.';
                    Editable = false;
                }
                field("Amount"; Rec.amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount.';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            // In the page actions area:
action(CreateAccount)
{
    ApplicationArea = All;
    Caption = 'Create Account';
    Image = NewDocument;
    Promoted = true;
    PromotedCategory = Process;
    
    trigger OnAction()
    begin
        // Perform validation
        if (Rec.member_no = 0) or (Rec.product_no = 0) then
            Error('Member No. and Product No. must be entered.');
            
        // Generate account_no
        FormatAccountNumber.FormatAccountNumber(Rec);
        
        // Final validation
        if Rec.account_no = '' then
            Error('Could not generate a valid Account No.');
            
        // Insert record
        Rec.Insert(true);
        Message('Account %1 has been created successfully.', Rec.account_no);
    end;
}
        }
    }
    
    var
        FormatAccountNumber: Codeunit "Formatting";
}