// Savings Product List Page
page 50106 "Savings Product List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Product;
    CardPageId = "Savings Product Card";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(product_no; Rec."Product No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the savings product number';
                }
                // field(product_type; Rec.product_type)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the type of savings product';
                // }
                field(product_name; Rec."Product Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the savings product';
                }
            }
        }
    }
}