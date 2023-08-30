page 50602 TruckPlanningMap
{
    ApplicationArea = All;
    Caption = 'TruckPlanningMap';
    PageType = Document;
    UsageCategory = Tasks;
    Editable = false;
    SourceTable = Truckplanning;
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                ShowCaption = false;

                group(TruckPlanMapPart)
                {
                    ShowCaption = false;
                    repeater(LISTREP)
                    {
                        field("No."; Rec."No.")
                        {
                            ApplicationArea = All;
                            Caption = 'Truck No.';
                            Editable = false;
                            ToolTip = 'Truck No.';
                        }

                        field("Employee"; Rec.Employee)
                        {
                            ApplicationArea = All;
                            Caption = 'Employee';
                            Editable = false;
                            ToolTip = 'Employee';
                        }
                    }
                }

                usercontrol(Maps; GoogleMaps)
                {
                    ApplicationArea = All;

                    trigger ControlReady()
                    begin
                        CurrPage.Maps.InitializeHtml();
                    end;

                    trigger HtmlInitializedCallback()
                    var
                    begin
                        CurrPage.PageUpdater.StartUpdateLoop(130);                        // CurrPage.Maps.StartUpdatePageLoop();
                        AddAllDriversToJS();
                    end;

                    trigger RouteVisualizedCallback(Employee: Text)
                    begin
                        // Message('routes visualized');
                        CurrPage.Maps.FocusOnRoute(Employee);
                    end;
                }
                usercontrol(PageUpdater; PageUpdaterControlAddin)
                {
                    ApplicationArea = All;
                    trigger OnUpdate()
                    begin
                        CurrPage.Update();
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(StartTruck)
            {
                ApplicationArea = All;
                Caption = 'Start';
                Promoted = true;
                PromotedCategory = Process;
                Image = Start;

                trigger OnAction()
                begin
                    CurrPage.maps.StartDrivingCar(Rec."No.");
                    // CurrPage.TruckPlansListPart.Page.StartTruck();
                end;
            }

            action(SendNotification)
            {
                ApplicationArea = All;
                Caption = 'Send Notification';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    _notification: Notification;
                    _notificationMessage: Text;
                begin
                    _notification.Message('Your truck is on the way.');
                    _notification.Send();
                end;

            }
        }
    }


    var
        MaxRecordCount: Integer;

    //Initialize variables here
    trigger OnInit()
    begin
        MaxRecordCount := 4;
    end;

    trigger OnAfterGetCurrRecord()
    begin
    end;

    protected procedure AddAllDriversToJS();
    var
        _truckerRecord: Record Truckplanning;
        _totalTruckerCount: Integer;
        _truckerCount: Integer;
        _orderRecord: Record "Sales Header";
    begin

        _totalTruckerCount := Rec.Count;


        if _truckerRecord.FindSet() then begin
            repeat
                if (_truckerRecord.Order <> '') then begin
                    _orderRecord.Get("Sales Document Type"::Order, _truckerRecord.Order);
                    CurrPage.Maps.AddTruckDriver(_truckerRecord."No.", _truckerRecord.Employee, _truckerRecord.GetFullAddress(_truckerRecord.StartAddress), _totalTruckerCount);
                    SetRouteForDriver(_truckerRecord);
                    _truckerCount += 1;
                end

            until (_truckerRecord.Next() = 0) or (_truckerCount >= MaxRecordCount);
            // _proressBarCardTracker.SetPercentage(100);
        end;
    end;

    /// <summary>
    /// Sets the route for a driver
    /// </summary>
    /// <param name="truckerRecord"></param>
    protected procedure SetRouteForDriver(truckerRecord: Record Truckplanning);
    begin
        CurrPage.Maps.SetRouteForTruckDriver(truckerRecord."No.", truckerRecord.GetFullAddress(truckerRecord.StartAddress), truckerRecord.GetFullAddress(truckerRecord.TargetAddress));
    end;


}
