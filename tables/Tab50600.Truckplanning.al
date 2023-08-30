table 50600 Truckplanning
{
    Caption = 'Truckplanning';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            DataClassification = SystemMetadata;
        }
        field(2; Employee; Code[20])
        {
            Caption = 'Employee';
            TableRelation = Employee."No.";
        }
        field(3; StartAddress; Code[20])
        {
            Caption = 'StartAddress';

            TableRelation = HellebrekersAddress;
        }
        field(4; TargetAddress; Code[20])
        {
            Caption = 'TargetAddress';
            TableRelation = HellebrekersAddress;
        }
        field(5; Description; Text[256])
        {
            Caption = 'Description';
        }
        field(6; "Order"; Code[20])
        {
            Caption = 'Order';
            TableRelation = "Sales Header"."No.";
        }
        field(7; "Requested Delivery Time"; Time)
        {
            Caption = 'Requested Delivery Time';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewNoSeriesCode: Code[20];
    begin
        if rec."No." = '' then
            NoSeriesMgt.InitSeries('TRUCKPLANNO', '', Today(), "No.", NewNoSeriesCode);
    end;

    procedure GetEmployeeFullName(): Text[256]
    var
        Employee: Record Employee;
    begin
        if (Rec.Employee = '') then begin
            exit('');
        end else begin
            Employee.Get(Rec.Employee);
            exit(Employee.FullName());
        end;
    end;

    procedure GetEmployeeRecord(): Record Employee
    var
        Employee: Record Employee;
    begin
        if (Rec.Employee = '') then begin
            exit(Employee);
        end else begin
            Employee.Get(Rec.Employee);
            exit(Employee);
        end;
    end;

    procedure GetFullAddress(_addressNo: Code[20]): Text[250];
    var
        _fullAddress: Text[250];
        _address: Record HellebrekersAddress;
    begin
        _address.Get(_addressNo);
        exit(_address.GetFullAddres());
    end;
}