page 50600 TruckplanningList
{
    ApplicationArea = All;
    Caption = 'Truckplanning';
    PageType = List;
    SourceTable = Truckplanning;
    UsageCategory = Lists;
    CardPageId = TruckplanningCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
            }
        }
    }
}
