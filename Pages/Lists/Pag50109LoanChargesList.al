page 50109 "Loan Charges"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loan Charges";

    layout
    {
        area(Content)
        {
            repeater(Charges)
            {
                // 1. Charge Code
                field("Charge Code"; Rec."Charge Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Code of the Loan Charges.';
                }
                // 2. Description
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description of the Loan Charges.';
                }
                // 3. Charge Amount
                field("Charge Amount"; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount of the Loan Charges.';
                    Editable = Rec."Charge Method" = "Withdrawal Calculation"::Flat;
                }
                // 4. Charge Method
                field("Charge Method"; Rec."Charge Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Method of the Loan Charges.';

                    trigger OnValidate()
                    begin
                        if Rec."Charge Method" = "Withdrawal Calculation"::"% of Amount" then
                            Rec.Amount := 0.0
                        else if Rec."Charge Method" = "Withdrawal Calculation"::Flat then
                            Rec.Percentage := 0.0;
                    end;
                }
                // 5. Percentage
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Percentage of the Loan Charges.';
                    Editable = Rec."Charge Method" = "Withdrawal Calculation"::"% of Amount";
                }
                // 6. G/L Account
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'G/L Account of the Loan Charges.';
                }
            }
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