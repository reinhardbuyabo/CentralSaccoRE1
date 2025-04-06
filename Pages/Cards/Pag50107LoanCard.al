page 50107 "Loan Application"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Loans;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                // Loan No
                field("Loan No."; Rec."Loan No.")
                {
                    ApplicationArea = All;
                    Caption = 'Loan No';
                    ToolTip = 'Loan No';
                    editable = false;
                }
                // Member No
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = All;
                    Caption = 'Member No';
                    ToolTip = 'Member No';
                    LookupPageId = "Member List";

                    trigger OnValidate()
                    begin
                        Message(Rec.Name);
                    end;
                }
                // Name
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Name';
                }
                // ID No.
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = All;
                    Caption = 'ID No.';
                    ToolTip = 'ID No.';
                }
                // Application Date
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = All;
                    Caption = 'Application Date';
                    ToolTip = 'Application Date';
                }
                // Loan Product Type
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = All;
                    Caption = 'Loan Product Type';
                    ToolTip = 'Loan Product Type';
                    LookupPageId = "Loan Types List";

                    trigger OnValidate()
                    begin
                        Message(Rec."Loan Product Name");
                    end;
                }
                // Loan Product Name
                field("Loan Product Name"; Rec."Loan Product Name")
                {
                    ApplicationArea = All;
                    Caption = 'Loan Product Name';
                    ToolTip = 'Loan Product Name';
                }
                // Amount Applied
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = All;
                    Caption = 'Amount Applied';
                    ToolTip = 'Amount Applied';
                }
                // Amount Approved
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = All;
                    Caption = 'Amount Approved';
                    ToolTip = 'Amount Approved';
                }
                // Interest Rate
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                    Caption = 'Interest Rate';
                    ToolTip = 'Interest Rate';
                }
                // Repayment Frequency
                field("Repayment Frequency"; Rec."Payment Frequency")
                {
                    ApplicationArea = All;
                    Caption = 'Repayment Frequency';
                    ToolTip = 'Repayment Frequency';
                }
                // Repayment Start Date
                field("Repayment Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Repayment Start Date';
                    ToolTip = 'Repayment Start Date';

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec."Start Date" := CalcDate('1M', Rec."Disbursement Date");
                    end;
                }
                // Loan Period
                field("Loan Period"; Rec."Loan Period")
                {
                    ApplicationArea = All;
                    Caption = 'Loan Period';
                    ToolTip = 'Loan Period';
                }
                // Principal Repayment
                field("Principal Repayment"; Rec."Principal Repayment")
                {
                    ApplicationArea = All;
                    Caption = 'Principal Repayment';
                    ToolTip = 'Principal Repayment';
                    Editable = false;
                }
                // Monthly Interest
                field("Monthly Interest"; Rec."Monthly Interest")
                {
                    ApplicationArea = All;
                    Caption = 'Monthly Interest';
                    ToolTip = 'Monthly Interest';
                    Editable = false;
                }
                // Monthly Repayment
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ApplicationArea = All;
                    Caption = 'Monthly Repayment';
                    ToolTip = 'Monthly Repayment';
                    Editable = false;
                }
                // Total Loan Balance
                field("Total Loan Balance"; Rec."Total Loan Balance")
                {
                    ApplicationArea = All;
                    Caption = 'Total Loan Balance';
                    ToolTip = 'Total Loan Balance';
                    Editable = false;

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec."Total Loan Balance" := Rec."Amount Applied" + (Rec."Monthly Interest" + Rec."Loan Period");
                    end;
                }
                // Disbursement Date
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                    ApplicationArea = All;
                    Caption = 'Disbursement Date';
                    ToolTip = 'Disbursement Date';
                }
                // Loan  Status
                field("Loan Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Caption = 'Loan Status';
                    ToolTip = 'Loan Status';
                    Editable = false;
                }
                // Posted
                field(Posted; Rec."Posted")
                {
                    ApplicationArea = All;
                    Caption = 'Posted';
                    ToolTip = 'Posted';
                    Editable = false;
                }
                // Captured By
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = All;
                    Caption = 'Captured By';
                    ToolTip = 'Captured By';
                    Editable = false;
                }
            }

            part("Loan Charges"; "Loan Charges Lines List")
            {
                SubPageLink = "Loan Number" = field("Loan No.");
                ApplicationArea = All;
            }

            group(Disbursement)
            {
                field("Disbursement Acc"; Rec."Disbursement Account")
                {

                }
                field("Bank Account"; Rec."Bank Account")
                {

                }
                field("Net Take Home"; Rec."Net Take Home")
                {
                    Editable = false;
                }
            }
        }


    }

    actions
    {
        area(Processing)
        {
            action("Send Approval")
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Open then begin
                        Rec.Status := Rec.Status::"Pending Approval";
                        Message('Loan Sent for Approval');
                    end else
                        Error('Status must be Open');
                end;
            }

            action("Approve")
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                Image = Approve;

                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    if Rec.Status = Rec.status::"Pending Approval" then begin
                        Rec.Status := Rec.Status::Approved;
                        Message('Loan Approved');
                    end else
                        Error('Status must be "Pending Approval"');
                end;
            }

            action(Post)
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = New;
                Image = Post;

                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                        Rec.Status := Rec.Status::Posted;
                        Rec.Posted := true;
                        TempSavingsRecord.SetRange("Account No.", Rec."Disbursement Account");
                        if TempSavingsRecord.FindFirst() then begin
                            TempSavingsRecord.Balance += Rec."Net Take Home";
                            // Getting Loan Charges
                            PostTransactionCodeUnit.PostLoan(Rec."Disbursement Date", Rec.Name, Rec."Net Take Home", Rec."Member No.", Rec."Disbursement Account", Rec."Loan No.", Rec."Bank Account", "Document Type", "Transaction Type", Rec."Amount Approved", Rec."Loan Product Type", Rec."Loan No."); // To Implement

                            TempSavingsRecord.Modify();
                            Message('Loan has been successfully Posted');
                        end;
                    end else
                        Error('Status Must Approved')
                end;
            }

            // action("Loan Schedule")
            // {
            //     Promoted = true;
            //     PromotedCategory = New;
            //     PromotedIsBig = true;
            //     Image = Loaner;

            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //     begin
            //         "Loan Schedule Table".DeleteAll();
            //         "Loan Codeunit".GenerateLoanSchedule(Rec."Loan No.", Rec."Loan Product Type");
            //         "Loan Schedule Report".Run();
            //     end;
            // }

            // action("Loan Appraisal")
            // {
            //     Promoted = true;
            //     PromotedCategory = New;
            //     PromotedIsBig = true;
            //     Image = ReceiveLoaner;

            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //     begin
            //         "Loan Appraisal".SetAppraisalFilter(Rec."Loan No.");
            //         "Loan Appraisal".Run();
            //     end;
            // }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Rec."Loan Balance" := Rec."Amount Approved" + (Rec."Monthly Interest" + Rec."Loan Period");
        if Rec.Posted = true then begin
            CurrPage.Editable(false);
        end;
    end;

    trigger OnModifyRecord(): Boolean
    var
        "Charge Code": Code[20];
    begin
        Rec."Net Take Home" := Rec."Amount Approved";

        if Rec."Amount Approved" > 0 then begin
            if Rec."Loan No." <> '' then begin
                TableLoanChargesLines.SetRange("Loan Number", Rec."Loan No.");
                if TableLoanChargesLines.FindSet() then begin
                    repeat
                        "Charge Code" := TableLoanChargesLines."Charge Code";
                        TableLoanCharges.SetRange("Charge Code", "Charge Code");
                        if TableLoanCharges.FindSet() then begin
                            repeat
                                "Charge Code" := TableLoanCharges."Charge Code";
                                TableLoanCharges.Get("Charge Code");
                                if TableLoanCharges."Charge Method" = TableLoanCharges."Charge Method"::"% of Amount" then begin
                                    TableLoanChargesLines."Charge Amount" := (TableLoanCharges.Percentage * Rec."Amount Approved") / 100;
                                end else if TableLoanCharges."Charge Method" = TableLoanCharges."Charge Method"::Flat then begin
                                    TableLoanChargesLines."Charge Amount" := Rec."Amount Approved";
                                end;

                                TableLoanChargesLines.Modify();
                                Rec."Net Take Home" -= TableLoanChargesLines."Charge Amount";
                            until TableLoanCharges.Next() = 0;
                        end;
                    until TableLoanChargesLines.Next() = 0;
                end;
            end;
        end;
    end;

    var
        TempSavingsRecord: Record "Savings";
        TableLoanChargesLines: Record "Loan Charges Lines";
        PostTransactionCodeUnit: Codeunit "Loan Activities";
        TableLoanCharges: Record "Loan Charges";
        "Document Type": Enum "Bank Ledger Document Type";
        "Transaction Type": Enum "Loan Transaction Type";
}