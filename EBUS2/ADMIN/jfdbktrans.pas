unit jfdbktrans;

{ prutherford440 09:44 30/10/2001: Disabled Byte Alignment in Delphi 6.0 }
{$ALIGN 1}  { Variable Alignment Disabled }


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, SBSPanel, ComCtrls, StdCtrls, TEditVal, Mask, BorBtns, Buttons,
  GlobVar, VarConst, ExWrap1U, BTSupU1, SupListU, SBSComp, SBSComp2,
  Menus, bkgroup, AccelLbl, BtrvList, DybkLine, EBusCnst, ActnList, EntUtil;

type
  TEBusLinesList = class(TGenList)
    public
      function SetCheckKey : Str255; override;
      function OutLine(Col : byte) : str255; override;
  end;

  TfrmOneTransaction = class(TForm)
    pgcOneTransaction: TPageControl;
    tabMain: TTabSheet;
    sbxMain: TScrollBox;
    pnlQty: TSBSPanel;
    pnlStk: TSBSPanel;
    pnlDesc: TSBSPanel;
    pnlLT: TSBSPanel;
    pnlUPrc: TSBSPanel;
    pnlVAT: TSBSPanel;
    pnlColumnHeaders: TSBSPanel;
    pnlStkHead: TSBSPanel;
    pnlQtyHead: TSBSPanel;
    pnlUPrcHead: TSBSPanel;
    pnlDiscHead: TSBSPanel;
    pnlVATHead: TSBSPanel;
    pnlDescHead: TSBSPanel;
    pnlListControls: TSBSPanel;
    pnlDisc: TSBSPanel;
    pnlLTHead: TSBSPanel;
    tabFooter: TTabSheet;
    pnlFooterVAT: TSBSPanel;
    pnlVATTitle: TSBSPanel;
    I5VATRLab: TLabel;
    Label8: TLabel;
    I5VATLab: TLabel;
    pnlButtons: TSBSPanel;
    sbxButtons: TScrollBox;
    btnEdit: TButton;
    btnDelete: TButton;
    btnInsert: TButton;
    btnAdd: TButton;
    pnlFooterButtons: TSBSPanel;
    tabNotes: TTabSheet;
    TCNScrollBox: TScrollBox;
    TNHedPanel: TSBSPanel;
    NDateLab: TSBSPanel;
    NDescLab: TSBSPanel;
    NUserLab: TSBSPanel;
    NDatePanel: TSBSPanel;
    NDescPanel: TSBSPanel;
    NUserPanel: TSBSPanel;
    TCNListBtnPanel: TSBSPanel;
    pnlHeader: TSBSPanel;
    Label84: Label8;
    I1CurrLab: Label8;
    Label81: Label8;
    I1ExLab: Label8;
    Label88: Label8;
    Label817: Label8;
    btnDelivery: TSpeedButton;
    I1DueDateL: Label8;
    edtOurRef: Text8Pt;
    edtOperator: Text8Pt;
    edtACCode: Text8Pt;
    edtTransDate: TEditDate;
    edtDueDate: TEditDate;
    edtExchRate: TCurrencyEdit;
    edtPeriod: TEditPeriod;
    cbxCurrency: TSBSComboBox;
    mnuPopUp: TPopupMenu;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    N2: TMenuItem;
    mniProperties: TMenuItem;
    N1: TMenuItem;
    mniSaveOnExit: TMenuItem;
    N3: TMenuItem;
    mniInsert: TMenuItem;
    I1BtmPanel: TSBSPanel;
    Label813: Label8;
    lblCC: Label8;
    lblDept: Label8;
    lblLocation: Label8;
    Label819: Label8;
    I1VATTLab: Label8;
    Label821: Label8;
    edtGLCodeDesc: Text8Pt;
    edtCCCode: Text8Pt;
    edtDepCode: Text8Pt;
    edtLocCode: Text8Pt;
    edtNetTotal: TCurrencyEdit;
    edtVATContent: TCurrencyEdit;
    edtGrossTotal: TCurrencyEdit;
    sbxVATAnalysis: TScrollBox;
    edtVATDesc1: Text8Pt;
    edtVATDesc2: Text8Pt;
    edtVATDesc3: Text8Pt;
    edtVATDesc4: Text8Pt;
    edtVATDesc5: Text8Pt;
    edtVATDesc6: Text8Pt;
    edtVATDesc7: Text8Pt;
    edtVATGoods1: TCurrencyEdit;
    edtVATGoods2: TCurrencyEdit;
    edtVATGoods3: TCurrencyEdit;
    edtVATGoods4: TCurrencyEdit;
    edtVATGoods5: TCurrencyEdit;
    edtVATGoods6: TCurrencyEdit;
    edtVATGoods7: TCurrencyEdit;
    edtVATAmnt1: TCurrencyEdit;
    edtVATAmnt2: TCurrencyEdit;
    edtVATAmnt3: TCurrencyEdit;
    edtVATAmnt4: TCurrencyEdit;
    edtVATAmnt5: TCurrencyEdit;
    edtVATAmnt6: TCurrencyEdit;
    edtVATAmnt7: TCurrencyEdit;
    chkVATAmended: TBorCheck;
    edtSettleDiscPercent: TCurrencyEdit;
    edtSettleDiscDays: TCurrencyEdit;
    chkSettleDiscTaken: TBorCheck;
    edtNoSettleNet: TCurrencyEdit;
    edtNoSettleVAT: TCurrencyEdit;
    edtNoSettleDisc: TCurrencyEdit;
    edtNoSettleTotal: TCurrencyEdit;
    edtSettleNet: TCurrencyEdit;
    edtSettleVAT: TCurrencyEdit;
    edtSettleDisc: TCurrencyEdit;
    edtSettleTotal: TCurrencyEdit;
    mniDelete: TMenuItem;
    pnlFooterTotals: TSBSBackGroup;
    Label5: TLabel;
    Label6: TLabel;
    pnlDiscNotTaken: TSBSPanel;
    Label13: TLabel;
    pnlDiscTaken: TSBSPanel;
    Label21: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    lblCurrency: Label8;
    edtVATDesc8: Text8Pt;
    edtVATGoods8: TCurrencyEdit;
    edtVATAmnt8: TCurrencyEdit;
    edtVATDesc9: Text8Pt;
    edtVATGoods9: TCurrencyEdit;
    edtVATAmnt9: TCurrencyEdit;
    edtVATDesc10: Text8Pt;
    edtVATGoods10: TCurrencyEdit;
    edtVATAmnt10: TCurrencyEdit;
    I5Vr11F: Text8Pt;
    I5VG11F: TCurrencyEdit;
    I5VV11F: TCurrencyEdit;
    I5VR12F: Text8Pt;
    I5VG12F: TCurrencyEdit;
    I5VV12F: TCurrencyEdit;
    I5Vr13F: Text8Pt;
    I5VG13F: TCurrencyEdit;
    I5VV13F: TCurrencyEdit;
    I5Vr14F: Text8Pt;
    I5VG14F: TCurrencyEdit;
    I5VV14F: TCurrencyEdit;
    I5Vr15F: Text8Pt;
    I5VG15F: TCurrencyEdit;
    I5VV15F: TCurrencyEdit;
    I5VV16F: TCurrencyEdit;
    I5VG16F: TCurrencyEdit;
    I5Vr16F: Text8Pt;
    I5Vr17F: Text8Pt;
    I5VG17F: TCurrencyEdit;
    I5VV17F: TCurrencyEdit;
    I5VV18F: TCurrencyEdit;
    I5VG18F: TCurrencyEdit;
    I5Vr18F: Text8Pt;
    I5Vr19F: Text8Pt;
    I5VG19F: TCurrencyEdit;
    I5VV19F: TCurrencyEdit;
    I5Vr20F: Text8Pt;
    I5VG20F: TCurrencyEdit;
    I5VV20F: TCurrencyEdit;
    I5Vr21F: Text8Pt;
    I5VG21F: TCurrencyEdit;
    I5VV21F: TCurrencyEdit;
    chkFixedRate: TBorCheck;
    btnClose: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    I1YrRefL: Label8;
    edtYourRef: Text8Pt;
    edtAltRef: Text8Pt;
    I1YrRef2L: Label8;
    pnlViewStatus: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    actDaybookTrans: TActionList;
    actAddLine: TAction;
    actEditLine: TAction;
    actDeleteLine: TAction;
    pnlFooterLineType: TSBSBackGroup;
    edtLineType4: TCurrencyEdit;
    I5LTLab4: TLabel;
    I5LTLab3: TLabel;
    edtLineType2: TCurrencyEdit;
    edtLineType3: TCurrencyEdit;
    I5LTLab2: TLabel;
    I5LTLab1: TLabel;
    edtLineType1: TCurrencyEdit;
    memAddress: TMemo;
    btnCloseFooter: TButton;
    btnCancelFooter: TButton;
    btnOKFooter: TButton;
    btnIntraStat: TSpeedButton;
    Label834: Label8;
    edtControlNom: Text8Pt;
    actCancel: TAction;
    procedure pgcOneTransactionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure HeadersMouseDownExecute(Sender: TObject; Button: TMouseButton;
                Shift: TShiftState; X, Y: Integer);
    procedure HeadersMouseMoveExecute(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MoveAlignColsExecute(Sender: TObject; Button: TMouseButton;
                Shift: TShiftState; X, Y: Integer);
    procedure mniSaveOnExitClick(Sender: TObject);
    procedure mniPropertiesClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDeliveryClick(Sender: TObject);
    procedure actAddLineExecute(Sender: TObject);
    procedure actEditLineExecute(Sender: TObject);
    procedure actDeleteLineExecute(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtACCodeExit(Sender: TObject);
    procedure cbxCurrencyExit(Sender: TObject);
    procedure edtTransDateExit(Sender: TObject);
    procedure edtPeriodExit(Sender: TObject);
    procedure edtDueDateExit(Sender: TObject);
    procedure edtYourRefExit(Sender: TObject);
    procedure edtAltRefExit(Sender: TObject);
    procedure edtExchRateExit(Sender: TObject);
    procedure chkFixedRateClick(Sender: TObject);
    procedure btnIntraStatClick(Sender: TObject);
    procedure CheckTraderDependencies;
    procedure edtControlNomExit(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    fVATRateUsed : array[VATType] of boolean; // Whether particular VAT code in use
    fVATGoods : array[VATType] of double;     // Line Totals per VAT code
    FormStuff : TFormStuff;
    frmTransactionLine : TfrmTransactionLine;
    fEditMode : TFormActivate;
    fExLocalTransHead : ^TExLocalEBus;
    fHeaderChanged : boolean;
    function  TraderControlNomSet(const TraderCode : string) : boolean;
    function  CancellingEdits : boolean;
    procedure InitialFormSetup;
    procedure EnableVATEditing;
    procedure ShowLineDetailsForm(Mode : TFormActivate);
    procedure TransactionLineUpdated;
    procedure WMCustGetRec(var Message : TMessage); message WM_CustGetRec;
    procedure WMGetMinMaxInfo(var Message : TWMGetMinMaxInfo); message WM_GetMinMaxInfo;
    procedure WMSysCommand(var Message : TMessage); message WM_SysCommand;
    procedure WMFormCloseMsg(var Message : TMessage); message WM_FormCloseMsg;
    procedure CalcHeaderTotals;
    procedure RefreshVATAnalysis;
    procedure RefreshTransHeader;
    procedure RefreshList;
    procedure SetEditMode(Value : TFormActivate);
    procedure UpdateDisplay;
    procedure CloseTransaction;
    procedure RecalculateHeaderFromLines;
    procedure MustBeSaved;
    procedure EnableEditing;
    procedure SetBoolean(const Index: Integer; const Value: boolean);
    procedure SaveHeader;
    procedure ExchangeRateEnabled;
  protected
    property  HeaderChanged : boolean index 1 read fHeaderChanged write SetBoolean;
  public
    property  EditMode : TFormActivate read fEditMode write SetEditMode;
    procedure RefreshDetails;
    procedure ReadTransaction;
  end;

implementation

{$R *.DFM}

uses
  BtKeys1U, AdmnUtil, EBusUtil, UseDLLU, UseTKit, TKitUtil,
  MathUtil, StrUtil, EBusVar, DelAddr, ComnUnit, BtrvU2, MiscU,
  BTSupU2, IntStatH, EntLkup;

const
  DEF_CLIENT_HEIGHT = 356;
  DEF_CLIENT_WIDTH = 633;
  BASE_FORM_LETTER = 'D';

//-----------------------------------------------------------------------

function TEBusLinesList.SetCheckKey : Str255;
begin
  FillChar(Result,Sizeof(Result),0);
  with ID do
    Result := FullNomKey(FolioRef) + FullNomKey(LineNo);
end;

//-----------------------------------------------------------------------

function TEBusLinesList.OutLine(Col : byte) : str255;
begin
  with ID do
  begin
    Result := '';
    if KitLink = 0 then
      case Col of
        0: Result := StockCode;
        1: Result := ToFixedDP(Qty, CurCompSettings.QuantityDP);
        2: Result := Desc;
        3: Result := ToFixedDP(GetLineTotal(Id, true, {Inv.DiscTaken} Inv.DiscSetl), 2);
        4: if VATCode <> #0 then
             Result := VATCode;
        5: Result := ToFixedDP(NetValue, CurCompSettings.PriceDP);
        6: if DiscountChr = '%' then
             Result := FloatToStrF(Ex_RoundUp((Discount * 100), 2), ffFixed, 18, 2) + '%'
           else
             Result := ToFixedDP(Discount, 2);
      end // case
    else // It's an additional description line
      if Col = 2 then
        Result := Desc;
  end;
end;

//=======================================================================

procedure TfrmOneTransaction.SetBoolean(const Index: Integer; const Value: boolean);
begin
  case Index of
    1: fHeaderChanged := Value;  // i.e. the transaction header has changed
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.SetEditMode(Value: TFormActivate);
begin
  // Only coded to allow for actEdit and actShow, so raise exception otherwise
  if not (Value in [actEdit, actShow]) then
    raise Exception.Create('EditMode must be actEdit or actShow');
  fEditMode := Value;
  pnlViewStatus.Visible := fEditMode = actShow;
  // Later maybe process these buttons so that they disappear when in view mode
  btnAdd.Enabled := fEditMode <> actShow;
  btnInsert.Enabled := fEditMode <> actShow;
  btnDelete.Enabled := fEditMode <> actShow;
  with TShuffleButtons.Create(sbxButtons) do
  try
    ShuffleButtons;
  finally
    Free;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.CalcHeaderTotals;
var
  KeyS : str255;
  Status : integer;
  ExLocal : ^TExLocalEBus;
  v : VATType;
begin
  // Initialise totals
  for v := Low(VATType) to High(VATType) do
  begin
    fVATRateUsed[v] := false;
    fVATGoods[v] := 0.0;
  end;

  new(ExLocal, Create(CLIENT_ID_LOCAL));
  with ExLocal^ do
  begin
    ShowErrors := true;
    OpenOneFile(IDetailF, CurCompSettings.CompanyPath, EBUS_DETAILNAME);
    KeyS := FullRunNoKey(fExLocalTransHead^.LInv.FolioNum, 1);
    Status := ExLocal^.LFind_Rec(B_GetGEq, IDetailF, 0, KeyS);
    while (Status = 0) and (LId.FolioRef = fExLocalTransHead^.LInv.FolioNum) do
    begin
      v := VATCodeToVATType(LId.VATCode);
      fVATRateUsed[v] := true;
      // Quantity multipliers ???
      fVATGoods[v] := fVATGoods[v] + (GetLineTotal(Lid, true {Inv.DiscTaken},
        fExLocalTransHead^.LInv.DiscSetl));
      Status := ExLocal^.LFind_Rec(B_GetNext, IDetailF, 0, KeyS);
    end;
    CloseSelFiles([IDetailF]);
  end;
  dispose(ExLocal, destroy);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.WMCustGetRec(var Message : TMessage);
begin
  with Message do
    case WParam of
      0: // Double click
         ShowLineDetailsForm(EditMode);
      1: // Row with data gets focus
         // Message relaying to avoid problems with mouse up event
         begin
           PostMessage(Self.Handle, WM_FormCloseMsg,1000+WParam,0);
         end;
      2: // Right click
          mnuPopup.PopUp(LParamLo, lParamHi);
      200: // Add / update performed
          with FormStuff.aMUlCtrlO[0] do
            AddNewRow(MUListBoxes[0].Row,(LParam=1));
      300: // Delete performed
          RefreshList;
      EBUS_FORM_CLOSE:
        begin
          frmTransactionLine := nil;
          if LParam = FORM_TRANS_LINE_OK then
          begin
            RefreshList;
            RecalculateHeaderFromLines;
            UpdateDisplay;
            MustBeSaved;
          end;
        end;
    end; // case
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.UpdateDisplay;
begin
  CalcHeaderTotals;
  RefreshTransHeader;
  RefreshVATAnalysis;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.RefreshList;
// Notes : Call to redisplay the items in the list e.g. after removal etc.
begin
 // Only works for single line adding
 // TRUE = ADD - new row added
 // FALSE = EDIT - row already there but info changed
 // FormStuff.aMULCtrlO[0].AddNewRow(FormStuff.aMULCtrlO[0].MUListBoxes[0].Row,FALSE);

 with FormStuff.aMulCtrlO[0] do
  if (MUListBox1.Row = 0) or (not ValidLine) then
    InitPage
  else
    PageUpDn(0, true)
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.RefreshDetails;
begin
  if EditMode = actShow then
  begin
    CloseTransaction;
    ReadTransaction;
    with FormStuff do
    begin
      aKeyStart[0] := FullNomKey(Inv.FolioNum);
      aMULCtrlO[0].StartList(aFileNos[0], aiKeys[0], aKeyStart[0], aKeyEnd[0],
          '', aKeyLength[0], FALSE);
    end;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.ShowLineDetailsForm(Mode : TFormActivate);
var
  ShowForm : boolean;
begin
  ShowForm := Mode = actAdd;
  if (Mode in [actEdit, actInsert, actShow]) and (FormStuff.aMulCtrlO[0].ValidLine) then
  begin
    with FormStuff.aMULCtrlO[0] do
      RefreshLine(MUListBoxes[0].Row, false);
    ShowForm := not Assigned(frmTransactionLine);
  end;

  if ShowForm then
  begin
    frmTransactionLine := TfrmTransactionLine.Create(self);
    frmTransactionLine.HeaderRec := @fExLocalTransHead^.LInv;
    frmTransactionLine.InitialiseForm(Mode);
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.pgcOneTransactionChange(Sender: TObject);
begin
  pnlHeader.Visible := not (pgcOneTransaction.ActivePage = tabFooter);
  pnlButtons.Visible := not (pgcOneTransaction.ActivePage = tabFooter);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with FormStuff do
    StoreFormProperties(Self, FormStuff, bStoreCoord, bSetDefaults, bLastCoord, BASE_FORM_LETTER);
  FormStuff.Free;
  CloseTransaction;
  // Maybe need to tell the main daybook whether it needs to refresh
  // i.e. header details have, currently doing a list refresh
  SendMessage((Owner as TForm).Handle, WM_CustGetRec, EBUS_FORM_CLOSE, FORM_TRANS);
  Action := caFree;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.mniSaveOnExitClick(Sender: TObject);
begin
  FormStuff.bStoreCoord := not FormStuff.bStoreCoord;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.mniPropertiesClick(Sender: TObject);
begin
  with FormStuff do
    ListProperties(Self, aMULCtrlO[0], bSetDefaults, 'EBusiness Daybook Properties');
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.WMSysCommand(var Message : TMessage);
// Notes : Prevent the form from maximising when the maximise title bar
//         button is clicked.  Standard Enterprise behaviour for an MDI child.
begin
  with Message do
    case WParam of
      SC_Maximize :
        begin
          Self.ClientHeight := DEF_CLIENT_HEIGHT;
          Self.ClientWidth := DEF_CLIENT_WIDTH;
          WParam := 0;
        end;
    end; // case
  inherited;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.WMGetMinMaxInfo(var Message : TWMGetMinMaxInfo);
begin
  with Message.MinMaxInfo^ do
  begin
    ptMinTrackSize.X := DEF_CLIENT_WIDTH + 8;
    ptMinTrackSize.Y := DEF_CLIENT_HEIGHT + 27;
  end;
  Message.Result := 0;
  Inherited;
end; // TfrmCompanies.WMGetMinMaxInfo

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.HeadersMouseDownExecute(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  {depresses the column header}
  if (Sender is TSBSPanel) and (not TSBSPanel(Sender).ReadytoDrag) and (Button = MBLeft)
  then FormStuff.aMULCtrlO[0].VisiList.PrimeMove(Sender); {begin column drag/drop}
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.HeadersMouseMoveExecute(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  {visually moves column header to show the change about to be made (drag/drop}
  if (Sender is TSBSPanel) then FormStuff.aMULCtrlO[0].VisiList.MoveLabel(X,Y);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.MoveAlignColsExecute(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TSBSPanel) then DoMoveAlignCols(TSBSPanel(Sender), FormStuff, 0);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.FormCreate(Sender: TObject);
var
  Status : integer;
begin
  fExLocalTransHead := nil;
  // Create(2) when Notes processing functionality available
  FormStuff := TFormStuff.Create(1);

  ClientHeight := DEF_CLIENT_HEIGHT;
  ClientWidth := DEF_CLIENT_WIDTH;

  with FormStuff do
  begin
    bFillList := true;
    SetLength(aColumns[0], 7);
    // Stock code
    aColumns[0,0].ColPanel := pnlStk;
    aColumns[0,0].HeadPanel := pnlStkHead;
    // Quantity
    aColumns[0,1].ColPanel := pnlQty;
    aColumns[0,1].HeadPanel := pnlQtyHead;
    aColumns[0,1].Alignment := taRightJustify;
    aColumns[0,1].DecPlaces := CurCompSettings.QuantityDP;
    // Description
    aColumns[0,2].ColPanel := pnlDesc;
    aColumns[0,2].HeadPanel := pnlDescHead;
    // Line Total
    aColumns[0,3].ColPanel := pnlLT;
    aColumns[0,3].HeadPanel := pnlLTHead;
    aColumns[0,3].Alignment := taRightJustify;
    aColumns[0,3].DecPlaces := 2;
    // VAT code
    aColumns[0,4].ColPanel := pnlVAT;
    aColumns[0,4].HeadPanel := pnlVATHead;
    // Unit price
    aColumns[0,5].ColPanel := pnlUPrc;
    aColumns[0,5].HeadPanel := pnlUPrcHead;
    aColumns[0,5].Alignment := taRightJustify;
    aColumns[0,5].DecPlaces := CurCompSettings.PriceDP;
    // Discount
    aColumns[0,6].ColPanel := pnlDisc;
    aColumns[0,6].HeadPanel := pnlDiscHead;

    aFileNos[0] := IDetailF;
    asbMain[0] := sbxMain;
    apanTitle[0] := pnlColumnHeaders;
    asbButtons[0] := sbxButtons;
    apanButtons[0] := pnlButtons;
    aMULCtrlO[0] := TEBusLinesList.Create(Self);
    apanScrollBar[0] := pnlListControls;
    aiKeys[0] := 0;
    aKeyStart[0] := FullNomKey(Inv.FolioNum);

    sbxMain.HorzScrollBar.Position := 0;
    sbxMain.VertScrollBar.Position := 0;
    ReadFormProperties(Self, FormStuff, BASE_FORM_LETTER);
    DoFormResize(Self, FormStuff);

    InitialFormSetup;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.InitialFormSetup;
// Notes : Set-up of form dependant on company set-up
begin
  pgcOneTransaction.ActivePage := tabMain;
  // Notes processing functionality not currently available
  tabNotes.TabVisible := false;

  // Whether to show cost centres, departments and locations at bottom of form
  edtCCCode.Visible := CurCompSettings.CCDepEnabled;
  lblCC.Visible := CurCompSettings.CCDepEnabled;
  edtDepCode.Visible := CurCompSettings.CCDepEnabled;
  lblDept.Visible := CurCompSettings.CCDepEnabled;
  edtLocCode.Visible := CurCompSettings.MultiLocEnabled;
  lblLocation.Visible := CurCompSettings.MultiLocEnabled;

  // Whether to show controls on the footer page
  btnIntrastat.Visible := CurCompSettings.IntraStatEnabled;

  // Only needs to be done when form created
  AssignCurrencyItems(cbxCurrency.Items, false);
  AssignCurrencyItems(cbxCurrency.ItemsL, true);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.FormResize(Sender: TObject);
begin
  DoFormResize(Self, FormStuff);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.btnCloseClick(Sender: TObject);
begin
  if HeaderChanged then
  begin
    case MessageDlg(Format('Save changes to %s - %s',
      [GetEBusDocName(copy(fExLocalTransHead^.LInv.OurRef, 1, 3)),
      fExLocalTransHead^.LInv.OurRef]), mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes :
        begin
          SaveHeader;
          Close;
        end;
      mrNo :
        Close;
      // Pressing cancel in Enterprise ensures that the user is not queried
      // abbout saving changes on clicking 'Close', unless more changes are made
      mrCancel :
        HeaderChanged := false;
    end; // case
  end
  else // No edits to the header
    Close;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.FormKeyPress(Sender: TObject; var Key: Char);
begin
  GlobFormKeyPress(Sender, Key, ActiveControl, Handle);
end;

//-----------------------------------------------------------------------

 procedure TfrmOneTransaction.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  GlobFormKeyDown(Sender, Key, Shift, ActiveControl, Handle);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.WMFormCloseMsg(var Message: TMessage);
begin
  // Avoids problem with coordination between parent and child form refresh
  with Message do
    case WParam of
      1001 : TransactionLineUpdated;  
    end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.TransactionLineUpdated;
// Notes : Called when the user moves between lines in the transaction lines Btrieve list
begin
  with ID do
  begin
    edtCCCode.Text := CCDep[true];   // CC
    edtDepCode.Text := CCDep[false]; // Dept
    edtLocCode.Text := MLocStk;
    edtGLCodeDesc.Text := GetNomDescription(NomCode);
  end;
end; // TfrmOneTransaction.TransactionLineUpdated

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.RefreshTransHeader;
var
  TraderDetails : TBatchCURec;
  i : integer;
  CaptionStr : string;
  CurrDiscTaken : boolean;
begin
  with fExLocalTransHead^, LInv do
  begin
    // Form caption
    Caption := Format('E-Business %s Record - %s',[GetEBusDocName(copy(OurRef, 1, 3)), OurRef]);

    // Top of form
    memAddress.Clear;
    if GetTraderDetailsFromCode(CustCode, TraderDetails) = 0 then
    begin
      memAddress.Text := Trim(TraderDetails.Company);
      for i := 1 to 5 do
        if Trim(TraderDetails.Addr[i]) <> '' then
          memAddress.Text := memAddress.Text + CRLF + TraderDetails.Addr[i];
    end;
    edtACCode.Text := CustCode;
    edtTransDate.DateValue := TransDate;
    edtDueDate.DateValue := DueDate;
    edtPeriod.EPeriod := AcPr;
    edtPeriod.EYear := AcYr;
    edtYourRef.Text := YourRef;
    edtAltRef.Text := TransDesc;
    edtOurRef.Text := OurRef;
    // Item index 0 = currency 1
    cbxCurrency.ItemIndex := Currency -1;
    edtExchRate.Value := CXRate[true];
    chkFixedRate.Checked := SOPKeepRate;

    // Bottom of form
    lblCurrency.Caption := GetCurrencySymbol(Currency);
    edtNetTotal.Value := ITotal(LInv) - InvVat;
    edtVATContent.Value := InvVAT;
    edtGrossTotal.Value := ITotal(LInv);

    // Footer tab
    chkVATAmended.Checked := ManVAT;
    if CtrlNom <> 0 then
      edtControlNom.Text := IntToStr(CtrlNom);

    edtLineType1.Value := DocLSplit[1];
    edtLineType2.Value := DocLSplit[2];
    edtLineType3.Value := DocLSplit[3];
    edtLineType4.Value := DocLSplit[4];

    edtSettleDiscPercent.Value := DiscSetl;
    edtSettleDiscDays.Value := DiscDays;
    chkSettleDiscTaken.Checked := DiscTaken;
    edtNoSettleNet.Value := InvNetVal;
    edtSettleNet.Value := InvNetVal;
    edtNoSettleVAT.Value := InvVAT;
    edtSettleVAT.Value := InvVAT;
    edtNoSettleDisc.Value := DiscAmount;
    edtSettleDisc.Value := DiscAmount + DiscSetAm;
    CurrDiscTaken := DiscTaken;
    DiscTaken := false;
    edtNoSettleTotal.Value := ITotal(LInv);
    DiscTaken := true;
    edtSettleTotal.Value := ITotal(LInv);
    DiscTaken := CurrDiscTaken;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.RefreshVATAnalysis;
// Notes : Updates the VAT analysis display from the VAT analysis data structure
const
  DESC_FIELD = 'edtVATDesc';
  GOODS_AMOUNT_FIELD = 'edtVATGoods';
  VAT_AMOUNT_FIELD = 'edtVATAmnt';
  MAX_VAT_ROWS = 10; // Maximum rows of VAT analysis that can be displayed in scroll box
var
  CorrectControlRow : boolean;
  i, Row : integer;
  v : VATType;
  ControlName : string;
  TextEdit : Text8Pt;
  CurrEdit : TCurrencyEdit;
begin
{  VATType  =  (Standard,Exempt,Zero,Rate1,Rate2,Rate3,Rate4,Rate5,Rate6,
                Rate7,Rate8,Rate9,Rate10,Rate11,Rate12,Rate13,Rate14,Rate15,Rate16,
                Rate17,Rate18,IAdj,OAdj,Spare8); }

  Row := 0;
  for v := VStart to VEnd do
    if fVATRateUsed[v] then
    begin
      if Row < MAX_VAT_ROWS then
      begin
        inc(Row);

        for i := 0 to sbxVATAnalysis.ControlCount -1 do
        begin // Loop through all components on VAT scroll box
          ControlName := sbxVATAnalysis.Controls[i].Name;

          try
            // StrToInt raises an exception if ExtractTrailingInteger returns an empty string
            CorrectControlRow := (StrToInt(ExtractTrailingInteger(ControlName)) = Row);
          except
            CorrectControlRow := false;
          end;

          if CorrectControlRow then
          begin
            if CompareText(ExtractLeadingString(ControlName), DESC_FIELD) = 0 then
            begin
              TextEdit := sbxVATAnalysis.Controls[i] as Text8Pt;
              TextEdit.Text := GetVATDescription(VATTypeToVATCode(v));
              TextEdit.Visible := true;
            end;
            if CompareText(ExtractLeadingString(ControlName), GOODS_AMOUNT_FIELD) = 0 then
            begin
              CurrEdit := sbxVATAnalysis.Controls[i] as TCurrencyEdit;
              CurrEdit.Value := fVATGoods[v];
              CurrEdit.Visible := true;
            end;
            if CompareText(ExtractLeadingString(ControlName), VAT_AMOUNT_FIELD) = 0 then
            begin
              CurrEdit := sbxVATAnalysis.Controls[i] as TCurrencyEdit;
              CurrEdit.Value := fExLocalTransHead^.LInv.InvVatAnal[v];
              CurrEdit.Visible := true;
            end;
          end; // On correct control row
        end;
      end;
    end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.btnDeliveryClick(Sender: TObject);

  procedure UpdateDelLine(var DelLine : str30; const NewLine : string);
  begin
    if DelLine <> NewLine then
    begin
      DelLine := NewLine;
      HeaderChanged := true;
    end;
  end;

begin
  with TfrmDelAddress.Create(self) do
  try
    // Assign font and colour from control on header of transaction screen
    SetFormProperties(memAddress.Font, memAddress.Color);
    if EditMode = actEdit then
      EnableEditing;
    SetAddressDetails(fExLocalTransHead^.LInv.DAddr);
    if ShowModal = mrOK then
    begin
      UpdateDelLine(fExLocalTransHead^.LInv.DAddr[1], edtDelivery1.Text);
      UpdateDelLine(fExLocalTransHead^.LInv.DAddr[2], edtDelivery2.Text);
      UpdateDelLine(fExLocalTransHead^.LInv.DAddr[3], edtDelivery3.Text);
      UpdateDelLine(fExLocalTransHead^.LInv.DAddr[4], edtDelivery4.Text);
      UpdateDelLine(fExLocalTransHead^.LInv.DAddr[5], edtDelivery5.Text);
    end;
  finally
    Free;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.actAddLineExecute(Sender: TObject);
begin
  ShowLineDetailsForm(actAdd);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.actEditLineExecute(Sender: TObject);
begin
  ShowLineDetailsForm(EditMode);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.btnInsertClick(Sender: TObject);
begin
  ShowLineDetailsForm(actInsert);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.actDeleteLineExecute(Sender: TObject);
begin
  with FormStuff.aMulCtrlO[0] do
  begin
    if ConfirmRecordDelete('this Line') then
    begin
      GetSelRec(false);
      Delete_Rec(F[IDetailF], IDetailF, 0);
      RefreshList;
      RecalculateHeaderFromLines;
      dec(fExLocalTransHead^.LInv.ILineCount);
      UpdateDisplay;
      MustBeSaved;
    end;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.MustBeSaved;
// Notes : Transaction must be saved as the lines have been edited
begin
  btnClose.Enabled := false;
  btnCancel.Enabled := false;
  btnCloseFooter.Enabled := false;
  btnCancelFooter.Enabled := false;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.btnOKClick(Sender: TObject);
begin
  SaveHeader;
  Close;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.CloseTransaction;
begin
  with fExLocalTransHead^ do
  begin
    if EditMode = actEdit then
      UnLockMLock(InvF, 0);
    CloseSelFiles([InvF]);
  end;
  dispose(fExLocalTransHead, destroy);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.ReadTransaction;
var
  KeyS : str255;
  LockType : integer;
  Locked,
  ReadOK : boolean;
begin
  new(fExLocalTransHead, Create(CLIENT_ID_HEADER));
  with fExLocalTransHead^ do
  begin
    OpenOneFile(InvF, CurCompSettings.CompanyPath, EBUS_DOCNAME);
    KeyS := Inv.OurRef;
    UsePrompt := true;

    if EditMode = actEdit then
    begin
      ReadOK := LGetMultiRec(B_GetEq, B_MultLock, KeyS, 2, InvF, false, Locked);
      if ReadOK then
        if Locked then
          EnableEditing
        else
          EditMode := actShow;
    end
    else
      ReadOK := LFind_Rec(B_GetEq, InvF, 2, KeyS) = 0;

    if ReadOK then
    begin
      UpdateDisplay;
      CheckTraderDependencies;
    end
    else ; // Couldn't read transaction - raise exception ?
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.SaveHeader;
var
  Status : integer;
begin
  with fExLocalTransHead^ do
  begin
    Status := LPut_Rec(InvF, 2);
    if Status <> 0 then
      Report_BError(InvF, Status);
  end;
end;

//-----------------------------------------------------------------------

(*
procedure TfrmOneTransaction.SaveHeader;
begin
  with fExLocalTransHead^, LInv do
  begin
//    CustCode := edtACCode.Text;
//    TransDate := edtTransDate.DateValue;
//    DueDate := edtDueDate.DateValue;
//    AcPr := edtPeriod.EPeriod;
//    AcYr := edtPeriod.EYear;
//    YourRef := edtYourRef.Text;
//    TransDesc := edtAltRef.Text;
    OurRef := edtOurRef.Text;
    // Item index 0 = currency 1
//    Currency := cbxCurrency.ItemIndex +1;

    InvVAT := edtVATContent.Value;
    DocLSplit[1] := edtLineType1.Value;
    DocLSplit[2] := edtLineType2.Value;
    DocLSplit[3] := edtLineType3.Value;
    DocLSplit[4] := edtLineType4.Value;

    DiscSetl := edtSettleDiscPercent.Value;
    DiscDays := trunc(edtSettleDiscDays.Value);
    DiscTaken := chkSettleDiscTaken.Checked;
    InvNetVal := edtNoSettleNet.Value;
    DiscAmount := edtNoSettleDisc.Value;
    edtSettleDisc.Value := DiscAmount + DiscSetAm;
  end;
end; *)

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.RecalculateHeaderFromLines;
var
  ExLocal : ^TExLocalEBus;
  CurrentLineCount : integer;
begin
  new(ExLocal, Create(CLIENT_ID_LOCAL));
  ExLocal^.ShowErrors := true;
  ExLocal^.OpenOneFile(IDetailF, CurCompSettings.CompanyPath, EBUS_DETAILNAME);
  CurrentLineCount := fExLocalTransHead^.LInv.ILineCount;
  LCalcInvTotals(fExLocalTransHead^.LInv, ExLocal, true, true);
  // Reset the line count which has been changed by call to LCalcInvTotals
  fExLocalTransHead^.LInv.ILineCount := CurrentLineCount;
  ExLocal^.CloseSelFiles([IDetailF]);
  dispose(ExLocal, destroy);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.EnableEditing;
begin
  // Data Entry tab
  edtACCode.ReadOnly := false;
  edtTransDate.ReadOnly := false;
  edtDueDate.ReadOnly := false;
  edtPeriod.ReadOnly := false;
  edtYourRef.ReadOnly := false;
  edtAltRef.ReadOnly := false;
  cbxCurrency.ReadOnly := false;
  ExchangeRateEnabled;
  chkFixedRate.Enabled := true;

  // Footer tab
  EnableVATEditing;
  chkVATAmended.Enabled := true;
  edtSettleDiscPercent.ReadOnly := false;
  edtSettleDiscDays.ReadOnly := false;
  chkSettleDiscTaken.Enabled := true;
end;

//-----------------------------------------------------------------------

function TfrmOneTransaction.CancellingEdits : boolean;
begin
  Result := (ActiveControl = btnCancel) or (ActiveControl = btnCancelFooter);
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtACCodeExit(Sender: TObject);
var
  ACCode : string20;
  TraderType : TTraderType;
begin
  if not CancellingEdits and (EditMode <> actShow) then
  begin
    if IsPurchaseTransaction(fExLocalTransHead^.LInv.OurRef) then
      TraderType := trdSupplier
    else
      TraderType := trdCustomer;

    edtACCode.Text := Trim(edtACCode.Text);
    ACCode := edtACCode.Text;
    if DoGetCust(self, CurCompSettings.CompanyPath, ACCode, ACCode, TraderType,
                   vmShowList, true) then
    begin
      if fExLocalTransHead^.LInv.CustCode <> ACCode then
      begin
        fExLocalTransHead^.LInv.CustCode := ACCode;
        HeaderChanged := true;
        edtACCode.Text := ACCode;
      end;
    end;
  end;
  CheckTraderDependencies;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.cbxCurrencyExit(Sender: TObject);
var
  CurrNum : integer;
  CurrRec : TBatchCurrRec;
begin
  if not CancellingEdits and (EditMode <> actShow) then
  begin
    CurrNum := cbxCurrency.ItemIndex +1;
    if fExLocalTransHead^.LInv.Currency <> CurrNum then
    begin
      fExLocalTransHead^.LInv.Currency := CurrNum;
      fHeaderChanged := true;

      lblCurrency.Caption := GetCurrencySymbol(CurrNum);
      FillChar(CurrRec, SizeOf(CurrRec), 0);

      if Ex_GetCurrency(@CurrRec, Sizeof(CurrRec), CurrNum) = 0 then
      begin
        if CurCompSettings.DailyRate then
          edtExchRate.Value := CurrRec.DailyRate
        else
          edtExchRate.Value := CurrRec.CompanyRate;

        fExLocalTransHead^.LInv.CXRate[true] := edtExchRate.Value;
        fExLocalTransHead^.LInv.CXRate[false] := edtExchRate.Value;

        ExchangeRateEnabled;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtTransDateExit(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    (fExLocalTransHead^.LInv.TransDate <> edtTransDate.DateValue) then
  begin
    fExLocalTransHead^.LInv.TransDate := edtTransDate.DateValue;
    HeaderChanged := true;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtDueDateExit(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    (fExLocalTransHead^.LInv.DueDate <> edtDueDate.DateValue) then
  begin
    fExLocalTransHead^.LInv.DueDate := edtDueDate.DateValue;
    HeaderChanged := true;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtPeriodExit(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    (fExLocalTransHead^.LInv.AcPr <> edtPeriod.EPeriod) then
  begin
    fExLocalTransHead^.LInv.AcPr := edtPeriod.EPeriod;
    HeaderChanged := true;
  end;
  if fExLocalTransHead^.LInv.AcYr <> edtPeriod.EYear then
  begin
    fExLocalTransHead^.LInv.AcYr := edtPeriod.EYear;
    HeaderChanged := true;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtYourRefExit(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    (fExLocalTransHead^.LInv.YourRef <> edtYourRef.Text) then
  begin
    fExLocalTransHead^.LInv.YourRef := edtYourRef.Text;
    HeaderChanged := true;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtAltRefExit(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    (fExLocalTransHead^.LInv.TransDesc <> edtAltRef.Text) then
  begin
    fExLocalTransHead^.LInv.TransDesc := edtAltRef.Text;
    HeaderChanged := true;
  end;
end;

//-----------------------------------------------------------------------

procedure TfrmOneTransaction.edtExchRateExit(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    not ZeroFloat(abs(fExLocalTransHead^.LInv.CXRate[true] - edtExchRate.Value)) then
  begin
    fExLocalTransHead^.LInv.CXRate[true] := edtExchRate.Value;
    fExLocalTransHead^.LInv.CXRate[false] := edtExchRate.Value;
    HeaderChanged := true;
  end;
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.chkFixedRateClick(Sender: TObject);
begin
  if not CancellingEdits and (EditMode <> actShow) and
    fExLocalTransHead^.LInv.SOPKeepRate <> chkFixedRate.Checked then
  begin
    fExLocalTransHead^.LInv.SOPKeepRate := chkFixedRate.Checked;
    HeaderChanged := true;
  end;
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.ExchangeRateEnabled;
// Notes : Enables the exchange rate field, if possible
//         i.e. currency is NOT triangulated, nor company rate in use
var
  NotEditable : boolean;
  CurrRec : TBatchCurrRec;
begin
  NotEditable := not CurCompSettings.DailyRate;
  FillChar(CurrRec, SizeOf(CurrRec), 0);
  if Ex_GetCurrency(@CurrRec, Sizeof(CurrRec), fExLocalTransHead^.LInv.Currency) = 0 then
    NotEditable := NotEditable or (CurrRec.TriEuro <> 0);
  edtExchRate.ReadOnly := NotEditable;
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.btnIntraStatClick(Sender: TObject);
begin
  with TfrmIntraStatHeader.Create(self) do
  try
    // Assign font and colour from control on header of transaction screen
    SetFormProperties(memAddress.Font, memAddress.Color);
    if EditMode = actEdit then
      EnableEditing;

    with fExLocalTransHead^.LInv do
    begin
      DeliveryTerms := DelTerms;
      TransactionType := SSDProcess;
      TransactionNature := TransNat;
      TransportMode := TransMode;

      SettingsUpdated := false;

      if ShowModal = mrOK then
      begin
        DelTerms := DeliveryTerms;
        SSDProcess := TransactionType;
        TransNat := TransactionNature;
        TransMode := TransportMode;
        HeaderChanged := true;
      end;
    end;
  finally
    Free;
  end;
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.edtControlNomExit(Sender: TObject);
var
  Validate : boolean;
  ControlNom : longint;
begin
  // Blank should be allowed - don't force the user to have a control nominal
  if Trim(edtControlNom.Text) = '' then
    exit;

  Validate := not CancellingEdits and (EditMode <> actShow);
  try
    ControlNom := StrToInt(Trim(edtControlNom.Text));
  except
    ControlNom := 0;
    Validate := true;
  end;
  Validate := Validate and ((ControlNom <> fExLocalTransHead^.LInv.CtrlNom) and
    (fExLocalTransHead^.LInv.CtrlNom = 0));

  if Validate then
  begin
    if DoGetNom(self, CurCompSettings.CompanyPath, edtControlNom.Text, ControlNom,
                 [nomControl], vmShowList, true) then
(* if DoGetNom(self, CurCompSettings.CompanyPath, edtControlNom.Text, ControlNom,
      [nomControl], true) then *)
    begin
      if fExLocalTransHead^.LInv.CtrlNom <> ControlNom then
      begin
        fExLocalTransHead^.LInv.CtrlNom := ControlNom;
        HeaderChanged := true;
      end;
    end
    else
      edtControlNom.SetFocus;
    // User may have selected the same nominal code via its description, so always
    // need to update the display
    edtControlNom.Text := IntToStr(ControlNom);
  end;
end;

//----------------------------------------------------------------------

function TfrmOneTransaction.TraderControlNomSet(const TraderCode : string) : boolean;
var
  TraderRec : TBatchCURec;
  SearchCode : array[0..255] of char;
begin
  Result := false;
  FillChar(TraderRec, SizeOf(TraderRec), 0);
  StrPCopy(SearchCode, TraderCode);
  if Ex_GetAccount(@TraderRec, SizeOf(TraderRec), SearchCode, 0, B_GetEq, 0, false) = 0 then
    Result := TraderRec.DefCtrlNom <> 0;
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.CheckTraderDependencies;
begin
  btnIntraStat.Visible := IntraStatAvailable(fExLocalTransHead^.LInv.CustCode);
  edtControlNom.ReadOnly := (EditMode = actShow) or not 
    TraderControlNomSet(fExLocalTransHead^.LInv.CustCode);
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.EnableVATEditing;
var
  i : integer;
begin
  // Loop through all components on VAT scroll box
  for i := 0 to sbxVATAnalysis.ControlCount -1 do
    if sbxVATAnalysis.Controls[i] is TCurrencyEdit then
      (sbxVATAnalysis.Controls[i] as TCurrencyEdit).ReadOnly := false;
end;

//----------------------------------------------------------------------

procedure TfrmOneTransaction.actCancelExecute(Sender: TObject);
begin
  Close;
end;

end.

