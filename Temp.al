// Page for Temporary Record Input
page 50149 "Temporary Employee Input"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Temporary Employee Buffer";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    
                    trigger OnValidate()
                    begin
                        // Optional: Add any inline validation
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ValidateAndInsert)
            {
                Caption = 'Validate & Insert Employees';
                ApplicationArea = All;
                Image = Process;
                
                trigger OnAction()
                var
                    Employee: Record Employee;
                    TempEmployeeBuffer: Record "Temporary Employee Buffer" temporary;
                    EmployeeInsertErr: Label 'Error inserting employee %1: %2';
                    // NoSeriesMgt
                    NoSeriesManagement: Codeunit "Test No. Series Management";
                begin
                    // Copy current page records to temporary record
                    CurrPage.SetSelectionFilter(TempEmployeeBuffer);
                    
                    // Validate and insert records
                    if TempEmployeeBuffer.FindSet() then
                    repeat
                        // Reset the Employee record for each iteration
                        Employee.Init();
                        
                        // Validate Employee No.
                        if TempEmployeeBuffer."Employee No." = '' then begin
                            // Option 1: Auto-generate No. Series
                            Employee."No." := NoSeriesManagement.GetNextNo('EMPLOYEE', WorkDate(), true);
                        end else begin
                            // Option 2: Use provided Employee No.
                            Employee."No." := TempEmployeeBuffer."Employee No.";
                        end;
                        
                        // // Populate other fields
                        // Employee.Name := TempEmployeeBuffer.Name;
                        // Employee.Department := TempEmployeeBuffer.Department;
                        
                        // // Validate the record
                        // Employee.Validate(Name);
                        
                        // Insert the record
                        if Employee.Insert(true) then begin
                            // Optional: You could delete the temp record or mark as processed
                        end else begin
                            // Handle insertion error
                            Message(EmployeeInsertErr, Employee."No.", GetLastErrorText());
                        end;
                    until TempEmployeeBuffer.Next() = 0;
                    
                    // Refresh the page or close it after processing
                    CurrPage.Update(false);
                    Message('Employees processed successfully!');
                end;
            }
        }
    }
}

// Temporary Buffer Table
table 50149 "Temporary Employee Buffer"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            
            trigger OnValidate()
            begin
                // Optional: Add any validation logic
            end;
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Department; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation =;
        }
    }
    
    keys
    {
        key(PK; "Employee No.")
        {
            Clustered = true;
        }
    }
}