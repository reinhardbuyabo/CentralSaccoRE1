// Table 50103 - SavingsAccount
table 50103 SavingsAccount
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; account_no; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Account No.';
        }
        field(2; member_no; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Member No.';
            TableRelation = Membership;
        }
        field(3; member_name; Text[100])
        {
            // DataClassification = CustomerContent;
            Caption = 'Member Name';
            FieldClass  = FlowField;
            CalcFormula = lookup(Membership.name WHERE(member_no = field(member_no))); // field - this // member)no from table
            Editable = false;
        }
        field(5; product_no; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Product No.';
            TableRelation = Product;
        }        
        // field(4; product_type; Enum ProductType)
        // {
        //     // DataClassification = CustomerContent;
        //     Caption = 'Product Type';
        //     FieldClass = FlowField;
        //     CalcFormula = lookup(Product."Product Type" WHERE("Product No." = field(product_no)));
        //     Editable = false;
        // }
        field(7; product_name; Text[100])
        {
            // DataClassification = CustomerContent;
            Caption = 'Product Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Product."Product Name" WHERE("Product No." = field(product_no)));
            Editable = false;
        }
        field(6; amount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
    }
    
    keys
    {
        key(PK; account_no)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Only verify account_no is not empty, as it's the primary key
        if Rec.account_no = '' then
            Format.FormatAccountNumber(Rec);
            
        if Rec.account_no = '' then
            Error('Could not generate a valid Account No.');
    end;

    var
        Format: Codeunit Formatting;
}