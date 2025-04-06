page 50108 "Loan Charges Lines List"
{
    PageType = ListPart;
    ApplicationArea = All;
    // UsageCategory = Lists;
    SourceTable = "Loan Charges Lines";

    layout
    {
        area(Content)
        {
            repeater("Loan Charges Lines")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique number of the Loan Charges Line.';
                    Visible = false;
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique number of the Loan.';
                    Editable = false;
                }
                field("Charge Code"; Rec."Charge Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code of the Loan Charges.';
                    LookupPageId = 50109; // Loan Charges

                    trigger OnValidate()
                    begin
                        Message(Rec.Description);

                        // Upon putting of charge code, make sure charge amount is populated automatically
                        if Rec."Charge Method" = Rec."Charge Method"::Flat then begin
                            Rec."Charge Amount" := Rec."Charge Amount";
                        end;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description of the Loan Charges.';
                }
                field("Charge Method"; Rec."Charge Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Method of the Loan Charges.';
                    Editable = false;
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount of the Loan Charges.';
                    Editable = false;
                }
            }
        }
        // area(Factboxes)
        // {

        // }
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