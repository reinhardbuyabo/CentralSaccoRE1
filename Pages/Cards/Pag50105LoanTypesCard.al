page 50105 "Loan Types Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
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
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                }
                // minimum loan
                field("Minimum Loan"; Rec."Minimum Loan")
                {
                    ApplicationArea = All;
                }
                // maximum loan
                field("Maximum Loan"; Rec."Maximum Loan")
                {
                    ApplicationArea = All;
                }
                // minimum installment
                field("Minimum Installment"; Rec."Minimum Installement")
                {
                    ApplicationArea = All;
                }
                // maximum installment
                field("Maximum Installment"; Rec."Maximum Installment")
                {
                    ApplicationArea = All;
                }
                // principal g/l account
                field("Principal G/L Account"; Rec."Principal G/L Account")
                {
                    ApplicationArea = All;
                }
                // interest receivalbe g/l account
                field("Interest Receivable G/L Account"; Rec."Interest Receivable")
                {
                    ApplicationArea = All;
                }
                // interest income g/l
                field("Interest Income G/L Account"; Rec."Interest Income G/L")
                {
                    ApplicationArea = All;
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