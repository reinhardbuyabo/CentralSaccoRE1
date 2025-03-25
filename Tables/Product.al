table 50106 Product
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Product No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Product Name"; Text[50]) // Fixed Deposit // Savings Account
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Product Type"; Enum ProductType) // Credit // Savings
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(PK; "Product No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}