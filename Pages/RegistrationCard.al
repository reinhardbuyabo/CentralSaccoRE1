// Page 50101 - Registration Card
page 50101 "Registration Card"
{
    PageType = Card;
    SourceTable = Registration;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(registration_no; Rec.registration_no)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(id_no; Rec.id_no)
                {
                    ApplicationArea = All;
                }
                field(first_name; Rec.first_name)
                {
                    ApplicationArea = All;
                }
                field(last_name; Rec.last_name)
                {
                    ApplicationArea = All;
                    
                trigger OnValidate()
                var
                    // myInt: Integer;
                begin
                    if Rec.first_name = '' then
                        Error('First name is required')
                    else
                        // Message('%1 %2', Rec.first_name, Rec.last_name);
                        Rec.full_name := Rec.first_name + ' ' + Rec.last_name;
                end;
                }
                // Identity Type
                field(identity_type; Rec.identity_type)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if Rec.identity_type = IdentityType::"National ID" then
                            Rec."Passport No." := ''
                        else if Rec.identity_type = IdentityType::Passport then
                            Rec."ID No." := ''
                    end;
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID number of the member.';
                    Editable = Rec.identity_type = IdentityType::"National ID";
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the passport number of the member.';
                    Editable = Rec.identity_type = IdentityType::Passport;
                }
                field(phone_no; Rec.phone_no)
                {
                    ApplicationArea = All;
                }
                field(location; Rec.location)
                {
                    ApplicationArea = All;
                }
                field(status; Rec.status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(captured_by; Rec.captured_by)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(approval_date; Rec.approval_date)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(approved_by; Rec.approved_by)
                {
                    ApplicationArea = All;
                    Editable = false;
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

            // Next of Kin
            action(NextOfKin)
            {
                ApplicationArea = All;
                Caption = 'Next of Kin';
                Image = NewLotProperties;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "Next of Kin List";
                RunPageLink = "No." = field(registration_no);

                trigger OnAction()
                var
                    NextOfKin: Record "Next of Kin";
                    NextOfKinList: Page "Next of Kin List";
                begin
                    
                end;
            }
        }
    }
}