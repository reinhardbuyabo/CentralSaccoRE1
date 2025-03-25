codeunit 50101 Formatting
{
    trigger OnRun()
    begin
        
    end;
    
    var
        myInt: Integer;

    procedure FormatAccountNumber(Rec: Record SavingsAccount)
    var
        ProductNamePrefix: Text[3];
        ProductNameStr: Text[50];
        MemberRec: Record Membership;
        ProductRec: Record Product;
    begin
        // Only format if both values are available
        if (Rec.member_no > 0) and (Rec.product_no > 0) then begin
            // Get the product details
            if ProductRec.Get(Rec.product_no) then begin
                Rec.product_name := ProductRec."Product Name";
                
                ProductNameStr := Format(Rec.product_name);
                
                // Extract the first three characters of the Product Name
                if StrLen(ProductNameStr) >= 3 then
                    ProductNamePrefix := CopyStr(ProductNameStr, 1, 3)
                else
                    ProductNamePrefix := ProductNameStr;

                ProductNamePrefix := UpperCase(ProductNamePrefix);

                // Format account number
                Rec.account_no := StrSubstNo('%1-%2', ProductNamePrefix, Rec.member_no);
                // CurrPage.Update(true);
            end;
        end;
    end;
}