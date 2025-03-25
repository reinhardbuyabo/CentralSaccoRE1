page 50102 "Savings Account List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = SavingsAccount;
    CardPageId = "Savings Account Card";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Account No."; Rec.account_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the account number.';
                }
                field("Member No."; Rec.member_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member number.';
                    TableRelation = Membership;
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
                    TableRelation = Product wHERE("Product Type" = const(Savings));
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
        area(Factboxes)
        {
            
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}