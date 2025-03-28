codeunit 50102 "Next of Kin Management"
{
    procedure ValidateTotalAllocation(MemberID: Code[8])
    var
        NextOfKin: Record "Next of Kin";
        TotalAllocation: Decimal;
    begin
        // Get total allocation for the given Member ID
        NextOfKin.SetRange("No.", MemberID);
        if NextOfKin.FindSet() then begin
            repeat
                TotalAllocation += NextOfKin."%Allocation";
            until NextOfKin.Next() = 0;
        end;

        // Ensure total allocation is exactly 100%
        if TotalAllocation <> 100 then
            Error('Total allocation for Member ID %1 must be exactly 100%. Current total: %2%', MemberID, TotalAllocation);
    end;
}