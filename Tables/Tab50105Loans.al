table 50105 "Loans"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Loan No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Member No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Membership;
        }
        field(3; "Loan Product Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Loan Product Types";
        }
        field(4; "Loan Product Name"; Text[30])
        {
            // DataClassification = ToBeClassified; // can only be used for normal fieldclasses
            FieldClass = FlowField;
            CalcFormula = lookup("Loan Product Types".Description where("Loan Product Code" = field("Loan Product Type")));
        }
        field(5; "Application Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Disbursement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Status"; Enum "Loan Status")
        {
            DataClassification = ToBeClassified;
        }
        field(8; Name; Text[200])
        {
            // DataClassification = ToBeClassified; // Only in Normal fieldclasses
            FieldClass = FlowField;
            CalcFormula = lookup(Membership.name where(member_no = field("Member No.")));
        }
        field(9; "ID No."; Code[8])
        {
            // DataClassification = ToBeClassified; // Normal Fieldclasses
            FieldClass = FlowField;
            CalcFormula = LOOKUP(Membership."ID No." where(member_no = field("Member No.")));
        }
        field(10; "Amount Applied"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // Get Loan Product Type based on PK
                LoanProductTypes.Get("Loan Product Type");
                // check if the Amount Applied Field is less than The Product Type's Minimum Loan
                if "Amount Applied" < LoanProductTypes."Minimum Loan" then begin
                    Error('The lowest amount you can apply is %1', LoanProductTypes."Minimum Loan");
                end;

                // check if the Amount Applied Field is greater than The Product Type's Maximum Loan
                if "Amount Applied" > LoanProductTypes."Maximum Loan" then begin
                    Error('The highest amount you can apply is %1', LoanProductTypes."Maximum Loan");
                end;
            end;
        }
        field(11; "Amount Approved"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                LoanProductTypes.Get("Loan Product Type");
                // check if the Amount Approved Field is less than The Product Type's Minimum Loan
                if "Amount Approved" < LoanProductTypes."Minimum Loan" then begin
                    Error('The lowest amount you can approve is %1', LoanProductTypes."Minimum Loan");
                end;

                // check if the Amount Approved Field is greater than The Product Type's Maximum Loan 
                if "Amount Approved" > LoanProductTypes."Maximum Loan" then begin
                    Error('The highest amount you can approve is %1', LoanProductTypes."Maximum Loan");
                end;
            end;
        }
        field(12; "Interest Rate"; Integer)
        {
            // DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = LOOKUP("Loan Product Types"."Interest Rate" WHERE("Loan Product Code" = field("Loan Product Type")));
        }
        field(13; "Loan Period"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                LoanProductTypes.Get("Loan Product Type");
                "Loan Period" := LoanProductTypes."Interest Rate";

                if "Loan Period" < LoanProductTypes."Minimum Installement" then begin
                    Error('The shortest period you can apply is %1', LoanProductTypes."Minimum Installement");
                end;

                if "Loan Period" > LoanProductTypes."Maximum Installment" then begin
                    Error('The longest period you can apply is %1', LoanProductTypes."Maximum Installment");
                end;
            end;
        }
        field(14; "Total Loan Balance"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                //  if loan balance is greater than 0, then it is an active loan
                if "Loan Balance" > 0 then begin
                    "Total Loan Balance" := "Loan Balance" + ("Monthly Interest" + "Loan Period");
                end;
            end;
        }
        field(15; "Principal Repayment"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Principal Repayment" := "Amount Approved" / "Loan Period";
            end;
        }
        field(16; "Monthly Interest"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Monthly Interest" := ("Amount Approved" / ("Interest Rate" / 12)) / 100;
            end;
        }
        field(17; "Monthly Repayment"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Monthly Repayment" := "Principal Repayment" + "Monthly Interest";
            end;
        }
        field(18; "Loan Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Interest Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Interest Due"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Interest Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Principal Due"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Principal Paid"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Principal Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Bank Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Accounts"; // change here
        }
        field(27; "Disbursement Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Savings where("Member No." = field("Member No.")); // change here
        }
        field(28; "Net Take Home"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Captured By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Start Date" := CalcDate('1M', "Disbursement Date");
            end;
        }
        field(31; "Payment Frequency"; Enum "Loan Payment Frequency")
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Loan No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        LoanProductTypes: Record "Loan Product Types";
        NoSeriesMgt: Codeunit "No. Series";
        LoanLinesTable: Record "Loan Charges Lines";

    trigger OnInsert()
    begin
        "Captured By" := USERID;
        "Application Date" := TODAY;
        "Disbursement Date" := TODAY;
        "Loan No." := NoSeriesMgt.GetNextNo('LOAN', WorkDate, true);
        LoanLinesTable."Loan Number" := "Loan No.";
        LoanLinesTable.INSERT();
    end;

    trigger OnModify()
    begin
        // if amount approved is positive
        if "Amount Approved" > 0 then begin
            if "Loan Period" > 0 then begin
                "Principal Repayment" := "Amount Approved" / "Loan Period";
                "Monthly Interest" := ("Amount Approved" / ("Interest Rate" / 12)) / 100;
                "Monthly Repayment" := "Principal Repayment" + "Monthly Interest";
                "Principal Due" := "Monthly Interest";
                "Principal Balance" := "Monthly Interest";
                "Interest Due" := "Monthly Interest";
                "Principal Balance" := "Amount Approved";
                "Loan Balance" := "Principal Balance" + "Interest Due";

                if Rec."Loan Balance" > 0 then begin
                    Rec."Total Loan Balance" := (Rec."Loan Balance" + (Rec."Monthly Interest" + Rec."Loan Period")) - Rec."Monthly Interest";
                    Rec."Loan Balance" := Rec."Principal Balance" + Rec."Interest Due";
                end else begin
                    Rec."Loan Balance" := 0;
                    Rec."Total Loan Balance" := 0;
                end;
            end
        end
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}