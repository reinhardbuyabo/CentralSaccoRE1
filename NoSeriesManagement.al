codeunit 50101 "Test No. Series Management"
{
    // Global variables to simulate No. Series state
    var
        LastNoSeriesLine: Record "No. Series Line";
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
        NoSeriesRelationship: Record "No. Series Relationship";
        TryNoSeriesCode: Code[20];
        TrySeriesDate: Date;
        TryNo: Code[20];
        WarningNoSeriesCode: Code[20];
        // TextManagement: Codeunit "Text Management";

    // Get next number
    procedure GetNextNo(NoSeriesCode: Code[20]; SeriesDate: Date; ModifySeries: Boolean): Code[20]
    begin
        exit(DoGetNextNo(NoSeriesCode, SeriesDate, ModifySeries, false));
    end;

    // Core implementation of getting next number
    procedure DoGetNextNo(NoSeriesCode: Code[20]; SeriesDate: Date; ModifySeries: Boolean; NoErrorsOrWarnings: Boolean): Code[20]
    var
        Text004: Label 'No. Series %1 has no lines for date %2.';
        Text005: Label 'No. Series %1 does not exist.';
        Text006: Label 'Date %1 is not within the range of the No. Series %2.';
        Text007: Label 'The last used No. (%1) in No. Series %2 has been reached.';
    begin
        // Reset warning series code if a new generation starts
        if SeriesDate = 0D then
            SeriesDate := WorkDate();

        // Modify series or reset last series line
        if ModifySeries or (LastNoSeriesLine."Series Code" = '') then begin
            if ModifySeries then
                NoSeriesLine.LockTable();

            // Verify No. Series exists
            if not NoSeries.Get(NoSeriesCode) then begin
                if NoErrorsOrWarnings then
                    exit('');
                Error(Text005, NoSeriesCode);
            end;

            // Set line filter and find first applicable line
            SetNoSeriesLineFilter(NoSeriesLine, NoSeriesCode, SeriesDate);
            if not NoSeriesLine.FindFirst() then begin
                if NoErrorsOrWarnings then
                    exit('');

                // Additional error checking
                NoSeriesLine.SetRange("Starting Date");
                if not NoSeriesLine.IsEmpty() then
                    Error(Text004, NoSeriesCode, SeriesDate);
                
                Error(Text005, NoSeriesCode);
            end;
        end else
            NoSeriesLine := LastNoSeriesLine;

        // Date order validation
        if NoSeries."Date Order" and (SeriesDate < NoSeriesLine."Last Date Used") then begin
            if NoErrorsOrWarnings then
                exit('');
            Error(Text006, NoSeries.Code, NoSeriesLine."Last Date Used");
        end;

        // Update last date used
        NoSeriesLine."Last Date Used" := SeriesDate;

        // Handle initial or subsequent number generation
        if NoSeriesLine."Last No. Used" = '' then begin
            if NoErrorsOrWarnings and (NoSeriesLine."Starting No." = '') then
                exit('');
            
            NoSeriesLine.TestField("Starting No.");
            NoSeriesLine."Last No. Used" := NoSeriesLine."Starting No.";
        end else begin
            // Increment number based on increment setting
            if NoSeriesLine."Increment-by No." <= 1 then
                NoSeriesLine."Last No. Used" := IncStr(NoSeriesLine."Last No. Used")
            else
                IncrementNoText(NoSeriesLine."Last No. Used", NoSeriesLine."Increment-by No.");
        end;

        // Check ending number constraints
        if (NoSeriesLine."Ending No." <> '') and 
           (NoSeriesLine."Last No. Used" > NoSeriesLine."Ending No.") then begin
            if NoErrorsOrWarnings then
                exit('');
            Error(Text007, NoSeriesLine."Ending No.", NoSeriesCode);
        end;

        // Warning for approaching end of series
        if (NoSeriesLine."Ending No." <> '') and 
           (NoSeriesLine."Warning No." <> '') and
           (NoSeriesLine."Last No. Used" >= NoSeriesLine."Warning No.") and
           (NoSeriesCode <> WarningNoSeriesCode) and
           (TryNoSeriesCode = '') then begin
            if NoErrorsOrWarnings then
                exit('');
            
            WarningNoSeriesCode := NoSeriesCode;
            Message(Text007, NoSeriesLine."Ending No.", NoSeriesCode);
        end;

        // Validate and modify/save series line
        NoSeriesLine.Validate(Open);
        if ModifySeries then
            NoSeriesLine.Modify()
        else
            LastNoSeriesLine := NoSeriesLine;

        exit(NoSeriesLine."Last No. Used");
    end;

    // Set No. Series Line Filter
    procedure SetNoSeriesLineFilter(var NoSeriesLine: Record "No. Series Line"; NoSeriesCode: Code[20]; StartDate: Date)
    begin
        if StartDate = 0D then
            StartDate := WorkDate();

        NoSeriesLine.Reset();
        NoSeriesLine.SetCurrentKey("Series Code", "Starting Date");
        NoSeriesLine.SetRange("Series Code", NoSeriesCode);
        NoSeriesLine.SetRange("Starting Date", 0D, StartDate);

        if NoSeriesLine.FindLast() then begin
            NoSeriesLine.SetRange("Starting Date", NoSeriesLine."Starting Date");
            NoSeriesLine.SetRange(Open, true);
        end;
    end;

    // Increment No. Text
    procedure IncrementNoText(var No: Code[20]; IncrementByNo: Decimal)
    var
        StartPos: Integer;
        EndPos: Integer;
        BigIntNo: BigInteger;
        BigIntIncByNo: BigInteger;
        NewNo: Text;
    begin
        GetIntegerPos(No, StartPos, EndPos);
        Evaluate(BigIntNo, CopyStr(No, StartPos, EndPos - StartPos + 1));
        BigIntIncByNo := IncrementByNo;
        NewNo := Format(BigIntNo + BigIntIncByNo, 0, 1);
        ReplaceNoText(No, NewNo, 0, StartPos, EndPos);
    end;

    // Get Integer Position
    local procedure GetIntegerPos(No: Code[20]; var StartPos: Integer; var EndPos: Integer)
    var
        i: Integer;
        IsDigit: Boolean;
    begin
        StartPos := 0;
        EndPos := 0;
        
        if No <> '' then begin
            i := StrLen(No);
            repeat
                IsDigit := No[i] in ['0'..'9'];
                if IsDigit then begin
                    if EndPos = 0 then
                        EndPos := i;
                    StartPos := i;
                end;
                i := i - 1;
            until (i = 0) or ((StartPos <> 0) and not IsDigit);
        end;
    end;

    // Replace No. Text
    local procedure ReplaceNoText(var No: Code[20]; NewNo: Code[20]; FixedLength: Integer; StartPos: Integer; EndPos: Integer)
    var
        StartNo: Code[20];
        EndNo: Code[20];
        NewLength: Integer;
        OldLength: Integer;
        ZeroNo: Code[20];
        Text010: Label 'Number %1 is too long.';
    begin
        if StartPos > 1 then
            StartNo := CopyStr(No, 1, StartPos - 1);
        
        if EndPos < StrLen(No) then
            EndNo := CopyStr(No, EndPos + 1);

        NewLength := StrLen(NewNo);
        OldLength := EndPos - StartPos + 1;

        if FixedLength > OldLength then
            OldLength := FixedLength;

        if OldLength > NewLength then
            ZeroNo := PadStr('', OldLength - NewLength, '0');

        if StrLen(StartNo) + StrLen(ZeroNo) + StrLen(NewNo) + StrLen(EndNo) > 20 then
            Error(Text010, No);

        No := StartNo + ZeroNo + NewNo + EndNo;
    end;
}