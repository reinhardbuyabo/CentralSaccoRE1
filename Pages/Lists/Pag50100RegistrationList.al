// Page 50100 - Registration List
page 50100 "Registration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Registration;
    CardPageId = "Registration Card";
    Editable = false;
    // SourceTableView = WHERE(status <> CONST(Approved));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(registration_no; Rec.registration_no)
                {
                    ApplicationArea = All;
                    // DrillDownPageId = "Registration Card";
                }
                field(first_name; Rec.first_name)
                {
                    ApplicationArea = All;
                }
                field(last_name; Rec.last_name)
                {
                    ApplicationArea = All;
                }
                field("Identity Type"; Rec.identity_type)
                {
                    ApplicationArea = All;
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = All;
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = All;
                }
                // field(email; Rec.)
                field(phone_no; Rec.phone_no)
                {
                    ApplicationArea = All;
                }
                field(status; Rec.status)
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
            action(SendForApproval)
            {
                ApplicationArea = All;
                Caption = 'Send For Approval';
                Image = SendApprovalRequest;

                trigger OnAction()
                var
                    RegistrationMgt: Codeunit "Registration Management";
                begin
                    RegistrationMgt.SendForApproval(Rec);
                end;
            }

            action(ApproveRegistration)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;

                trigger OnAction()
                var
                    RegistrationMgt: Codeunit "Registration Management";
                begin
                    RegistrationMgt.ApproveRegistration(Rec);
                end;
            }

            action(RejectRegistration)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Reject;

                trigger OnAction()
                var
                    RegistrationMgt: Codeunit "Registration Management";
                begin
                    RegistrationMgt.RejectRegistration(Rec);
                end;
            }

            action(AutoApprove)
            {
                ApplicationArea = All;
                Caption = 'Auto Approve';
                Image = Entry;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    RegistrationMgt: Codeunit "Registration Management";
                begin
                    RegistrationMgt.AutoApproveRegistration(Rec);
                end;
            }
        }
    }
}