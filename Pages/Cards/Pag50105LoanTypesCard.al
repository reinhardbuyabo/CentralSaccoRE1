page 50105 "Loan Types Card"
{
    PageType = Card;
    ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "Loan Product Types";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Loan Type Code"; Rec."Loan Product Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // minimum loan
                field("Minimum Loan"; Rec."Minimum Loan")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // maximum loan
                field("Maximum Loan"; Rec."Maximum Loan")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // minimum installment
                field("Minimum Installment"; Rec."Minimum Installement")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // maximum installment
                field("Maximum Installment"; Rec."Maximum Installment")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // principal g/l account
                field("Principal G/L Account"; Rec."Principal G/L Account")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // interest receivalbe g/l account
                field("Interest Receivable G/L Account"; Rec."Interest Receivable")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // interest income g/l
                field("Interest Income G/L Account"; Rec."Interest Income G/L")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Penalty Receivable"; Rec."Penalty Receivable")
                {
                    ApplicationArea = All;
                }
                field("Penalty Income"; Rec."Penalty Income")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Undefined)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}