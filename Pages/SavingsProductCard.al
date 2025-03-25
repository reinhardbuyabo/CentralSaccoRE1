// Savings Product Card Page
page 50107 "Savings Product Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Product;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(product_no; Rec."Product No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the savings product number';
                }
                field(product_type; Rec."Product Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of savings product';
                    // Step 1:
                }
                field(product_name; Rec."Product Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the savings product';
                }
            }
        }
    }
}