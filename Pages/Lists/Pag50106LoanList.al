page 50106 "Loan Application List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Loans;
    Editable = false;
    CardPageId = 50107; // Loan Card

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Loan No."; Rec."Loan No.")
                {
                    ApplicationArea = All;
                }
                // member number
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = All;
                }
                // Name
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                // ID No.
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = All;
                }
                // Application Date
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = All;
                }
                // Loan Product Type
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = All;
                }
                // Loan Product Name
                field("Loan Product Name"; Rec."Loan Product Name")
                {
                    ApplicationArea = All;
                }
                // Amount Applied
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = All;
                }
                // Amount Approved
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = All;
                }
                // Interest Rate
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                }
                // Repayment Frequency
                field("Repayment Frequency"; Rec."Payment Frequency")
                {
                    ApplicationArea = All;
                }
                // Repayment Start Date
                field("Repayment Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                // Loan Period
                field("Loan Period"; Rec."Loan Period")
                {
                    ApplicationArea = All;
                }
                // Monthly Interest
                field("Monthly Interest"; Rec."Monthly Interest")
                {
                    ApplicationArea = All;
                }
                // Monthly Repayment
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ApplicationArea = All;
                }
                // Total Loan Balance
                field("Total Loan Balance"; Rec."Total Loan Balance")
                {
                    ApplicationArea = All;
                }
                // Disbursement Date
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                    ApplicationArea = All;
                }
                // Status
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                // Posted
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                }
                // Captured By
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

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