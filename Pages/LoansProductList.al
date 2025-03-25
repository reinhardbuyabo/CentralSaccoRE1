// Loan Product List Page
page 50104 "Loan Product List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CreditProduct;
    CardPageId = "Loan Product Card";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(loan_no; Rec.product_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the loan product number';
                }
                field(loan_type; Rec.loan_type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of loan product';
                }
            }
        }
    }
}