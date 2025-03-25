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
                field(name; Rec.full_name){
                    ApplicationArea = All;
                    Editable = false;
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
        }
    }
}