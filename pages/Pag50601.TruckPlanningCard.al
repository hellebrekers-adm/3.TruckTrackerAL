page 50601 TruckPlanningCard
{
    ApplicationArea = All;
    Caption = 'TruckPlanning';
    PageType = Card;
    SourceTable = Truckplanning;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Employee; Rec.Employee)
                {
                    ToolTip = 'Specifies the value of the Employee field.';
                }
                field("Order"; Rec."Order")
                {
                    ToolTip = 'Specifies the value of the Order field.';
                }
                field(StartAddress; Rec.StartAddress)
                {
                    ToolTip = 'Specifies the value of the StartAddress field.';
                }
                field(TargetAddress; Rec.TargetAddress)
                {
                    ToolTip = 'Specifies the value of the TargetAddress field.';
                }
                field("Requested Delivery Time"; Rec."Requested Delivery Time")
                {
                    ToolTip = 'Specifies the value of the Requested Delivery Time field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
