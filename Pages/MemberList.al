page 50111 "Member List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Membership;
    Editable = false;
    // CardPageId = "Member Card"; // Assuming you'll create a "Member Card" page later

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                // field(registration_no; Rec.registration_no)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the registration number.';
                // }
                field(member_no; Rec.member_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member number.';
                }
                field(name; Rec.name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the full name of the member.';
                }
                field(first_name; Rec.first_name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first name of the member';
                }
                field(last_name; Rec.last_name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last name of the member';
                }
                field(identity_type; Rec.identity_type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the identity type of the member.';
                }

                field(phone_no; Rec.phone_no)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the phone number of the member.';
                }
                field(location; Rec.location)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the location of the member';
                }
                field(status; Rec.status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the member.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewMember)
            {
                ApplicationArea = All;
                Caption = 'New Member';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.Init();
                    //    PAGE.RunModal(PAGE::"Member Card", Rec);
                end;
            }
        }
    }
}