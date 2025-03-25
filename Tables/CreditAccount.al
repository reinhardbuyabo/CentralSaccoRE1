table 50102 "Credit Account"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Account No"; Text[10]) {  }
        field(2; "Member No"; Integer) { DataClassification = CustomerContent; }
        field(3; "Member Name"; Text[100]) { DataClassification = CustomerContent; }
        field(4; "Loan Type"; Enum "Loan Type") { DataClassification = CustomerContent; }
        field(5; "Loan No"; Integer) { DataClassification = CustomerContent; }
        field(6; "Amount"; Decimal) { DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "Account No") { Clustered = true; }
    }
}
