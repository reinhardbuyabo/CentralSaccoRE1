page 50102 "Next of Kin List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Next of Kin";
    Caption = 'Next of Kin List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the foreign key reference to registration';
                    Editable = false;
                    TableRelation = Registration.registration_no;
                    trigger OnValidate()
                    begin
                        if Rec."No." = '' then
                            Message(Format(Rec."No."));
                    end;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the Next of Kin';
                }
                field("ID No."; Rec."ID No.")
                {
                    ToolTip = 'Specifies the ID number';

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        // should be 8 digits
                        if StrLen(Format(Rec."ID No.")) <> 8 then
                            Error('ID No. must be 8 digits');
                    end;
                }
                field(Relationship; Rec.Relationship)
                {
                    ToolTip = 'Specifies the relationship to the member';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the mobile phone number';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the email address';
                }
                field("%Allocation"; Rec."%Allocation")
                {
                    ToolTip = 'Specifies the percentage allocation';

                    trigger OnValidate()
                    begin
                        // Validate individual allocation immediately
                    end;
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the type of Next of Kin';
                }
                field(Beneficiary; Rec.Beneficiary)
                {
                    ToolTip = 'Indicates if this Next of Kin is a beneficiary';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ValidateAllocations)
            {
                Caption = 'Validate Allocation';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ValidationCodeunit: Codeunit "Next of Kin Management";
                begin
                    ValidationCodeunit.ValidateTotalAllocation(Rec."No.");
                    Message('Allocation validation successful!');
                end;
            }
        }
    }

    trigger OnClosePage()
    var
        ValidationCodeunit: Codeunit "Next of Kin Management";
    begin
        ValidationCodeunit.ValidateTotalAllocation(Rec."No.");
        Message('Allocation validation successful!');
    end;
}