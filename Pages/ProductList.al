page 50110 "Product List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Product;
    CardPageId = "Product Card";
    // Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Product No."; Rec."Product No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product number.';
                }
                field("Product Name"; Rec."Product Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the product.';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of the product.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
           
        }
    }
}