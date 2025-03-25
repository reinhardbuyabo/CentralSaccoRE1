// Loan Product Card Page
page 50105 "Loan Product Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = CreditProduct;
    
    layout
    {
        area(Content)
        {
            group(General)
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