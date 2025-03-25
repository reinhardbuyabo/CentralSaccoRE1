page 50112 "Product Card"
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
                field("Product No."; Rec."Product No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product number';
                    Editable = false;
                    
                }
                field("Product Name"; Rec."Product Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the product';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of the product';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Save)
            {
                ApplicationArea = All;
                Caption = 'Save';
                Image = Save;
                trigger OnAction()
                begin
                    // Code to save the product details
                    Rec.Modify(true);
                end;
            }
            action(Cancel)
            {
                ApplicationArea = All;
                Caption = 'Cancel';
                Image = Cancel;
                trigger OnAction()
                begin
                    // Code to cancel the operation
                    CurrPage.Close();
                end;
            }
        }
    }
}