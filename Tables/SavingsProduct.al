// Table 50104 - SavingsProduct
table 50104 SavingsProduct
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; product_no; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Product No.';
        }
        field(2; product_type; Enum ProductType)
        {
            // DataClassification = CustomerContent;
            Caption = 'Product Type';
            // Step 1:
            FieldClass = FlowField;
            CalcFormula = Lookup(SavingsProduct.product_type WHERE(product_no = field(product_no)));
            Editable = false;
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