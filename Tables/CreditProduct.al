// Table 50105 - CreditProduct

table 50105 CreditProduct
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; product_no; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Product No.';
        }
        field(2; loan_type; Enum "Loan Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Loan Type';
        }
    }
    
    keys
    {
        key(PK; product_no)
        {
            Clustered = true;
        }
    }
}
