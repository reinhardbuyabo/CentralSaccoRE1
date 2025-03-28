// Codeunit 50100 - Registration Management
codeunit 50100 "Registration Management"
{
    procedure SendForApproval(var RegistrationRec: Record Registration)
    begin
        if RegistrationRec.status <> RegistrationRec.status::New then
            Error('Only new registrations can be sent for approval.');

        RegistrationRec.status := RegistrationRec.status::PendingApproval;
        RegistrationRec.Modify();

        // Here you could add code to send notifications or create approval entries
        // if using Business Central's built-in approval system
        Message('The registration has been sent for approval.');
    end;

    procedure ApproveRegistration(var RegistrationRec: Record Registration)
    var
        Membership: Record Membership;
        NextMemberNo: Integer;
    begin
        if RegistrationRec.status <> RegistrationRec.status::PendingApproval then
            Error('Only registrations with Pending Approval status can be approved.');

        // Update registration status
        RegistrationRec.status := RegistrationRec.status::Approved;
        RegistrationRec.approval_date := Today;
        RegistrationRec.approved_by := UserId;
        RegistrationRec.Modify();

        // Generate next member number
        // if Membership.FindLast() then
        //     NextMemberNo := Membership.member_no + 1
        // else
        //     NextMemberNo := 1000; // Starting member number

        // Transfer to Membership table
        Membership.Init();
        Membership.member_no := RegistrationRec.registration_no;
        // Membership.id_no := RegistrationRec.id_no;
        Membership.first_name := RegistrationRec.first_name;
        Membership.last_name := RegistrationRec.last_name;
        // Message(RegistrationRec.full_name);
        Membership.name := RegistrationRec.full_name;
        // Message(Membership.name);
        Membership.phone_no := RegistrationRec.phone_no;
        Membership.location := RegistrationRec.location;
        Membership.status := Membership.status::Created; // Set as "Created" status
        Membership.captured_by := RegistrationRec.captured_by;
        Membership.Insert(true);

        Message('The registration has been approved and transferred to Membership.');
    end;

    procedure RejectRegistration(var RegistrationRec: Record Registration)
    begin
        if RegistrationRec.status <> RegistrationRec.status::PendingApproval then
            Error('Only registrations with Pending Approval status can be rejected.');

        RegistrationRec.status := RegistrationRec.status::Rejected;
        RegistrationRec.Modify();

        Message('The registration has been rejected.');
    end;

    // New Auto-Approve procedure - combines Send For Approval and Approve in a single step
    procedure AutoApproveRegistration(var RegistrationRec: Record Registration)
    var
        Membership: Record Membership;
        NextMemberNo: Integer;
    begin
        if RegistrationRec.status <> RegistrationRec.status::New then
            Error('Only new registrations can be auto-approved.');

        // Update registration status directly to Approved
        RegistrationRec.status := RegistrationRec.status::Approved;
        RegistrationRec.approval_date := Today;
        RegistrationRec.approved_by := UserId;
        RegistrationRec.Modify();

        // Generate next member number
        // if Membership.FindLast() then
        //     NextMemberNo := Membership.member_no + 1
        // else
        //     NextMemberNo := 1000; // Starting member number

        // Transfer to Membership table
        Membership.Init();
        Membership.member_no := RegistrationRec.registration_no;
        Membership.identity_type := RegistrationRec.identity_type;
        Membership."ID No." := RegistrationRec."ID No.";
        Membership."Passport No." := RegistrationRec."Passport No.";
        Membership.first_name := RegistrationRec.first_name;
        Membership.last_name := RegistrationRec.last_name;
        Membership.name := RegistrationRec.full_name;
        Membership.phone_no := RegistrationRec.phone_no;
        Membership.location := RegistrationRec.location;
        Membership.status := Membership.status::Created; // Set as "Created" status
        Membership.captured_by := RegistrationRec.captured_by;
        Membership.Insert(true);

        Message('The registration has been auto-approved and transferred to Membership.');
    end;

    procedure DeleteRegistration(var RegistrationRec: Record Registration)
    var
        myInt: Integer;
    begin

    end;
}