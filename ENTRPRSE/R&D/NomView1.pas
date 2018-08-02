unit NomView1;

{$I DEFOVR.Inc}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, Math, StdCtrls, {OutLine,} SBSOutl, TEditVal,
  GlobVar,VarConst,ETStrU,BtrvU2,BTSupU1, BTKeys1U,ExtCtrls, Buttons,
  BorBtns, Menus,
  ImgModU,
  ExWrap1U,
  HistWinU,
  ReconU,
  NomVRecU,
  NomVCtlU,
  NmlCCDU,
  SBSPanel, ToolWin, Mask, AccelLbl, AdvGlowButton, AdvToolBar,
  AdvToolBarStylers;


type



  TNViews = class(TForm)
    PopupMenu1: TPopupMenu;
    MIFind: TMenuItem;
    N2: TMenuItem;
    PropFlg: TMenuItem;
    N1: TMenuItem;
    StoreCoordFlg: TMenuItem;
    N3: TMenuItem;
    MIHist: TMenuItem;
    Expand1: TMenuItem;
    MIETL: TMenuItem;
    MIEAL: TMenuItem;
    MIColl: TMenuItem;
    MICTL: TMenuItem;
    EntireGeneralLedger1: TMenuItem;
    EntireGeneralLedger2: TMenuItem;
    SBSPanel1: TSBSPanel;
    NCurrLab: Label8;
    Panel4: TSBSPanel;
    TxLateChk: TBorCheck;
    Currency: TSBSComboBox;
    Bevel6: TBevel;
    Graph1: TMenuItem;
    OptBtn: TButton;
    Record1: TMenuItem;
    Edit1: TMenuItem;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    ShowC1: TMenuItem;
    ObjectClone1: TMenuItem;
    Add2: TMenuItem;
    Move1: TMenuItem;
    CanlMove1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Move2: TMenuItem;
    Show1: TMenuItem;
    ShowG1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Check1: TMenuItem;
    ObjectClone2: TMenuItem;
    DeleteAll1: TMenuItem;
    ViewF: TCurrencyEdit;
    Copy1: TMenuItem;
    ViewCtrl1: TMenuItem;
    Add3: TMenuItem;
    Edit2: TMenuItem;
    Delete2: TMenuItem;
    SBSPanel2: TSBSPanel;
    I1TransDateF: TEditDate;
    Label85: Label8;
    I2PrYrF: TEditPeriod;
    NCCF: Text8Pt;
    Label87: Label8;
    CheckThis1: TMenuItem;
    CheckAll1: TMenuItem;
    Copy2: TMenuItem;
    ViewCB1: TSBSComboBox;
    N8: TMenuItem;
    N9: TMenuItem;
    Label84: Label8;
    NOpoF: Text8Pt;
    NIICF: TBorCheck;
    Label86: Label8;
    N10: TMenuItem;
    AdvStyler: TAdvToolBarOfficeStyler;
    AdvDockPanel: TAdvDockPanel;
    AdvToolBar: TAdvToolBar;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    FullExBtn: TAdvGlowButton;
    FullColBtn: TAdvGlowButton;
    GraphBtn: TAdvGlowButton;
    HistBtn: TAdvGlowButton;
    ReconBtn: TAdvGlowButton;
    NomSplitBtn: TAdvGlowButton;
    Panel1: TPanel;
    YTDChk: TBorCheck;
    Panel2: TPanel;
    ClsI1Btn: TButton;
    Panel3: TPanel;
    Label82: Label8;
    Label81: Label8;
    Period: TSBSComboBox;
    ToPeriod: TSBSComboBox;
    Panel6: TPanel;
    Label83: Label8;
    Year: TSBSComboBox;
    ScrollBox1: TScrollBox;
    NLDPanel: TSBSPanel;
    lblTBDiff: Label8;
    NLCrPanel: TSBSPanel;
    NLDrPanel: TSBSPanel;
    NLOLine: TSBSOutlineB;
    NLBudgetPanel: TSBSPanel;
    NLRevisedPanel: TSBSPanel;
    NLVariancePanel: TSBSPanel;
    lblViewCode: Label8;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure NLOLineExpand(Sender: TObject; Index: Longint);
    procedure NLOLineNeedValue(Sender: TObject);
    procedure CurrencyClick(Sender: TObject);
    procedure FullExBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ClsI1BtnClick(Sender: TObject);
    procedure NomSplitBtnClick(Sender: TObject);
    procedure NLOLineCollapse(Sender: TObject; Index: Longint);
    procedure NLOLineDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure YTDChkClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PropFlgClick(Sender: TObject);
    procedure StoreCoordFlgClick(Sender: TObject);
    procedure NLOLineMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TxLateChkClick(Sender: TObject);
    procedure HistBtnClick(Sender: TObject);
    procedure MIEALClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PeriodExit(Sender: TObject);
    procedure MIFindClick(Sender: TObject);
    procedure ReconBtnClick(Sender: TObject);
    procedure OptBtnClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure ShowC1Click(Sender: TObject);
    procedure Move1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Commit1Click(Sender: TObject);
    procedure NLOLineUpdateNode(Sender: TObject; var Node: TSBSOutLNode;
      Row: Integer);
    procedure CCDepView1Click(Sender: TObject);
    procedure ShowG1Click(Sender: TObject);
    procedure Check1Click(Sender: TObject);
    procedure ObjectClone2Click(Sender: TObject);
    procedure DeleteAll1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure ViewFExit(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure ViewCB1Change(Sender: TObject);
    procedure YearKeyPress(Sender: TObject; var Key: Char);

  private
    IAmChild,
    FiltCarryF,
    FiltNType,
    ShowGLCode,
    RefreshHist,
    RefreshRecon,
    RefreshCCDepView,
    InHCallBack,
    InHBeen,
    UseYTD,
    MoveMode,
    StoreCoord,
    fNeedCUpdate,
    FColorsChanged,
    LastCoord,
    SetDefault,
    PostLock,
    IncludeBudgetCols,
    GotCoord     :   Boolean;

    Lab1Ofset,
    Lab2Ofset,
    Lab3Ofset,
    Lab4Ofset{,
    ChrWidth  }   :   LongInt;

    MoveToItem,
    MoveItemParent,
    MoveItem     :   Integer;

    MoveInsMode  :   TSBSAttachMode;

    LastCursor   :   TCursor;

    StartSize,
    InitSize     :  TPoint;
    TBDiff{,
    ChrsXross}    :   Double;

    ColXAry      :   Array[1..5] of LongInt;

    ChildNom
                 :   TNViews;

    InChild      :   Boolean;

    HistForm     :   THistWin;

    CCDepView    :   TCCDepView;

    InCCDepView,
    InCCDepVLink,
    InHist       :   Boolean;


    ReconForm    :   TReconList;
    InRecon      :   Boolean;

    ExLocal      :   TdExLocal;

    NomActive    :  Boolean;

    NomRecForm   :  TNomVRec;

    ViewCtrlActive
                 :  Boolean;
    ViewRecForm  :  TNomVCtlRec;

    MasterVCtrl  :  ViewCtrlType;

    //fImageRepos  :  TImageRepos;

    { Private declarations }


    procedure Find_FormCoord;

    procedure Store_FormCoord(UpMode  :  Boolean);

    Procedure SuperDDCtrl(Mode  :  Byte);

    Function GetSelRec(Idx  :  Integer)  :  Boolean;

    Function  DeleteMyNOMLine(Fnum,
                              KeyPath  :  Integer)  :  Boolean;

    procedure Delete_Branch(DelLeaf,Level  :  LongInt);

    Procedure LinkList(NC  :  Str50);

    procedure Display_Account(Mode             :  Byte;
                              ChangeFocus      :  Boolean);

    Procedure AddEditLine(Edit  :  Boolean);

    Procedure Delete_OutLines(PIndex      :  LongInt;
                              DelSelf     :  Boolean);

    procedure Display_VCAccount(Mode             :  Byte;
                                ViewIdx          :  Integer;
                                ChangeFocus      :  Boolean);

    Procedure WMFormCloseMsg(Var Message  :  TMessage); Message WM_FormCloseMsg;

    Procedure WMCustGetRec(Var Message  :  TMessage); Message WM_CustGetRec;

    Procedure WMGetMinMaxInfo(Var Message  :  TWMGetMinMaxInfo); Message WM_GetMinMaxInfo;

    

    Function CreateDiffCaption  :  Str255;

    Function CreateCaption  :  Str255;

    Function FormatLine(ONomRec  :  OutNomType;
                        LineText :  String)  :  String;


    Procedure Add_TotOutLines(Depth,
                              DepthLimit,
                              NomCat,
                              OVABSIdx,
                              OIndex        :   LongInt;
                              ONType,
                              OVNLinkType   :   Char;
                              VCode         :   Str50;
                              LineText      :   String);

    Procedure Add_OutLines(Depth,
                           DepthLimit,
                           NomCat,
                           OIndex        :   LongInt;
                     Const Fnum,
                           Keypath       :   Integer);


    Procedure Update_OutLines(Const Fnum,
                                    Keypath       :   Integer);

    Procedure Drill_OutLines(Depth,
                             DepthLimit,
                             PIndex      :  LongInt);


    procedure NLChildForceReDraw;

    procedure NLChildUpdate;

    procedure Display_History(ONomCtrl     :  OutNomType;
                              ChangeFocus,
                              ShowGraph    :  Boolean);

    procedure Display_Recon(Opt          :  Byte;
                            ONomCtrl     :  OutNomType;
                            ChangeFocus  :  Boolean);

    procedure Display_CCDepView(ONomCtrl     :  OutNomType;
                                ChangeFocus  :  Boolean);

    Procedure Send_UpdateList(Mode   :  Integer);

    procedure SetFieldProperties;

    procedure SetFormProperties(SetList  :  Boolean);

    function FindNode(NCode  :  LongInt)  :  Integer;

    Procedure FindNomCode;

    Function Is_NodeParent(MIdx,SIdx  :  Integer)  :  Boolean;

    Function Place_InOrder(MIdx,SIdx  :  Integer;
                       Var UseAdd     :  Boolean)  :  Integer;

    Procedure DeleteAllNoms(Level  :  Integer);


    {$IFDEF POST}
      Function Confirm_Move(MIdx,SIdx  :  Integer)  :  Boolean;


      Procedure Alter_Total(Const PIdx1 :  Integer;
                            Const NC    :  LongInt;
                            Const HideValues
                                        :  Boolean);

      Procedure HideAll_Totals(Const HideValues  :  Boolean);

      Procedure Update_TotalMove(Const NC1,NC2     :  LongInt;
                                 Const CalcMode    :  Boolean);

      Function FindXONC(Const NC1  :  LongInt)  :  Integer;

      Procedure Update_Total4Thread(RecAddr  :  LongInt;
                                    CalcMode :  Boolean);

    {$ENDIF}

    procedure SetChildMove;

    Procedure  SetNeedCUpdate(B  :  Boolean);

    procedure Show_CCDepViewHistory(ShowGraph  :  Boolean;
                                    ViewMode   :  Byte);

    Function Being_Posted(Const LMode  :  Byte)  :  Boolean;

    Property NeedCUpDate :  Boolean Read fNeedCUpDate Write SetNeedCUpdate;

    procedure Update_ViewCtrl;

    procedure Change_View(NewIdx  :  LongInt);

  public
    { Public declarations }
    CCNomFilt    :   CCNomFiltType;

    CCNomMode    :   Boolean;

    CommitMode   :   Byte;


    GLViewIdx    :   LongInt;

    NTxCr,
    NCr,NPr,
    NPrTo,NYr    :   Byte;

    CopyFromGLNo :   LongInt;

    ParentNom,
    GrandPNom    :  TNViews;


    {$IFDEF POST} 
        procedure RefreshMove(WhichNode  :  Integer);
    {$ENDIF}

    Procedure PlaceNomCode(FindCode  :  Str50);

  end;

Var
  LastSelView  :  Integer;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Implementation

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}


Uses
  ETDateU,
  ETMiscU,
  CurrncyU,
  VarRec2U,
  
  {$IFDEF DBD}
    DebugU,
  {$ENDIF}

  CmpCtrlU,
  ColCtrlU,
  ComnU2,
  BtSupU2,
  SalTxl1U,
  InvListU,
  GenWarnU,

  {$IFDEF POST} 
    PostSp2U,
    
    BTSupU3,
  {$ENDIF}

  NmlCDIU,

  ExThrd2U,
  SysU1,
  PWarnU,

  //PR: 15/05/2017 ABSEXCH-18683 v2017 R1
  oProcessLock;

{$R *.DFM}

Const
  InitWidth  =  128; {118}
  TDpth      =  70;





Procedure  TNViews.SetNeedCUpdate(B  :  Boolean);

Begin
  If (Not fNeedCUpdate) then
    fNeedCUpdate:=B;
end;

procedure TNViews.Find_FormCoord;


Var
  ThisForm:  TForm;

  VisibleRect
          :  TRect;

  GlobComp:  TGlobCompRec;


Begin

  New(GlobComp,Create(BOn));

  ThisForm:=Self;

  With GlobComp^ do
  Begin

    GetValues:=BOn;

    PrimeKey:='V';

    If (GetbtControlCsm(ThisForm)) then
    Begin
      {StoreCoord:=(ColOrd=1); v4.40. To avoid on going corruption, this is reset each time its loaded}
      StoreCoord:=BOff;
      HasCoord:=(HLite=1);
      LastCoord:=HasCoord;

      If (HasCoord) then {* Go get postion, as would not have been set initianly *}
        SetPosition(ThisForm);

    end;

    If GetbtControlCsm(NLOLine) then
      NLOLine.BarColor:=ColOrd;

    If GetbtControlCsm(NLDPanel) then
      NLOLine.BarTextColor:=ColOrd;

    GetbtControlCsm(NLCrPanel);

    GetbtControlCsm(NLDrPanel);

    If GetbtControlCsm(Period) then
      SetFieldProperties;

  end; {With GlobComp..}


  Dispose(GlobComp,Destroy);

      {* Check form is within current visible range *}

  With TForm(Owner) do
    VisibleRect:=Rect(0,0,ClientWidth,ClientHeight);

  If (Not PtInRect(VisibleRect,Point(Left,Top))) then
  Begin
    Left:=0;
    Top:=0;
  end;

    {NeedCUpdate}
  StartSize.X:=Width; StartSize.Y:=Height;

end;


procedure TNViews.Store_FormCoord(UpMode  :  Boolean);


Var
  GlobComp:  TGlobCompRec;


Begin

  New(GlobComp,Create(BOff));

  With GlobComp^ do
  Begin
    GetValues:=UpMode;

    PrimeKey:='V';

    ColOrd:=Ord(StoreCoord);

    HLite:=Ord(LastCoord);

    SaveCoord:=StoreCoord;

    If (Not LastCoord) then {* Attempt to store last coord *}
      HLite:=ColOrd;

    StorebtControlCsm(Self);

    ColOrd:=NLOLine.BarColor;

    StorebtControlCsm(NLOLine);

    ColOrd:=NLOLine.BarTextColor;

    StorebtControlCsm(NLDPanel);

    StorebtControlCsm(NLDrPanel);

    StorebtControlCsm(NLCrPanel);

    StorebtControlCsm(Period);


  end; {With GlobComp..}

  Dispose(GlobComp,Destroy);
end;


Function TNViews.FormatLine(ONomRec  :  OutNomType;
                             LineText :  String)  :  String;

Begin
  With ONomRec,NomView^.NomViewLine do
  Begin
    Result:=Spc(1*OutDepth)+Strip('R',[#32],LineText);

    If (FiltNType) and (OutNomType<>NomHedCode) then
      Result:=Result+' ('+ViewType+')';

    If (ShowGLCode) then
      Result:=Result+' : '+ViewCode;

    Result:=Result+Spc(Round((Width-Canvas.TextWidth(Result))/Canvas.TextWidth(' '))-(TDpth*OutDepth));

    LineText:=LineText+Spc(Round((Width-Canvas.TextWidth(LineText))/CanVas.TextWidth(' '))-(TDpth*OutDepth));
  end;
end;


{ ======= Procedure to Build Total for each heading File ===== }

Procedure TNViews.Add_TotOutLines(Depth,
                                  DepthLimit,
                                  NomCat,
                                  OVABSIdx,
                                  OIndex        :   LongInt;
                                  ONType,
                                  OVNLinkType   :   Char;
                                  VCode         :   Str50;
                                  LineText      :   String);


Var

  NewIdx,
  NewObj
          :  LongInt;

  ONomRec :  ^OutNomType;


Begin

  With NLOLine do
  Begin

    New(ONomRec);
    FillChar(ONomRec^,Sizeof(ONomRec^),0);
    With ONomRec^ do
    Begin
      OutNomCode:=NomCat;
      OutDepth:=Depth;
      BeenDepth:=DepthLimit;
      OutNomType:=ONType;
      OutViewNomLink:=OVNLinkType;
      OBomAddr:=OVABSIdx;
      OutViewCode:=VCode;
      HedTotal:=BOn;
    end;

    {LineText:=Spc(1*Depth)+LJVar(LineText,ChrWidth-(20*Depth));}

    LineText:=Spc(1*Depth)+Strip('R',[#32],LineText);

    LineText:=LineText+Spc(Round((Width-Canvas.TextWidth(LineText))/Canvas.TextWidth(' '))-(TDpth*Depth));


    NewIdx:=AddChildObject(OIndex,LineText,ONomRec);

  end; {With..}

end; {Proc..}


{ ======= Procedure to Build List based on Nominal File ===== }

Procedure TNViews.Add_OutLines(Depth,
                              DepthLimit,
                              NomCat,
                              OIndex        :   LongInt;
                        Const Fnum,
                              Keypath       :   Integer);


Var
  KeyS,
  KeyChk
          :  Str255;

  LineText
          :  String;

  FoundLong,
  SpcWidth,
  NewIdx,
  NewObj,
  TmpRecAddr
          :  LongInt;

  TmpStat,
  TmpKPath
          :  Integer;

  ONomRec :  ^OutNomType;


Begin
  TmpKPath:=Keypath;

  With NLOLine do
  Begin

    SpcWidth:=Canvas.TextWidth(' ');

    KeyChk:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,NomCat,BOn);

    KeyS:=KeyChk;

    Status:=Find_Rec(B_GetGEq,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);

    While (StatusOk) and (CheckKey(KeyChk,KeyS,Length(KeyChk),BOn)) do
    With NomView^.NomViewLine do
    Begin
      {* DO not put application.processmessages here, as nom re can get corrupted...*}

      If (ViewType<>CarryFlg) or (Not FiltCarryF) then
      Begin

        New(ONomRec);
        FillChar(ONomRec^,Sizeof(ONomRec^),0);
        With ONomRec^ do
        Begin
          OutNomCode:=ViewIdx;
          OutNomCat:=ViewCat;
          OutDepth:=Depth;
          BeenDepth:=DepthLimit;
          OutNomType:=ViewType;
          OutViewNomLink:=LinkType;
          OBomAddr:=ABSViewIdx;
          OutViewCode:=ViewCode;
        end;

        {LineText:=Spc(1*Depth)+LJVar(Desc,ChrWidth-(20*Depth))}

        {LineText:=FormatLine(ONomRec^,Strip('R',[#32],Desc));}

        If (AutoDesc) and (GetNom(Self,Form_Int(LinkGL,0), FoundLong,-1)) then
          LineText:=Spc(1*Depth)+Strip('R',[#32],Nom.Desc)
        else
          LineText:=Spc(1*Depth)+Strip('R',[#32],Desc);

        If (FiltNType) and (ONomRec^.OutNomType<>ViewHedCode) then
          LineText:=LineText+' ('+ONomRec^.OutViewNomLink+')';

        If (ShowGLCode) then
        Begin
          If (Not Debug) then
            LineText:=LineText+' : '+ViewCode
          else
            LineText:=LineText+' : '+Form_Int(ViewIdx,0);
        end;

        LineText:=LineText+Spc(Round((Width-Canvas.TextWidth(LineText))/SpcWidth)-(TDpth*Depth));



        NewIdx:=AddChildObject(OIndex,LineText,ONomRec);

        If (ViewType=ViewHedCode) and (Depth<DepthLimit) then
        Begin
          TmpStat:=Presrv_BTPos(Fnum,TmpKPath,F[Fnum],TmpRecAddr,BOff,BOff);

          Add_OutLines(Depth+1,DepthLimit,ViewIdx,NewIdx,Fnum,Keypath);

          TmpStat:=Presrv_BTPos(Fnum,TmpKPath,F[Fnum],TmpRecAddr,BOn,BOn);

          With ONomRec^ do
            Add_TotOutLines(Depth+1,DepthLimit,ViewIdx,OBomAddr,NewIdx,ViewType,OutViewNomLink,OutViewCode,'Total '+Desc);
        end;

        If (Depth=0) and (ViewCat=0) and (Not IamChild) and (Not PostLock) then {We are at level zero only, so go add up totals if other posting run not in prgress}
        Begin
          {TBDiff:=Round_Up(TBDiff+TB_Balance(BOn),2);}

        end;
      end;

      Status:=Find_Rec(B_GetNext,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);

    end; {While..}

  end; {With..}

end; {Proc..}


Procedure TNViews.Update_OutLines(Const Fnum,
                                       Keypath       :   Integer);


Var
  KeyS    :  Str255;

  LineText
          :  String;

  N       :  LongInt;

  ONomRec :  ^OutNomType;


Begin
  With NLOLine do
  Begin
    BeginUpdate;

    For n:=1 to ItemCount do
    Begin
      ONomRec:=Items[n].Data;

      If (ONomRec<>Nil) then
      With ONomRec^ do
      Begin
        KeyS:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,OutNomCode,BOn);

        Status:=Find_Rec(B_GetEq,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);

        LineText:=Strip('B',[#32],Items[n].Text);

        With NomView^.NomViewLine do
        Begin
          {LineText:=Spc(1*OutDepth)+LJVar(LineText,ChrWidth-(20*OutDepth))}

          LineText:=Spc(1*OutDepth)+Strip('R',[#32],Desc);

          If (HedTotal) then
            LineText:='Total '+LineText
          else
          Begin
            If (FiltNType) and (OutNomType<>ViewHedCode) then
              LineText:=LineText+' ('+LinkType+')';

            If (ShowGLCode) then
            Begin
              If (Not Debug) then
                LineText:=LineText+' : '+ViewCode
              else
                LineText:=LineText+' : '+Form_Int(ViewIdx,0);
            end;

          end;



          {LineText:=FormatLine(ONomRec^,LineText);}

          LineText:=LineText+Spc(Round((Width-Canvas.TextWidth(LineText))/CanVas.TextWidth(' '))-(TDpth*OutDepth));

        end;

        Items[n].Text:=LineText;
      end;

    end; {Loop..}

    EndUpdate;

  end; {With..}
end; {Proc..}


Procedure TNViews.Drill_OutLines(Depth,
                                DepthLimit,
                                PIndex      :  LongInt);

Var
  NextChild       :  LongInt;

  ONomRec         :  ^OutNomType;

  LoopCtrl        :  Boolean;


Begin
  LoopCtrl:=BOff;

  With NLOLine do
  Begin
    If (Depth<DepthLimit) then
    Begin
      ONomRec:=Items[PIndex].Data;

      Repeat
        Case LoopCtrl of

          BOff  :  NextChild:=Items[PIndex].GetFirstChild;
          BOn   :  NextChild:=Items[PIndex].GetNextChild(NextChild);

        end; {Case..}

        If (ONomRec<>Nil) then
        With ONomRec^ do
        Begin
          If (NextChild<1) then {* Try and find more for this level *}
          Begin
            If (Not LoopCtrl) and (Not HedTotal) then
            Begin
              Add_OutLines(Depth,DepthLimit,OutNomCode,PIndex,NomViewF,NVCatK);

              ONomRec:=Items[PIndex].Data;

              If (OutNomType=ViewHedCode) then
                Add_TotOutLines(Depth,DepthLimit,OutNomCode,OBOmAddr,PIndex,OutNomType,OutViewNomLink,OutViewCode,'Total '+Items[PIndex].Text);
            end;
          end
          else
            Drill_OutLines(Depth+1,DepthLimit,NextChild);
        end;

        If (Not LoopCtrl) then
          LoopCtrl:=BOn;

      Until (NextChild<1);

    end; {If limit reached..}

  end; {With..}
end; {Proc..}


Procedure TNViews.Delete_OutLines(PIndex      :  LongInt;
                                   DelSelf     :  Boolean);

Var
  IdxParent,
  OrigChild,
  NextChild       :  LongInt;

  ONomRec         :  ^OutNomType;

  LoopCtrl        :  Boolean;


Begin
  LoopCtrl:=BOff;
  IdxParent:=-1;

  With NLOLine do
  Begin

    Repeat
      NextChild:=Items[PIndex].GetFirstChild;

      If (NextChild>0) then {* Try and find more for this level *}
      Begin
        ONomRec:=Items[NextChild].Data;

        If (Items[NextChild].HasItems) then {* Delete lower levels *}
          Delete_OutLines(NextChild,BOff);

        Dispose(ONomRec);
        Delete(NextChild);
      end;


    Until (NextChild<1);

    If (DelSelf) then
    Begin
      ONomRec:=Items[PIndex].Data;

      IdxParent:=Items[PIndex].Parent.Index;

      Dispose(ONomRec);
      Delete(PIndex);

      If (IdxParent>0) then
      Begin
        Items[IdxParent].Collapse;
        Items[IdxParent].Expand;
        SelectedItem:=PIndex;
      end;
    end;

  end; {With..}
end; {Proc..}

procedure TNViews.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {* Inform parent closing *}

  If (NeedCUpdate) And (StoreCoord Or FColorsChanged) then
    Store_FormCoord(Not SetDefault);

  LastSelView:=ViewCB1.ItemIndex;
  
  Send_UpdateList(41-Ord(IamChild));



end;

procedure TNViews.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  N       :  LongInt;

  ONomRec :  ^OutNomType;


begin

  With NLOLine do {* Tidy up attached objects *}
  Begin
    For n:=1 to ItemCount do
    Begin
      ONomRec:=Items[n].Data;
      If (ONomRec<>nil) then
      Begin
        Dispose(ONomRec);
        Items[n].Data:=nil;
      end;

    end;

  end;

  If (InHist) and (HistForm<>nil) then
  Begin
    InHist:=BOff;
    HistForm.Free;
  end;

  If (InRecon) and (ReconForm<>nil) then
  Begin
    InRecon:=BOff;
    ReconForm.Free;
  end;

  If (InChild) and (ChildNom<>nil) then
  Begin
    InChild:=BOff;
    ChildNom.Free;
  end;

  If (NomActive) and (NomRecForm<>nil) then
  Begin
    NomRecform.Free;
    NomActive:=BOff;
  end;

  If (ViewCtrlActive) and (ViewRecForm<>nil) then
  Begin
    ViewRecform.Free;
    ViewCtrlActive:=BOff;
  end;

  //FreeandNil(fImageRepos);

  ExLocal.Destroy;

  Action:=caFree;

end;

Function TNViews.CreateCaption  :  Str255;

Begin
  Caption:='General Ledger Drill Down : View '+SetPadNo(Form_Int(GLViewIdx,0),3)+'.  '+Get_GLViewCtrlRec(GLViewIdx).ViewDesc+'. ';

  If (Not UseYTD) and (NPrTo>NPr) then
    Caption:=Caption+PPr_OutPr(NPr,NYr)+'-'+PPr_OutPr(NPrTo,NYr)+'. '+Show_TreeCur(NCr,NTxCr)+'.'
  else
    Caption:=Caption+PPr_OutPr(NPr,NYr)+'. '+Show_TreeCur(NCr,NTxCr)+'.';



end;

Function TNViews.CreateDiffCaption  :  Str255;

Begin
    Caption:=GrandPNom.Caption+' compared to  ';

    With ParentNom do
    Begin
      If (Not UseYTD) and (NPrTo>NPr) then
        Self.Caption:=Self.Caption+PPr_OutPr(NPr,NYr)+'-'+PPr_OutPr(NPrTo,NYr)
      else
        Self.Caption:=Self.Caption+PPr_OutPr(NPr,NYr);

    end;
end;

procedure TNViews.FormCreate(Sender: TObject);
begin

  ExLocal.Create;

  InitSize.Y:=361;//367;
  InitSize.X:=657;//603;

  Self.ClientHeight:=InitSize.Y;
  Self.ClientWidth:=InitSize.X;

  {Height:=349;
  Width:=590;}

  MDI_SetFormCoord(TForm(Self));

  GotCoord:=BOff;
  NeedCUpdate:=BOff;
  FColorsChanged := False;

  FillChar(CCNomFilt,Sizeof(CCNomFilt),0);
  CCNomMode:=BOff;
  CommitMode:=0;
  IncludeBudgetCols := False;

  UseYTD:=BOn;

  Lab4Ofset:=Height-Panel4.Top+2;

  // CJS: 24/03/2011 ABSEXCH-10544
  // Moved the reading of the offsets so that they are read *before* the
  // window positions are retrieved, to ensure that they hold the design-time
  // offset (which will then be used to re-calculate the correct position for
  // the labels if the window settings have changed).
  Lab1Ofset:=Width-(NLDPanel.Width);
  Lab2Ofset:=Width-NLCrPanel.Left;
  Lab3Ofset:=Width-NLDrPanel.Left;

  Find_FormCoord;

  //ChrWidth:=InitWidth;

  //ChrsXRoss:=(ChrWidth/Width);

//  If (Not Assigned(fImageRepos)) then
//    fImageRepos:=TImageRepos.Create(Self);
//
//  If (GetMaxColors(Self.Canvas.Handle)<2) or (Syss.UseClassToolB) then {Assign 16 bit speed buttons}
//  Begin
//    ToolBar.Images := fImageRepos.ilTBar16Col;
//    ToolBar.HotImages := nil;
//
//    FreeandNil(fImageRepos.ilTBar24Bit);
//    FreeandNil(fImageRepos.ilTBar24BitHot);
//
//  end
//  else
//  Begin
//    ToolBar.Images := fImageRepos.ilTBar24bit;
//    ToolBar.HotImages := fImageRepos.ilTBar24bitHot;
//
//    FreeandNil(fImageRepos.ilTBar16Col);
//  end;


  FiltCarryF:=BOn;

  {$IFDEF MC_On}

    Set_DefaultCurr(Currency.Items,BOn,BOff);
    Set_DefaultCurr(Currency.ItemsL,BOn,BOn);

  {$ELSE}

    Currency.Visible:=BOff;
    NCurrLab.Visible:=BOff;
    TxLateChk.Visible:=BOff;

  {$ENDIF}

  Add2.Visible:=ChkAllowed_In(552);
  Add1.Visible:=Add2.Visible;
  Edit1.Visible:=ChkAllowed_In(553);
  Delete1.Visible:=ChkAllowed_In(554);

  DeleteAll1.Visible:=ChkAllowed_In(555);
  Copy1.Visible:=ChkAllowed_In(568);
  Check1.Visible:=ChkAllowed_In(556);
  Record1.Visible:=CanShowPMenu(Record1);

  Add3.Visible:=ChkAllowed_In(548);
  Edit2.Visible:=ChkAllowed_In(549);
  Delete2.Visible:=ChkAllowed_In(550);
  Copy2.Visible:=ChkAllowed_In(551);

  ViewCtrl1.Visible:=CanShowPMenu(ViewCtrl1);


  Blank(MasterVCtrl,Sizeof(MasterVCtrl));

  Set_DefaultPr(Period.Items);

  Period.ItemIndex:=Pred(GetLocalPr(0).CPr);

  ToPeriod.Visible:=BOn;

  Set_DefaultPr(ToPeriod.Items);

  ToPeriod.ItemIndex:=Pred(GetLocalPr(0).CPr);


  Set_DefaultYr(Year.Items,GetLocalPr(0).CYr);

  GLViewIdx:=0;  ViewF.Value:=GLViewIdx;

  Set_GLViewList(ViewCB1.Items,BOff);

  Set_GLViewList(ViewCB1.ItemsL,BOn);

  {$IFDEF DBD}
    If (Debug) then
      ViewF.Visible:=BOn;
  {$ENDIF}

  Year.ItemIndex:=10;

  MoveMode:=BOff;
  MoveItem:=-1;
  MoveToItem:=-1;
  MoveInsMode:=TSBSAttachMode(0);
  MoveItemParent:=-1;
  Move1.Visible:=ChkAllowed_In(198);
  N4.Visible:=Move1.Visible;

  {Check1.Visible:=(SBSIn or Debug);}

  {$IFDEF SOP}
    NIICF.Visible:=CommitAct;
  {$ELSE}
    NIICF.Visible:=BOff;

  {$ENDIF}

  TBDiff:=0.0;

  PostLock:=BOff;

  If (Not Move1.Visible) then
  Begin
    Move1.ShortCut:=0;
    Move2.ShortCut:=0;
  end;

  Move2.Visible:=BOff;
  FiltNType:=BOff;
  ShowGLCode:=BOff;

  Currency.ItemIndex:=0;

  If (Owner is TNViews) then
  With TNViews(Owner) do
  Begin
    Self.Left:=Left+20;
    Self.Top:=Top+20;
    Self.Width:=Width;
    Self.Height:=Height;
    Self.NPr:=NPr;

    Self.NPrTo:=NPrTo;

    Self.NYr:=NYr;
    Self.NCr:=NCr;
    Self.NTxCr:=NTxCr;

    Self.Period.ItemIndex:=Period.ItemIndex;

    Self.ToPeriod.ItemIndex:=ToPeriod.ItemIndex;

    Self.Year.ItemIndex:=Year.ItemIndex;
    Self.TxLateChk.Checked:=TxLateChk.Checked;

    Self.Currency.ItemIndex:=Currency.ItemIndex;

    Self.CCNomMode:=CCNomMode;
    Self.CCNomFilt:=CCNomFilt;

    Self.GLViewIdx:=GLViewIdx;
    Self.ViewCB1.ItemIndex:=ViewCB1.ItemIndex;
    Self.IncludeBudgetCols := IncludeBudgetCols;
    Self.NLOLine.ShowValCol := IfThen(Self.IncludeBudgetCols, 5, 2);


    Self.CommitMode:=CommitMode;

    Self.NLOLine.Assign(NLOLine);

    StoreCoord:=BOff;

    Self.StoreCoordFlg.Enabled:=BOff;

    Self.N4.Visible:=BOff;
    Self.N5.Visible:=BOff;
    Self.Move1.Visible:=BOff;
    Self.Move2.Visible:=BOff;
    Self.CanlMove1.Visible:=BOff;
    Self.IAmChild:=BOn;

    {$B-}
    Self.ObjectClone2.Visible:=(Assigned(Self.Owner.Owner)) and (TNViews(Self.Owner).Owner is TNViews);
    {$B+}

    If (Self.ObjectClone2.Visible) then
    Begin
      Self.ParentNom:=TNViews(Self.Owner);
      Self.GrandPNom:=TNViews(Self.Owner.Owner);
    end;

  end
  else
  Begin
    PostLock:=Being_Posted(0);

    IAmChild:=BOff;
    Add_OutLines(0,2,0,0,NomViewF,NVCatK);

    NPr:=Succ(Period.ItemIndex);

    NPrTo:=Succ(ToPeriod.ItemIndex);

    NYr:=TxlateYrVal(StrToInt(Year.Text),BOn);

    {$IFDEF MC_On}
      NCr:=Currency.ItemIndex;
    {$ELSE}
      NCr:=0;
    {$ENDIF}


    If (LastSelView=0) or (LastSelView>ViewCB1.Items.Count) then
      ViewCB1.ItemIndex:=0
    else
    Begin
      ViewCB1.ItemIndex:=LastSelView;
      ViewCB1Change(Nil);
    end;
  end;

  ObjectClone2.Visible:=BOff;

  InCCDepView:=BOff;
  InCCDepVLink:=BOff;

  If (Not Syss.UseCCDep) then
  Begin
    Label87.Visible:=BOff;
    NCCF.Visible:=BOff;

  end;

  CreateCaption;

  GotCoord:=BOn;

  NomActive:=BOff;
  NomRecForm:=nil;

  ViewCtrlActive:=BOff;
  ViewRecForm:=nil;

  // CA 23/07/2012 ABSEXCH-12952 - Setting the TreeColor
  NLOLine.TreeColor   := NLOLine.Font.Color;

  FormReSize(Self);
end;


procedure TNViews.FormResize(Sender: TObject);
Const
  MinGLCodeColWidth = 150;
Var
  MinWidth, ScrollWidth : LongInt;
Begin // FormResize
  If GotCoord Then
  Begin
    GotCoord := True;

    Try
      LockWindowUpdate(Self.Handle);

      Self.HorzScrollBar.Position:=0;
      Self.VertScrollBar.Position:=0;

      ScrollWidth := GetSystemMetrics(SM_CXVSCROLL) + 2;  // NOTE: Always seems to be out by 2 on screen!

      // Footer panel
      SBSPanel1.Top := ClientHeight - SbsPanel1.Height - SBSPanel1.Left;
      SBSPanel1.Width := ClientWidth - (2 * SBSPanel1.Left);

      // Scroll box contains column titles and tree
      ScrollBox1.Width := ClientWidth - (2 * ScrollBox1.Left);
      ScrollBox1.Height := SBSPanel1.Top - ScrollBox1.Top - SBSPanel1.Left;

      // need to calculate minimum width reqd
      MinWidth := MinGLCodeColWidth + 4 +     // GL Code
                  NLCrPanel.Width + 4 +       // Debit
                  NLDrPanel.Width +           // Credit
                  ScrollWidth;                // Vertical Scrollbar
      If IncludeBudgetCols Then
      Begin
        MinWidth := MinWidth + 4 +
                    NLBudgetPanel.Width + 4 +
                    NLRevisedPanel.Width + 4 +
                    NLVariancePanel.Width;
      End; // If IncludeBudgetCols

      NLOLine.Width := Max (MinWidth, ScrollBox1.Width);

      Repeat
        // NOTE: Need to set NLOLine.Height twice because sometimes the first time goes a bit
        // strange and you end up with less height than set e.g. 125 becomes 108, however the
        // second time seems to do the job.  If you watch it paint there appears to be a phantom
        // set of scroll bars being briefly painted - hence the LockWindowUpdate above to hide
        // all this crap.
        NLOLine.Height := ScrollBox1.ClientHeight - NLOLine.Top;
        NLOLine.Height := ScrollBox1.ClientHeight - NLOLine.Top;

        NLVariancePanel.Visible := IncludeBudgetCols;
        NLRevisedPanel.Visible := IncludeBudgetCols;
        NLBudgetPanel.Visible := IncludeBudgetCols;

        If IncludeBudgetCols Then
        Begin
          // Extended view with Budget/Revised/Variance columns [v6.01]
          NLVariancePanel.Left := NLOLine.Left + NLOLine.Width - ScrollWidth - NLVariancePanel.Width;
          NLRevisedPanel.Left := NLVariancePanel.Left - 4 - NLRevisedPanel.Width;
          NLBudgetPanel.Left := NLRevisedPanel.Left - 4 - NLBudgetPanel.Width;
          NLDrPanel.Left := NLBudgetPanel.Left - 4 - NLDrPanel.Width;
        End // If IncludeBudgetCols
        Else
          // Normal Non-Budget View
          NLDrPanel.Left := NLOLine.Left + NLOLine.Width - ScrollWidth - NLVariancePanel.Width;

        // These panels have common positioning for each view
        NLCrPanel.Left := NLDrPanel.Left - 4 - NLCrPanel.Width;
        NLDPanel.Width := NLCrPanel.Left - 4 - NLDPanel.Left;

        If (NLDPanel.Width < MinGLCodeColWidth) Then
          NLOLine.Width := NLOLine.Width + (MinGLCodeColWidth - NLDPanel.Width);
      Until (NLDPanel.Width >= MinGLCodeColWidth);

      // NOTE: If the scrollbar position is added in the numbers are painted in the wrong place!
      ColXAry[1] := NLDrPanel.Width + NLDrPanel.Left - 4 + ScrollBox1.HorzScrollBar.Position;
      ColXAry[2] := NLCrPanel.Width + NLCrPanel.Left - 4 + ScrollBox1.HorzScrollBar.Position;
      ColXAry[3] := NLBudgetPanel.Width+NLBudgetPanel.Left - 4 + ScrollBox1.HorzScrollBar.Position;
      ColXAry[4] := NLRevisedPanel.Width+NLRevisedPanel.Left - 4 + ScrollBox1.HorzScrollBar.Position;
      ColXAry[5] := NLVariancePanel.Width+NLVariancePanel.Left - 4 + ScrollBox1.HorzScrollBar.Position;

      //ChrWidth:=Round(Width*ChrsXRoss);

      //NLOLine.HideText:=(Width<=383);
      NLOLine.HideText := False;

//Caption := ' / CH: ' + IntToStr(Ord(ClientHeight)) + ' / CW: ' + IntToStr(Ord(ClientWidth)) + ' / HideText: ' + IntToStr(Ord(NLOLine.HideText));

      Update_OutLines(NomViewF,NVViewIdxK);

      GotCoord:=BOn;

      NeedCUpdate:=((StartSize.X<>Width) or (StartSize.Y<>Height));

//Caption := 'ClH: ' + IntToStr(Ord(ClientHeight)) + ' / ClW: ' + IntToStr(Ord(ClientWidth))
    Finally
      LockWindowUpdate(0);
    End; // Try..Finally
  End; // If GotCoord
End; // FormResize

//-------------------------------------------------------------------------

procedure TNViews.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  GlobFormKeyDown(Sender,Key,Shift,ActiveControl,Handle);

  If (NLOLine.SelectedItem>0) and (Key=VK_Delete) and (Not InChild) and (Not IAmChild) then
  Begin
    GetSelRec(NLOLine.SelectedItem);

    {If Ok2DelNom(0,Nom) then}  
      Display_Account(3,BOn);

  end;
end;

procedure TNViews.FormKeyPress(Sender: TObject; var Key: Char);
begin
  GlobFormKeyPress(Sender,Key,ActiveControl,Handle);
end;

procedure TNViews.Display_History(ONomCtrl     :  OutNomType;
                                   ChangeFocus,
                                   ShowGraph    :  Boolean);

Var
  NomNHCtrl  :  TNHCtrlRec;

  FoundLong  :  Longint;

  fPr,fYr    :  Byte;

  IsCC       :  Boolean;

  KeyS       :  Str255;

Begin
  With NomNHCtrl,ONomCtrl do
  Begin
    FillChar(NomNHCtrl,Sizeof(NomNHCtrl),0);

    NHMode:=50;
    NBMode:=11;

    NHCr:=NCr;
    NHTxCr:=NTxCr;
    NHPr:=NPr;
    NHYr:=NYr;

    IsCC:=BOff;

    With NomView^.NomViewLine do
    {If (ABSViewIdx<>OBomAddr) then}
    Begin
      NHForceYTDNCF:=(LinkType In YTDNCFSet);

      KeyS:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,OutNomCode,BOn);

      Status:=Find_Rec(B_GetEq,F[NomViewF],NomViewF,RecPtr[NomViewF]^,NVViewIdxK,KeyS);

      If (Not StatusOk) or (Not GetNom(Self,Form_Int(LinkGL,0),FoundLong,-1)) then
        ResetRec(NomF)
      else
      Begin
        If ((Trim(LinkCCDep[BOn])<>'') and (Trim(LinkCCDep[BOff])<>'')) or (Trim(LinkCCDep[BOn])<>'') then
        Begin
          NHCDCode:=CalcCCDepKey(BOn,LinkCCDep);
          IsCC:=BOn;
        end
        else
          NHCDCode:=LinkCCDep[BOff];


        NHCCMode:=IsCC;
      end;

      NHNomCode:=LinkGL;

      If (IncCommit) then
        NHCommitView:=2
      else
        NHCommitView:=0;

      NHCCode:=PostNVIdx(GLViewIdx,ABSViewIdx);

    end;



    {NHCCode:=CalcCCKeyHistP(NHNomCode,NHCCMode,NHCDCode);}

    

    {NHCCode:=FullNomKey(NHNomCode);}


    NHKeyLen:=NHCodeLen+2;


    With NomView^.NomViewLine do
    Begin
      Find_FirstHist(ViewType,NomNHCtrl,fPr,fYr);
      MainK:=FullNHistKey(ViewType,NHCCode,NCr,fYr,fPr);
      AltMainK:=FullNHistKey(ViewType,NHCCode,NCr,0,0);
    end;

    Set_NHFormMode(NomNHCtrl);

  end;

  If (Not InHist) then
  Begin


    HistForm:=THistWin.Create(Self);

  end;

  Try

   InHist:=BOn;

   With HistForm do
   Begin

     WindowState:=wsNormal;


     If (ChangeFocus) then
       Show;


     ShowLink(BOn,ShowGraph);


   end; {With..}


  except

   InHist:=BOff;

   HistForm.Free;
   HistForm:=nil;

  end; {try..}


end;


procedure TNViews.Display_Recon(Opt          :  Byte;
                                 ONomCtrl     :  OutNomType;
                                 ChangeFocus  :  Boolean);

Var
  NomNHCtrl  :  TNHCtrlRec;

  FoundLong  :  Longint;

  fPr,fYr    :  Byte;

  WasFromHist,
  IsCC,
  NeedGExt   :  Boolean;

  KeyS       :  Str255;

Begin
  With NomNHCtrl,ONomCtrl do
  Begin
    FillChar(NomNHCtrl,Sizeof(NomNHCtrl),0);

    WasFromHist:=(Opt=15) and (InHist);

    NHCCDDMode:=(Opt=16); IsCC:=BOff;  NHUnPostMode:=BOff;

    With NomView^.NomViewLine do
    {If (ABSViewIdx<>OBomAddr) then}
    Begin
      KeyS:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,OutNomCode,BOn);

      Status:=Find_Rec(B_GetEq,F[NomViewF],NomViewF,RecPtr[NomViewF]^,NVViewIdxK,KeyS);

      If (Not StatusOk) or (Not GetNom(Self,Form_Int(LinkGL,0),FoundLong,-1)) then
        ResetRec(NomF)
      else
      Begin
        If ((Trim(LinkCCDep[BOn])<>'') and (Trim(LinkCCDep[BOff])<>'')) or (Trim(LinkCCDep[BOn])<>'') then
        Begin
          NHCDCode:=CalcCCDepKey(BOn,LinkCCDep);
          IsCC:=BOn;
        end
        else
          NHCDCode:=LinkCCDep[BOff];


        NHCCMode:=IsCC;


        NHUnPostMode:=(IncUnPosted=1);

      end;

      NHNomCode:=LinkGL;

      If (IncCommit) then
        NHCommitView:=2
      else
        NHCommitView:=0;
    end;



    If (NHCCDDMode) then {* Adjust for CC/Dep Filt DD *}
      Opt:=15;

    NHMode:=Opt;

    NHCr:=NCr;
    NHTxCr:=NTxCr;

    NHPr:=NPr;

    NHYr:=NYr;


    If (WasFromHist) then {Take CC/Dep code from whatever history is set to}
    With HistForm do
    Begin
      try
        NHCDCode:=NHCtrl.NHCDCode;
        NHCCMode:=NHCtrl.NHCCMode;
        NHCCDDMode:=NHCtrl.NHCCDDMode;
      except
        On exception do;
      end; {try..}
    end;



    NeedGExt:=(NHMode=15);

    If (NeedGExt) and (Not NHCCDDMode) then
    With ExLocal do
    Begin
      NHPr:=LNHist.Pr;

      NHYr:=LNHist.Yr;

      NHYTDMode:=(NHPr=YTD);

      NHSDDFilt:=BOn;
    end;

    NHKeyLen:=Succ(Sizeof(Nom.NomCode));  {* NomCode+NomMode *}

    {$IFDEF MC_On}

      If (NHCr<>0) then
      Begin

        Inc(NHKeyLen);  { Include Currency }

        If (NHMode=15) then
        Begin
          NHKeyLen:=NHKeyLen+2; {Include Period & Year}

          If (NHPr In [YTD,YTDNCF]) then   {* Searching by year only *}
          Begin

            Dec(NHKeyLen);

          end;

        end;

        NeedGExt:=Not EmptyKeyS(NHCDCode,ccKeyLen,BOff);
      end;

    {$ELSE}

      Begin

        If (NHMode=15) then
        Begin
          NHKeyLen:=NHKeyLen+3; {Include Currency, Period & Year}

          If (NHPr In [YTD,YTDNCF]) then   {* Searching by year only *}
          Begin
            Dec(NHKeyLen);

          end;

        end;

        {$IFDEF PF_On}
          NeedGExt:=Not EmptyKeyS(NHCDCode,ccKeyLen,BOff);
        {$ELSE}
          NeedGExt:=BOff;
        {$ENDIF}

      end;

    {$ENDIF}


    NHNeedGExt:=NeedGExt;

    With Nom do
    Begin
      If (NHMode=15) and (Not NHCCDDMode) then
      Begin
        {$IFDEF MC_On}

          If (NHCr=0) then
            MainK:=FullIdPostKey(NHNomCode,0,0,NHCr,0,0)
          else
          Begin
            If (NHPr In [YTD,YTDNCF]) then {* Prime key at start of list *}
              NHPr:=1;

            MainK:=FullIdPostKey(NHNomCode,0,0,NHCr,NHYr,NHPr);
          end;

        {$ELSE}

            If (NHPr In [YTD,YTDNCF]) then
              NHPr:=1;

            MainK:=FullIdPostKey(NHNomCode,0,0,NHCr,NHYr,NHPr);

        {$ENDIF}
      end
      else
        MainK:=FullIdPostKey(NomCode,0,0,NHCr,0,0);

      If (NHUnPostMode) then
      Begin
        MainK:=FullIdKey(0,NHNomCode);
        NHKeyLen:=Length(MainK);
        NHNeedGExt:=BOff; {We cannot support get extended here yet}
      end;
    end;


    Set_DDFormMode(NomNHCtrl);

  end;

  If (Not InRecon) then
  Begin


    ReconForm:=TReconList.Create(Self);

  end;

  Try

   InRecon:=BOn;

   With ReconForm do
   Begin

     WindowState:=wsNormal;

     If (ChangeFocus) then
       Show;

     ShowLink(BOn);

   end; {With..}


  except

   InRecon:=BOff;

   ReconForm.Free;
   ReconForm:=nil;

  end; {try..}


end;


procedure TNViews.Display_CCDepView(ONomCtrl     :  OutNomType;
                                     ChangeFocus  :  Boolean);

Var
  NomNHCtrl  :  TNHCtrlRec;

  FoundLong  :  Longint;

  fPr,fYr    :  Byte;

Begin
  With NomNHCtrl,ONomCtrl do
  Begin
    FillChar(NomNHCtrl,Sizeof(NomNHCtrl),0);


    NHCr:=NCr;
    NHTxCr:=NTxCr;
    NHPr:=NPr;
    NHPrTo:=NPrTo;

    NHYr:=NYr;
    NHNomCode:=OutNomCode;

    NHCDCode:=CCNomFilt[CCNomMode];
    NHCCMode:=CCNomMode;

    NHCCode:=CalcCCKeyHistP(NHNomCode,CCNomMode,NHCDCode);

    {$IFDEF SOP}
      NHCommitView:=CommitMode;

    {$ENDIF}

    {NHCCode:=FullNomKey(NHNomCode);}


    If (Nom.NomCode<>NHNomCode) then  
      GetNom(Self,Form_Int(NHNomCode,0),FoundLong,-1);


  end;

  If (Not InCCDepView) then
  Begin


    CCDepView:=TCCDepView.Create(Self);

  end;

  Try

   InCCDepView:=BOn;

   With CCDepView do
   Begin

     WindowState:=wsNormal;

     CCDepNHCtrl:=NomNHCtrl;
     CCNom:=Nom;
     UseYTD:=Self.UseYTD;

     TotalBal:=ONomCtrl.StkCost;

     If (ChangeFocus) then
       Show;

     Show_Link;



   end; {With..}


  except

   InCCDepView:=BOff;

   CCDepView.Free;
   CCDepView:=nil;

  end; {try..}


end;



procedure TNViews.NLOLineExpand(Sender: TObject; Index: Longint);
Var
  Depth   :  LongInt;
  ONomRec :  ^OutNomType;

begin
  With (Sender as TSBSOutLineB) do
  Begin
    Depth:=Pred(Items[Index].Level);

    ONomRec:=Items[Index].Data;

    If (ONomRec<>nil) then
    With ONomRec^ do
    Begin
      If (BeenDepth<Depth+2) then
      Begin
        BeenDepth:=Depth+2;
        {BeginUpdate;}
        Drill_OutLines(Depth,Depth+2,Index);
        {EndUpdate;}
      end;
    end;

  end; {With..}

  If (InChild) then
    ChildNom.NLOLine.ExpandxNCode(NLOLine.Items[Index].Data,BOn);

  ReconBtnClick(Sender);

end;

procedure TNViews.NLOLineCollapse(Sender: TObject; Index: Longint);
begin
  If (InChild) then
    ChildNom.NLOLine.ExpandxNCode(NLOLine.Items[Index].Data,BOff);
end;


Procedure TNViews.LinkList(NC  :  Str50);

Begin
  lblViewCode.Caption:= 'GL Code : ' + NC;
end;

procedure TNViews.NLOLineNeedValue(Sender: TObject);

Var
  ONomRec      :  ^OutNomType;
  DrawIdxCode  :  LongInt;
  Profit, Sales, Purch, CommitValue, Cleared, PBudget, PBudget2, BV1, BV2, Balance :  Double;
  Loop       :  Boolean;
  StoreD     :  Double;
  CalcNom    :  TNViews;
Begin // NLOLineNeedValue
  With Sender As TSBSOutLineB Do
  Begin
    DrawIdxCode:=CalcIdx;

    If (DrawIdxCode>0) then
    Begin
      ONomRec:=Items[DrawIdxCode].Data;

      If Assigned(ONomRec) Then
      Begin
        With ONomRec^ Do
        Begin
          If (DrawIdxCode=SelectedItem) then
            LinkList(OutViewCode);

          If (LastPr<>NPr) or (LastPrTo<>NPrTo) or (LastYr<>NYr) or (LastCr<>NCr) or (LastYTD<>UseYTD)
            or (LastTxCr<>NTxCr) or (LastCCFilt[CCNomMode]<>CCNomFilt[CCNomMode])
            or (LastHValue<>HideValue) or (LastCommitMode<>CommitMode)
            then
          Begin


            Loop:=BOff;  StoreD:=0.0;

            If (ObjectClone2.Checked) then
               CalcNom:=GrandPNom
             else
               CalcNom:=Self;

             Repeat
               With CalcNom do
               Begin
                 Profit:=0.0; {CommitValue:=0.0;}

(*
             {$IFDEF SOP}
                 If (CommitMode In [0,1]) then
                   Profit:=Profit_to_DateRange(OutNomType,PostNVIdx(GLViewIdx,OBomAddr),
                                        NCr,NYr,NPr,NPrTo,Purch,Sales,Cleared,UseYTD);

                 {If (CommitMode In [1,2]) then
                   CommitValue:=Profit_to_DateRange(OutNomType,CommitKey+CalcCCKeyHistP(OutNomCode,CCNomMode,CCNomFilt[CCNomMode]),
                                        NCr,NYr,NPr,NPrTo,Purch,Sales,Cleared,UseYTD);}

                 Profit:=Profit+CommitValue;
             {$ELSE}
                 Profit:=Profit_to_DateRange(OutNomType,PostNVIdx(GLViewIdx,OBomAddr),
                                        NCr,NYr,NPr,NPrTo,Purch,Sales,Cleared,UseYTD);
             {$ENDIF}
*)
                 {$IFDEF SOP}
                   If (CommitMode In [0,1]) then
                 {$ENDIF}
                     // MH 22/05/2009: Switched to Total_Profit_to_DateRange to access budgetary information
                     Profit := Total_Profit_to_DateRange(OutNomType,PostNVIdx(GLViewIdx,OBomAddr),NCr,NYr,NPr,NPrTo,Purch,Sales,Cleared,PBudget,PBudget2,BV1,BV2,UseYTD);
               End; // With CalcNom

               Loop:=Not Loop;

               If (Self.ObjectClone2.Checked) then
               Begin
                 If (Loop) then
                 Begin
                   CalcNom:=ParentNom;
                   StoreD:=Profit;
                 end;
                 {else
                   Profit:=Round_Up(StoreD-Profit,2);}
               End; // If (Self.ObjectClone2.Checked)
             Until (Not Loop) or (Not Self.ObjectClone2.Checked);

             Blank(LastDrCr,Sizeof(LastDrCr));

             If (Self.ObjectClone2.Checked) then
             Begin
               LastDrCr[2]:=Round_Up(StoreD-Profit,2);
               LastDrCr[1]:=Calc_Pcnt(StoreD,LastDrCr[2]);

             end
             else
             Begin
               StkCost:=Currency_Txlate(Profit,NCr,NTxCr);

               LastDrCr[1+Ord(Profit>0)]:=ABS(StkCost);

             end;

             LastDrCr[3] := PBudget;
             LastDrCr[4] := PBudget2;

            ColValue:=0;

            LastPr:=NPr;
            LastPrTo:=NPrTo;
            LastYr:=NYr;
            LastCr:=NCr;
            LastTxCr:=NTxCr;
            LastYTD:=UseYTD;
            LastHValue:=HideValue;
            LastCCFilt:=CCNomFilt;
            LastCommitMode:=COmmitMode;
          end; {If settings changed..}

          With Items[DrawIdxCode] Do
          Begin
            Case SetCol Of
              1, 2 : Begin
                       If (Not HideValue) then
                       Begin
                          If ((Not Expanded) or (Not HasItems)) then
                            ColValue:=LastDrCr[SetCol];
                       End // If (Not HideValue)
                       Else
                         ColValue:=0.0;
                     End; // 1, 2 - Debit / Credit
              3    : ColValue := LastDrCr[3];  // Budget
              4    : ColValue := LastDrCr[4];  // Revised Budget
              5    : Begin // Variance
                       Balance := IfThen(LastDrCr[1] <> 0, -LastDrCr[1], LastDrCr[2]);
                       If (LastDrCr[4] <> 0) Then
                         ColValue := Balance - LastDrCr[4]
                       Else
                         ColValue := Balance - LastDrCr[3];
                     End; // Variance
              Else
                ColValue := SetCol;
            End; // Case SetCol
          End; // With Items[DrawIdxCode]

          If (SetCol=1) and (Self.ObjectClone2.Checked) then
            ColFmt:=GenPcntMask
          else
            ColFmt:=GenRealMask;

          ColsX:=ColXAry[SetCol];
          If (DrawIdxCode=SelectedItem) and (InCCDepView) then
              PostMessage(Self.Handle,WM_CustGetRec,30,0);
        End; // With ONomRec^
      End; // If Assigned(ONomRec)
    End; // If (DrawIdxCode>0)
  End; // With Sender As TSBSOutLineB
End; // NLOLineNeedValue

//-------------------------------------------------------------------------

procedure TNViews.NLOLineUpdateNode(Sender: TObject;
  var Node: TSBSOutLNode; Row: Integer);
var
  ONomRec      :  ^OutNomType;

begin
  With Node do
  Begin
    ONomRec:=Data;

    If (ONomRec<>nil) then
    With ONomRec^ do
    Begin
      If (Not HasItems) then
      Begin
        Case OutViewNomLink of
          BankNHCode   :  UseLeafX:=obLeaf2;
          CtrlNHCode   :  UseLeafX:=obLeaf3;
          CarryFlg     :  UseLeafX:=obLeaf4;
          else            UseLeafX:=obLeaf;
        end; {Case..}

        If HedTotal then
          UseLeafX:=obMinus;
      end;
    end;

  end;

end;



procedure TNViews.CurrencyClick(Sender: TObject);
begin
  NPr:=Succ(Period.ItemIndex);

  NPrTo:=Succ(ToPeriod.ItemIndex);

  NYr:=TxLateYrVal(StrToInt(Year.Text),BOn);

  {GLViewIdx:=Trunc(ViewF.Value);}

  {$IFDEF MC_On}
    If (TxLateChk.Checked) then
      NTxCr:=Currency.ItemIndex
    else
      NCr:=Currency.ItemIndex;
  {$ENDIF}

  CreateCaption;

  NLOLine.Refresh;

  lblTBDiff.Visible:=BOff;

  If (Sender<>nil) then
  Begin
    RefreshHist:=InHist;

    If (RefreshHist) then
      HistBtnClick(nil);

    RefreshRecon:=InRecon;

    If (RefreshRecon) then
      ReconBtnClick(nil);

    RefreshCCDepView:=InCCDepView;

    If RefreshCCDepView then
      CCDepView1Click(Nil);
  end;

  NLChildForceReDraw;

end;


procedure TNViews.FullExBtnClick(Sender: TObject);
begin
  If (Sender=FullExBtn) then
  Begin
    NLOLine.StopDD:=BOn;

    If (InChild) then
      ChildNom.NLOLine.StopDD:=BOn;

    NLOLine.FullExpand;

    If (InChild) then
    Begin
      ChildNom.NLOLine.FullExpand;
      ChildNom.NLOLine.StopDD:=BOff;
    end;

    NLOLine.StopDD:=BOff;

  end
  else
  Begin
    NLOLine.FullCollapse;

    If (InChild) then
      ChildNom.NLOLine.FullCollapse;

  end;
end;


Procedure TNViews.SuperDDCtrl(Mode  :  Byte);


Begin

  With NLOLine,EXlocal do
  Begin
    If (Items[SelectedItem].HasItems) then
    Begin
      If (Mode=0) then
      Begin
        If (Not (LNHist.Pr In [YTD,YTDNCF])) then
          Period.ItemIndex:=Pred(LNHist.Pr)
        else
          Period.ItemIndex:=Pred(Period.Items.Count);


        Set_DefaultYr(Year.Items,LNHist.Yr);

        Year.ItemIndex:=10;

        YTDChk.Checked:=(LNHist.Pr In [YTD,YTDNCF]);

        UseYTD:=YTDChk.Checked;

        Items[SelectedItem].Expand;

        InHCallBack:=BOn;

        CurrencyClick(HistForm);

        InHCallBack:=BOff;
        InHBeen:=BOn;
      end;
    end
    else
    Begin
      RefreshRecon:=BOn;

      If (InHist) and (InRecon) or (Mode=0) then
        ReconBtnClick(HistForm);
    end;

  end


end;

Function TNViews.GetSelRec(Idx  :  Integer)  :  Boolean;


Var
  ONomRec   :  ^OutNomType;
  FoundOk   :  Boolean;
  FoundLong :  LongInt;
  KeyChk,
  KeyN      :  Str255;


begin
  FoundOk:=BOff;

  With NLOLine do
  Begin
    If (Idx>0) then
    Begin
      ONomRec:=Items[Idx].Data;

      With ONomRec^ do
      Begin
        Result:=(NomView^.NomViewLine.ViewIdx=OutNomCode);

        KeyN:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,OutNomCode,BOn);

        {KeyN:=FullNVCode(NVRCode,NVVSCode,GLViewIdx,OutViewCode,BOn);}
        KeyChk:=KeyN;

        Status:=Find_Rec(B_GetGEq,F[NomViewF],NomViewF,RecPtr[NomViewF]^,NVViewIdxK,KeyN);

        FoundOk:=StatusOk and (CheckKey(KeyChk,KeyN,Length(KeyChk),BOn));

        {$IFDEF DBD}
          If (Not  StatusOk) then
            ShowMessage(KeyChk+' | '+KeyN);
        {$ENDIF}
      end;
    end;
  end; {With..}

  Result:=FoundOk;
end;


Function TNViews.DeleteMyNOMLine(Fnum,
                                 KeyPath  :  Integer)  :  Boolean;

Var
  KeyS   :  Str255;

Begin
  Result:=BOff;

  With ExLocal do
  Begin
    LGetRecAddr(Fnum);

    Status:=LGetDirectRec(Fnum,KeyPath);

    If (StatusOk) then
    Begin

      Ok:=LGetMultiRec(B_GetDirect,B_MultLock,KeyS,KeyPath,Fnum,BOn,GlobLocked);

      If (Ok) and (GlobLocked) then
      Begin

        Status:=Delete_Rec(F[Fnum],Fnum,KeyPath);

        Report_BError(Fnum,Status);
      end;

      Result:=StatusOk;

      If (Result) then
      With ExLocal.LNomView^.NomViewLine do
      Begin
        KeyS:=ViewType+PostNVIdx(NomViewNo,ABSViewIdx);
        DeleteLinks(KeyS,NHistF,Length(KeyS),NHK,BOff);
      end;
    end;
  end; {With..}
end;





procedure TNViews.Delete_Branch(DelLeaf,Level  :  LongInt);

Var
  mbRet      :  Word;
  NextChild  :  LongInt;

  PONomRec,
  ONomRec    :  ^OutNomType;

  ThisNode   :  TSBSOutLNode;


Begin
  If (Level=0) then
    MbRet:=MessageDlg('Please confirm you wish'#13+'to delete this record',
                       mtConfirmation,[mbYes,mbNo],0)
  else
    mbRet:=mrYes;

  If (mbRet=mrYes) then
  With NLOLine do
  Begin
    ThisNode:=Items[DelLeaf];

    PONomRec:=ThisNode.Data;

    If (ThisNode.HasItems) then
    Begin

      Repeat
        NextChild:=Items[DelLeaf].GetFirstChild;


        If (NextChild>0) and (NextChild<>DelLeaf) then {* Try and find more for this level *}
        Begin
          ONomRec:=Items[NextChild].Data;

          {$IFDEF DBD}
            If (ONomRec^.OutNomCode=0) then  {* Debug point *}
              MessageBeep(0);
          {$ENDIF}

          If (ONomRec^.OutNomCode<>PONomRec^.OutNomCode) then
          Begin
            If (Items[NextChild].HasItems) then {* Delete lower levels *}
              Delete_Branch(NextChild,Succ(Level))
            else
            If (GetSelRec(NextChild)) then
            Begin
              ONomRec:=Items[NextChild].Data;

              ExLocal.AssignfromGlobal(NomViewF);

              If (Not DeleteMyNomLine(NomViewF,NVViewIdxK)) then
                MessageBeep(0);

              Dispose(ONomRec);
              Delete(NextChild);
            end
            else
              NextChild:=-1;
          end
          else
            NextChild:=-1;
        end;

        {NextChild:=Items[DelLeaf].GetNextChild(NextChild);}

      Until (NextChild<1);


    end;

    ONomRec:=ThisNode.Data;

    {$B-}
    If (Level<>-99999) and GetSelRec(DelLeaf) then
    {$B+}
    Begin
      ExLocal.AssignfromGlobal(NomViewF);

      If (Not DeleteMyNomLine(NomViewF,NVViewIdxK)) then
        MessageBeep(0);

      Dispose(ONomRec);
      Delete(DelLeaf);
    end;
  end;
end;



procedure TNViews.Display_Account(Mode             :  Byte;
                                   ChangeFocus      :  Boolean);

Var
  ONomRec    :  ^OutNomType;

  LSelectedItem
             :  LongInt;
  ThisNode   :  TSBSOutLNode;


Begin
  With NLOLine do
  If (SelectedItem>0) then
  Begin
    LSelectedItem:=SelectedItem;
    ThisNode:=Items[LSelectedItem];

    ONomRec:=ThisNode.Data;
  end
  else
    LSelectedItem:=0;


  {$B-}
  If (Mode=1) or GetSelRec(LSelectedItem) then
  {$B+}
  Begin


    If (NomRecForm=nil) then
    Begin

      NomRecForm:=TNomVRec.Create(Self);

    end;

    Try

     NomActive:=BOn;

     With NomRecForm do
     Begin

       WindowState:=wsNormal;

       If (Mode In [1..10]) and (ChangeFocus) then
         Show;


       If (Mode In [1..3]) and (Not ExLocal.InAddEdit) then
       Begin

         If (Mode=3) then
           DeleteNomLine(NomViewF,NVCatK)
         else
         Begin
           If (Mode=1) then {* Set Parent *}
           Begin
             {$B-}

             With NLOLine do
               If (SelectedItem>0) and (ThisNode.Parent.Index>0) then
                 Level_Code:=OutNomType(ThisNode.Parent.Data^).OutNomCode
               else
                 Level_Code:=0;
             {$B+}

             Level_View:=GLViewIdx;
             ParentCtrl:=MasterVCtrl;

           end;
           EditLine(NomView^,(Mode=2));

         end;
       end;



     end; {With..}


    except

     NomActive:=BOff;

     NomRecForm.Free;

    end;
  end;

end;


Procedure TNViews.AddEditLine(Edit  :  Boolean);

Var
  Depth,
  OIndex,
  NewIdx   :  Integer;
  PNode    :  TSBSOutLNode;
  NewFolio :  LongInt;
  ONomRec  :  ^OutNomType;

Begin

  With NLOLine,NomView^.NomViewLine do
  If (Not Edit) then
  Begin
    NewFolio:=ViewIdx;

    {$B-}
    If (SelectedItem=0) or (Items[SelectedItem].Parent.Index<=0) then
    Begin
    {$B+}

      If (SelectedItem>0) then
      Begin

        PNode:=Items[SelectedItem];

        Repeat

          Delete_OutLines(1,BOn);

        Until (ItemCount<=0);

      end;

      Add_OutLines(0,2,0,0,NomViewF,NVCatK)

    end
    else
    Begin
      PNode:=Items[SelectedItem].Parent;
      OIndex:=PNode.Index;

      ONomRec:=PNode.Data;

      ONomRec^.BeenDepth:=0;
      PNode.Collapse;

      Delete_OutLines(OIndex,BOff);

      Depth:=Pred(PNode.Level);

      Drill_OutLines(Depth,Depth+2,OIndex);
      PNode.Expand;
    end;



    OIndex:=FindNode(Integer(NewFolio));

    If (OIndex<>-1) then
      SelectedItem:=OIndex;


  end
  else
  Begin
    ONomRec:=Items[SelectedItem].Data;
    Items[SelectedItem].Text:=FormatLine(ONomRec^,Desc);
    ONomRec^.OutNomCode:=ViewIdx;
    ONomRec^.OutNomType:=ViewType;

    PNode:=Items[SelectedItem];
    OIndex:=SelectedItem;

    Delete_OutLines(OIndex,BOff);

    Depth:=Pred(PNode.Level);

    Drill_OutLines(Depth,Depth+2,OIndex);
  end;

end;


Procedure TNViews.WMFormCloseMsg(Var Message  :  TMessage);


Begin

  With Message do
  Begin

    Case WParam of

      40 :  InChild:=BOff;

      41 :  Begin
              InHist:=BOff;

              If (InCCDepView) then
              Begin
                CCDepView.InHist:=BOff;
                CCDepView.InGraph:=BOff;
              end;
            end;

      42 :  Begin
              InRecon:=BOff;

              If (InCCDepView) then
              Begin
                CCDepView.InRecon:=BOff;
              end;
            end;

      43 :  Begin
              InCCDepView:=BOff;
              CCDepView:=nil;
            end;
      44..46
         :  Show_CCDepViewHistory((WParam=45),Ord(WParam=46));


      52,53
         :  Begin
              ExLocal.AssignFromGlobal(NHistF);

              SuperDDCtrl(WParam-52)
            end;

      62
         :  Begin
              ExLocal.AssignFromGlobal(NomViewF);
              ExLocal.AssignFromGlobal(NHistF);
              PlaceNomCode(ExLocal.LNomView^.NomViewLine.ViewCode);
              SuperDDCtrl(0);
            end;

            {* A move is being recovered close form... *}
      71 :  SendMessage(Self.Handle,WM_Close,0,0);

      {$IFDEF POST} 
        70,72
         :  {RefreshMove;} {* This has been disabled since it could be very confusing to have things collapse etc whilst you were still moving about. *}
             Update_Total4Thread(LParam,(WParam=70));
      {$ENDIF}

    end; {Case..}

  end;
  Inherited;
end;

Procedure TNViews.WMCustGetRec(Var Message  :  TMessage);

Var
  n  :  Integer;

Begin

  With Message do
  Begin

    Case WParam of
       25  :  NeedCUpdate:=BOn;

       30  :  CCDepView1Click(Nil);

      100  : If (NomActive) then
             Begin
               NomRecForm.ExLocal.AssignToGlobal(NomViewF);
               AddEditLine((LParam=1));
             end;

      101  : If (ViewCtrlActive) then
             Begin
               ViewRecForm.ExLocal.AssignToGlobal(NomViewF);

               // MH 22/05/2009: Bug-fix - if user edited an existing view to include budgets the
               // local copy of the record wasn't updated - if part of the GL structure was then
               // copied the line records were based on the obsolete ctrl record.
               MasterVCtrl := NomView^.ViewCtrl;

               // Check for changes in IncBudget flag
               If (IncludeBudgetCols <> MasterVCtrl.IncBudget) Then
               Begin
                 IncludeBudgetCols := MasterVCtrl.IncBudget;
                 NLOLine.ShowValCol := IfThen(IncludeBudgetCols, 5, 2);
                 FormResize(Self);
               End; // If (IncludeBudgetCols <> IncBudget)

               If (LParam=0) then
               Begin
                 Set_GLViewList(ViewCB1.Items,BOff);

                 Set_GLViewList(ViewCB1.ItemsL,BOn);

                 For n:=Pred(ViewCB1.Items.Count) downto 1 do
                 Begin
                   If (IntStr(Copy(ViewCB1.Items[n],1,3)) = NomView^.ViewCtrl.ViewCtrlNo) then
                   Begin
                     ViewCB1.ItemIndex:=n;
                     ViewCB1Change(Nil);
                     Break;
                   end;
                 end;
                 ViewF.Value:=NomView^.ViewCtrl.ViewCtrlNo;
                 {ViewFExit(ViewF);}
               end;
             end;


      169  : With NLOLine do
               Items[SelectedItem].Expand;

      200,300,303
         :  Begin
              If (WParam<>303) then
              Begin
                NomActive:=BOff;
                NomRecForm:=nil;
              end;

              If (WParam=300) or (WParam=303) then
              With NLOLine do
                If (SelectedItem>=0) then
                  Delete_Branch(SelectedItem,1+(-100000*Ord(WParam=303)));
            end;
      201,301
         :  Begin
              ViewCtrlActive:=BOff;
              ViewRecForm:=nil;

              If (WParam=301) then
              Begin
                DeleteAllNoms(1);

                Set_GLViewList(ViewCB1.Items,BOff);

                Set_GLViewList(ViewCB1.ItemsL,BOn);

                ViewCB1.ITemIndex:=0;
              end;
            end;

    end; {Case..}

  end;
  Inherited;
end;


Procedure TNViews.WMGetMinMaxInfo(Var Message  :  TWMGetMinMaxInfo);

Begin

  With Message.MinMaxInfo^ do
  Begin

    // MH 27/05/2009: Modified minimum sizing for v6.01
    //ptMinTrackSize.X:=200;
    ptMinTrackSize.X := (Width-ClientWidth) + 293;

    //ptMinTrackSize.Y:=210;
    ptMinTrackSize.Y := (Height-ClientHeight) + 184;


    {ptMaxSize.X:=530;
    ptMaxSize.Y:=368;
    ptMaxPosition.X:=1;
    ptMaxPosition.Y:=1;}

  end;

  Message.Result:=0;

  Inherited;

end;

{ == Procedure to Send Message to Get Record == }

Procedure TNViews.Send_UpdateList(Mode   :  Integer);

Var
  Message1 :  TMessage;
  MessResult
           :  LongInt;

Begin
  FillChar(Message1,Sizeof(Message1),0);

  With Message1 do
  Begin
    MSg:=WM_FormCloseMsg;
    WParam:=Mode;
  end;

  With Message1 do
    MessResult:=SendMEssage((Owner as TForm).Handle,Msg,WParam,LParam);

end; {Proc..}



procedure TNViews.ClsI1BtnClick(Sender: TObject);
begin
  Close;
end;

procedure TNViews.NomSplitBtnClick(Sender: TObject);
begin
  If (Not InChild) then
  Begin
    ChildNom:=TNViews.Create(Self);
    InChild:=BOn;
  end;

  try
    With ChildNom do
    Begin
      Show;
    end;

  except

    InChild:=BOff;
    ChildNom:=nil;

  end; {try..}

end;


procedure TNViews.NLChildForceReDraw;

Var
  GrandChild  :  TNViews;

Begin
  {$B-}

  If (InChild) then
  Begin
    GrandChild:=ChildNom;

    If (ChildNom.InChild) and (Not ChildNom.ObjectClone2.Checked) then
      GrandChild:=ChildNom.ChildNom;
  end;

  If (InChild) and (GrandChild.ObjectClone2.Checked) then
  {$B+}
  With GrandChild do
  Begin
    CreateDiffCaption;

    UseYTD:=Not UseYTD;

    NLOLine.Refresh;
  end;

end;

procedure TNViews.NLChildUpdate;

Var
  n   :  Integer;

Begin

  If (InChild) then
  Begin
    n:=ChildNom.NLOLine.FindxNCode(NLOLine.Items[NLOLine.SelectedItem].Data);

    If (n<>-1) then
      ChildNom.NLOLine.SelectedItem:=n;

  end;


end;

procedure TNViews.NLOLineDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);


begin
  If (InHist) then
    HistBtnClick(nil);

  If (InRecon) then
    ReconBtnClick(nil);
  
  NLChildUpDate;

end;

procedure TNViews.YTDChkClick(Sender: TObject);
begin
  UseYTD:=YTDChk.Checked;

  ToPeriod.Enabled:=Not UseYTD;

  NLChildForceReDraw;

  NLOLine.Refresh;
end;

procedure TNViews.PopupMenu1Popup(Sender: TObject);

Var
  ONomRec  :  ^OutNomType;

begin
  StoreCoordFlg.Checked:=StoreCoord;
  ShowC1.Checked:=Not FiltCarryF;


  GetSelRec(NLOLine.SelectedItem);

  Delete1.Enabled:=Bon;

  Record1.Enabled:=(ViewCB1.ItemIndex>0);

  Add2.Enabled:=Record1.Enabled;

  Edit2.Enabled:=Record1.Enabled;
  Delete2.Enabled:=Record1.Enabled;
  Copy2.Enabled:=Record1.Enabled;
  MiHist.Enabled:=Record1.Enabled;
  Graph1.Enabled:=Record1.Enabled;
  MiFind.Enabled:=Record1.Enabled;
  Move1.Enabled:=Record1.Enabled and (NLOLine.ItemCount>0);
  Move2.Enabled:=Move1.Enabled;
  CanlMove1.Enabled:=Record1.Enabled;
  Check1.Enabled:=Record1.Enabled;
  Show1.Enabled:=Record1.Enabled;
  ShowG1.Enabled:=Record1.Enabled;
  ShowC1.Enabled:=Record1.Enabled;
  ObjectClone1.Enabled:=Record1.Enabled;


  Expand1.Enabled:=(NLOLine.ItemCount>0);
  MIColL.Enabled:=Expand1.Enabled;
  
  Delete1.Enabled:=(Not InChild) and (Not IAmChild);

  DeleteAll1.Enabled:=Delete1.Enabled;

  With NLOLine do
    If (SelectedItem>0) then
    Begin
      ONomRec:=Items[SelectedItem].Data;

      With Delete1 do
        Enabled:=(Enabled and Not ONomRec^.HedTotal);
    end;


  N3.Tag:=Ord(ActiveControl Is TSBSOutLineB);
end;



procedure TNViews.SetFieldProperties;

Var
  n  : Integer;


Begin

  For n:=0 to Pred(ComponentCount) do
  Begin
    If (Components[n] is TMaskEdit) or (Components[n] is TSBSComboBox)
     or (Components[n] is TCurrencyEdit) and (Components[n]<>Period) then
    With TGlobControl(Components[n]) do
      If (Tag>0) then
      Begin
        Font.Assign(Period.Font);
        Color:=Period.Color;
      end;

    If (Components[n] is TBorCheck) then
      With (Components[n] as TBorCheck) do
      Begin
        {CheckColor:=Period.Color;}
      end;

  end; {Loop..}


end;


procedure TNViews.SetFormProperties(SetList  :  Boolean);

Const
  PropTit     :  Array[BOff..BOn] of Str5 = ('Form','List');



Var
  TmpPanel    :  Array[1..3] of TPanel;

  n           :  Byte;

  ResetDefaults,
  BeenChange  :  Boolean;
  ColourCtrl  :  TCtrlColor;

Begin
  ResetDefaults:=BOff;

  For n:=1 to 3 do
  Begin
    TmpPanel[n]:=TPanel.Create(Self);
  end;


  try

    If (SetList) then
    Begin
      With NLOLine do
      Begin
        TmpPanel[1].Font:=Font;
        TmpPanel[1].Color:=Color;

        TmpPanel[2].Font:=NLDPanel.Font;
        TmpPanel[2].Color:=NLDPanel.Color;


        TmpPanel[3].Color:=BarColor;
        TmpPanel[3].Font.Assign(TmpPanel[1].Font);
        TmpPanel[3].Font.Color:=BarTextColor;
      end;


    end
    else
    Begin
      TmpPanel[1].Font:=Period.Font;
      TmpPanel[1].Color:=Period.Color;

      TmpPanel[2].Font:=Panel4.Font;
      TmpPanel[2].Color:=Panel4.Color;
    end;


    ColourCtrl:=TCtrlColor.Create(Self);

    try
      With ColourCtrl do
      Begin
        SetProperties(TmpPanel[1],TmpPanel[2],TmpPanel[3],Ord(SetList),Self.Caption+' '+PropTit[SetList]+' Properties',BeenChange,ResetDefaults);

        NeedCUpdate:=(BeenChange or ResetDefaults);
        FColorsChanged := NeedCUpdate;

        If (BeenChange) and (not ResetDefaults) then
        Begin

          If (SetList) then
          With NLOLine do
          Begin
            Font.Assign(TmpPanel[1].Font);
            Color:=TmpPanel[1].Color;

            NLDPanel.Font.Assign(TmpPanel[2].Font);
            NLDPanel.Color:=TmpPanel[2].Color;


            BarColor:=TmpPanel[3].Color;
            BarTextColor:=TmpPanel[3].Font.Color;

            NLCrPanel.Font.Assign(TmpPanel[2].Font);
            NLCrPanel.Color:=TmpPanel[2].Color;

            NLDrPanel.Font.Assign(TmpPanel[2].Font);
            NLDrPanel.Color:=TmpPanel[2].Color;

            NLOLine.TreeColor   := NLOLine.Font.Color;

          end
          else
          Begin
            Period.Font.Assign(TmpPanel[1].Font);
            Period.Color:=TmpPanel[1].Color;

            SetFieldProperties;
          end;
        end;

      end;

    finally

      ColourCtrl.Free;

    end;

  Finally

    For n:=1 to 3 do
      TmpPanel[n].Free;

  end;

  If (ResetDefaults) then
  Begin
    SetDefault:=BOn;
    Close;
  end;

end;


procedure TNViews.PropFlgClick(Sender: TObject);
begin
  SetFormProperties(N3.Tag=1);
  N3.Tag:=0;
end;


procedure TNViews.StoreCoordFlgClick(Sender: TObject);
begin
  StoreCoord:=Not StoreCoord;
  NeedCUpdate:=BOn;
end;



procedure TNViews.NLOLineMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin

  NLChildUpDate;

end;


procedure TNViews.TxLateChkClick(Sender: TObject);
begin
  If (TxLateChk.Checked) then
    Currency.ItemIndex:=NTxCr
  else
    Currency.ItemIndex:=NCr;
end;


procedure TNViews.HistBtnClick(Sender: TObject);

Var
  ONomRec  :  OutNomType;
  DispRec  :  Boolean;

begin
  DispRec:=BOff;

  With NLOLine do
  If (SelectedItem>0) then
  Begin
    ONomRec:=OutNomType(Items[SelectedItem].Data^);

    If (InHist) then
      DispRec:=((HistForm.NHCtrl.NHNomCode<>ONOmRec.OutNomCode) or (Sender<>nil) or (RefreshHist));


    If ((Not InHist) or (DispRec)) and (Not InHCallBack) and (ONomRec.OutNomType<>CarryFlg) then
      Display_History(ONomRec,(Sender<>nil),((Sender=GraphBtn) or (Sender=Graph1)));

    ReFreshHist:=BOff;
  end;
end;


procedure TNViews.CCDepView1Click(Sender: TObject);
Var
  ONomRec  :  OutNomType;
  DispRec  :  Boolean;

begin
  DispRec:=BOff;
  With NLOLine do
  Begin
    ONomRec:=OutNomType(Items[SelectedItem].Data^);

    If (InCCDepView) then
      DispRec:=((CCDepView.CCDepNHCtrl.NHNomCode<>ONOmRec.OutNomCode) or (Sender<>nil) or (RefreshCCDepView));


    If ((Not InCCDepView) or (DispRec)) and (ONomRec.OutNomType<>CarryFlg) then
      Display_CCDepView(ONomRec,(Sender<>nil));

    RefreshCCDepView:=BOff;
  end;
end;


procedure TNViews.MIEALClick(Sender: TObject);

Var
  RT  :  Integer;

begin
  If (Sender is TMenuItem) then
  With NLOLine do
  If (ITemCount>0) then
  Begin
    RT:=TMenuItem(Sender).Tag;

    If (RT <>0) then
      StopDD:=BOn;

    Case RT of
      1  :  Items[SelectedItem].Expand;
      2  :  Items[SelectedItem].FullExpand;
      3  :  FullExpand;
      4  :  Items[SelectedItem].Collapse;
      5  :  FullCollapse;
    end; {case..}

    StopDD:=BOff;
  end;
end;

procedure TNViews.YearKeyPress(Sender: TObject; var Key: Char);
begin
  If (Not (Key In ['0'..'9',#8])) then
    Key:=#0;
end;


procedure TNViews.PeriodExit(Sender: TObject);
begin
  If (Sender is TSBSComboBox) then
    With TSBSComboBox(Sender) do
    Begin
      If (Sender=Period) or (Sender=ToPeriod) or (Sender=Year) then
      Begin
        //PR: 20/01/2009 Added check for PeriodsAsMonths, otherwise combo text kept resetting to Jan (20080926105937)
        If (IntStr(Text)=0) and (Not GetLocalPr(0).DispPrAsMonths) then
        Begin
          ItemIndeX:=0;
          Text:=Items.Strings[0];
        end;

      end;


      If (Sender=Period)  or (Sender=ToPeriod) then
        Text:=SetPadNo(Text,2);

      If (Sender<>Currency) then {* Validate does this job already *}
        ItemIndex:=Set_TSIndex(Items,ItemIndex,Text);


      If (Sender=Period) then
      Begin
        If (ItemIndex>ToPeriod.ItemIndex) then
          ToPeriod.ItemIndex:=ItemIndex;
      end
      else
        If (Sender=ToPeriod) then
        Begin
          If (ItemIndex<Period.ItemIndex) then
            Period.ItemIndex:=ItemIndex;
        end;

      CurrencyClick(Sender);
    end;
end;

{ ======= Function to find the note a nominal code resides at ======= }

function TNViews.FindNode(NCode  :  LongInt)  :  Integer;

Var
  n          :  Integer;
  FoundOk    :  Boolean;


Begin
  FoundOk:=BOff;

  With NLOLine do
    For n:=1 to ItemCount do
    Begin
      FoundOk:=(OutNomType(Items[n].Data^).OutNomCode=NCode);

      If (FoundOk) then
        Break;
    end;

  If (FoundOk) then
    Result:=n
  else
    Result:=-1;

end;


Procedure TNViews.PlaceNomCode(FindCode  :  Str50);

Const
  Fnum     =  NomViewF;
  Keypath  =  NVViewIdxK;

Var
  FoundOk    :  Boolean;
  KeyS       :  Str255;
  n          :  Integer;
  FoundLong  :  LongInt;

Begin

  FoundOk:=(NomView^.NomViewLine.ViewCode=FindCode);

  If (Not FoundOk) then
  Begin
    FoundOk:=Global_GetMainRec(NomViewF,FullNVCode(NVRCode,NVVSCode,GLViewIdx,FindCode,BOn));
  end;

  FoundLong:=NomView^.NomViewLine.ViewIdx;

  If (FoundOk) then
  Begin
    KeyS:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,NomView^.NomViewLine.ViewCat,BOn);

    If (NomView^.NomViewLine.ViewCat<>0) then
      Status:=Find_Rec(B_GetEq,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);

    While (StatusOk) and (NomView^.NomViewLine.ViewCat<>0) do {* Get to top of this branch *}
    Begin
      KeyS:=FullNVIdx(NVRCode,NVVSCode,GLViewIdx,NomView^.NomViewLine.ViewCat,BOn);

      Status:=Find_Rec(B_GetEq,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);
    end;


    n:=FindNode(NomView^.NomViewLine.ViewIdx);

    If (n<>-1) then
    With NLOLine do
    Begin
      StopDD:=BOn;

      Items[n].FullExpand;

      n:=FindNode(FoundLong);

      If (n<>-1) then
        SelectedItem:=n;

      StopDD:=BOff;
    end;

  end;

end;


Procedure TNViews.FindNomCode;

Const
  Fnum     =  NomViewF;
  Keypath  =  NVViewIdxK;

Var
  InpOk,
  FoundOk  :  Boolean;

  FoundLong
           :  LongInt;

  n,INCode :  Integer;

  SCode    :  String;

  KeyS     :  Str255;


Begin

  SCode:='';

  FoundOk:=BOn;

  Repeat

    InpOk:=InputQuery('Find General Ledger View Code','Please enter the general ledger view code you wish to find',SCode);

    {If (InpOk) then  {* EN571 We need our own getnom view list
      FoundOk:=GetNom(Self,SCode,FoundLong,99);}

  Until (FoundOk) or (Not InpOk);

  If (FoundOk) then
  Begin
    PlaceNomCode(LJVar(UpCaseStr(SCode),VNomKeyLen));
  end;


end;


procedure TNViews.MIFindClick(Sender: TObject);
begin
  FindNomCode;
end;

procedure TNViews.ReconBtnClick(Sender: TObject);
Var
  ONomRec  :  OutNomType;
  DispRec  :  Boolean;
  RMode    :  Byte;

begin
  DispRec:=BOff;

  If (Sender=HistForm) and (Sender<>nil) then
    RMode:=15
  else
  Begin
    RMode:=3;

    With NomView^.NomViewLine do
    IF (Trim(LinkCCDep[BOn])<>'') or (Trim(LinkCCDep[BOff])<>'') then
      RMode:=16;
  end;

  With NLOLine do
  If (SelectedItem>0) then
  Begin
    ONomRec:=OutNomType(Items[SelectedItem].Data^);

    If (InRecon) and (Assigned(ReconForm)) then
    Begin
      DispRec:=(((ReconForm.DDCtrl.NHNomCode<>IntStr(Trim(ONOmRec.OutViewCode))) and (Not ONomRec.HedTotal)) or (Sender<>nil)
                 {or (RefreshRecon)});

    end;


    If ((Not InRecon) or (DispRec)) and (Not Items[SelectedItem].HasItems) and (Not InHCallBack) and (Not ONomRec.HedTotal) and
      (Not StopDD) and (ONomRec.OutNomType<>CarryFlg) then
      Display_Recon(RMode,ONomRec,((Sender<>nil) and (Sender<>HistForm)));

    ReFreshRecon:=BOff;
  end;
end;



procedure TNViews.OptBtnClick(Sender: TObject);
Var
  ListPoint  :  TPoint;

begin
  With TWinControl(Sender) do
  Begin
    ListPoint.X:=1;
    ListPoint.Y:=1;

    ListPoint:=ClientToScreen(ListPoint);

  end;


  PopUpMenu1.PopUp(ListPoint.X,ListPoint.Y);
end;

procedure TNViews.Edit1Click(Sender: TObject);
Var
  RB  :  Byte;

begin
  {$IFDEF DBD}

    If (Debug) then
    Begin
      DebugForm.Add('Help_ID'+inttoStr(TMEnuItem(Sender).HelpContext));
    end;

   {$ENDIF}

  If (Sender is TMenuItem) then
  Begin
    RB:=TMenuItem(Sender).Tag;

    If (NLOLine.SelectedItem>0) or (RB=1) then
      Display_Account(RB,BOn);

  end;
end;


procedure TNViews.Delete1Click(Sender: TObject);
begin
  If (NLOLine.SelectedItem>0) then
    Delete_Branch(NLOLine.SelectedItem,0);

end;



{ == Delete all Records == }

Procedure TNViews.DeleteAllNoms(Level  :  Integer);

Const
  Fnum    =  NomViewF;
  Keypath =  NomCodeK;

Var
  mbRet   :  Word;
  n,
  B_Func  :  Integer;

  KeyChk,
  KeyS    :  Str255;

  ONomRec :  ^OutNomType;

Begin
  NLOLine.FullCollapse;

  OptBtn.Enabled:=BOff;

  LastCursor:=Cursor;

  B_Func:=B_GetNext;

  If (Level=0) then
    mbRet:=CustomDlg(Application.MainForm,'Please Confirm','Clear G/L View','Please confirm you wish to destroy all the G/L Codes for this view.'+#13+#13+
                                          'This is a non recoverable destructive process.  To restore this G/L view you will need to revert to a backup, or add it in manually.' ,mtConfirmation,[mbOk,mbCancel])
  else
    mbRet:=mrOk;

  Try
    If (mbRet=mrOk) then
    Begin
      NLOLine.Enabled:=BOff;

      Begin
        Cursor:=crHourGlass;
        Application.ProcessMessages;


        {DeleteLinks(,NomViewF,0,NVViewIdxK,BOff);}


        With NLOLine do
        If (ItemCount>0) then
        Begin
          For n:=1 to ItemCount do
          Begin
            ONomRec :=Items[n].Data;
            Dispose(ONomRec);
          end;

          KeyChk:=PrimeNVCode(NVRCode,NVVSCode,GLViewIdx,BOn);
          KeyS:=KeyChk;

          Status:=Find_Rec(B_GetGEq,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);

          While (StatusOk) and (CheckKey(KeyChk,KeyS,Length(KeyChk),BOn)) do
          Begin
            If (DeleteMyNomLine(Fnum,Keypath)) then
              B_Func:=B_GetGEq
            else
              B_Func:=B_GetNext;

            Status:=Find_Rec(B_Func,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyS);

          end;

          Clear;

        end;

        NLOLine.Refresh;
      end;

    end;
  Finally
    NLOLine.Enabled:=BOn;
    OptBtn.Enabled:=BOn;
    Cursor:=LastCursor;
  end; {Try..}


end;



procedure TNViews.DeleteAll1Click(Sender: TObject);
begin
  DeleteAllNoms(0);
end;


procedure TNViews.Display_VCAccount(Mode             :  Byte;
                                    ViewIdx          :  Integer;
                                    ChangeFocus      :  Boolean);

Var
  IsCopy  :  Boolean;

Begin


  {$B-}
  If (Mode In [1,7]) or Global_GetMainRec(NomViewF,FullNVIdx(NVRCode,NVCSCode,0,ViewIdx,BOn)) then
  {$B+}
  Begin


    If (ViewRecForm=nil) then
    Begin

      ViewRecForm:=TNomVCtlRec.Create(Self);

    end;

    Try

     IsCopy:=(Mode=7);


     ViewCtrlActive:=BOn;

     With ViewRecForm do
     Begin

       WindowState:=wsNormal;

       If (Mode In [1..10]) and (ChangeFocus) then
         Show;

       If (IsCopy) then
       Begin
         Mode:=1;

       end;

       If (Mode In [1..3]) and (Not ExLocal.InAddEdit) then
       Begin

         If (Mode=3) then
           DeleteNomLine(NomViewF,NVCodeK)
         else
         Begin
           If (Mode=1) then {* Set Parent *}
           Begin
             Level_View:=ViewIdx;

             GenCopy:=IsCopy;

             If (IsCopy) then
               NomView^.ViewCtrl:=MasterVCtrl;
           end;

           EditLine(NomView^,(Mode=2));

         end;
       end;



     end; {With..}


    except

     ViewCtrlActive:=BOff;

     ViewRecForm.Free;

    end;
  end;

end;


procedure TNViews.Edit2Click(Sender: TObject);
Var
  RB        :  Byte;
  cbViewNo  :  Integer;


begin

  If (Sender is TMenuItem) then
  Begin
    RB:=TMenuItem(Sender).Tag;

    If (ViewCB1.ItemIndex>0) then
      cbViewNo:=IntStr(Copy(ViewCB1.Items[ViewCB1.ItemIndex],1,3))
    else
      cbViewNo:=0;

    If (cbViewNo>0) or (RB In [1,7]) then
      Display_VCAccount(RB,cbViewNo,BOn);

  end;
end;



procedure TNViews.ShowC1Click(Sender: TObject);
begin
  FiltCarryF:=Not FiltCarryF;

  NLOLine.SelectedItem:=1;
  AddEditLine(BOff);
end;




Function TNViews.Is_NodeParent(MIdx,SIdx  :  Integer)  :  Boolean;

Var
  PIdx,TIdx  :  Integer;

Begin
  Result:=BOff;

  With NLOLine do
  Begin
    TIdx:=SIdx;

    Repeat
      PIdx:=Items[TIdx].Parent.Index;

      Result:=(PIdx=MIdx);

      TIdx:=PIdx;

    Until (Result) or (PIdx<=0);

  end;


end;

Function TNViews.Place_InOrder(MIdx,SIdx  :  Integer;
                            Var UseAdd     :  Boolean)  :  Integer;

Var
  ONomRec    :  ^OutNomType;
  PIdx,TIdx  :  Integer;
  N,
  NNC        :  LongInt;
  FoundOk    :  Boolean;

Begin
  FoundOk:=BOff;  UseAdd:=BOff;

  Result:=SIdx;

  With NLOLine do
  Begin
    ONomRec:=Items[MIdx].Data;

    NNC:=ONomRec^.OutNomCode;

    PIdx:=Items[SIdx].Parent.Index;


    If (PIdx>0) then
    Begin
      TIdx:=Items[PIdx].GetFirstChild;

      While (TIdx>0) and (Not FoundOk) do
      Begin
        ONomRec:=Items[TIdx].Data;

        With ONomRec^ do
          FoundOk:=((OutNomCode>NNC) or (HedTotal));


        If (Not FoundOk) then
          TIdx:=Items[PIdx].GetNextChild(TIdx);

      end;
    end
    else
    Begin
      For n:=1 to ItemCount do
      Begin
        PIdx:=Items[n].Parent.Index;

        If (PIdx<=0) then {* its a level 0 item *}
        Begin
          TIdx:=n;

          ONomRec:=Items[TIdx].Data;

          With ONomRec^ do
            FoundOk:=(OutNomCode>NNC);

          If (FoundOk) then
            Break;
        end;
      end;

      If (Not FoundOk) then
        Result:=TIdx;
    end;

  end; {With..}

  If (FoundOk) then
    Result:=TIdx
  else
  Begin
    UseAdd:=BOn;
  end;

end;

{$IFDEF POST}  
  Function TNViews.Confirm_Move(MIdx,SIdx  :  Integer)  :  Boolean;

  Var
    MoveRec  :  MoveRepPtr;
    mbRet    :  Word;
    PIdx     :  Integer;

    ONomRec  :  ^OutNomType;

    WMsg     :  AnsiString;

  Begin
    New(MoveRec);


    Result:=BOff;

    try
      FillChar(MoveRec^,Sizeof(MoveRec^),0);


      With MoveRec^, NLOLine do
      Begin
        ONomRec:=Items[MIdx].Data;

        MoveMode:=50;

        With ONomRec^ do
        Begin
          MoveNCode:=OBOMAddr;
          WasNCat:=OutNomCat;
          NewNType:=OutNomType;
          WasViewNo:=GLViewIdx;

          If Global_GetMainRec(NomViewF,FullNVCode(NVRCode,NVVSCode,GLViewIdx,OutViewCode,BOn)) then
          With NomView^.NomViewLine do
          Begin
            WasNCat:=ViewCat;
            MoveNomView:=NomView^;
          end;
        end;

        PIdx:=Items[SIdx].Parent.Index;

        If (PIdx>0) then
        Begin
          ONomRec:=Items[PIdx].Data;

          With ONomRec^ do
          Begin
            NewNCat:=OBOMAddr;

            If Global_GetMainRec(NomViewF,FullNVCode(NVRCode,NVVSCode,GLViewIdx,OutViewCode,BOn)) then
            Begin
              GrpNomView:=NomView^;
            end;
          end;
        end
        else
        With GrpNomView.NomViewLine do
        Begin
          Desc:='G/L View Root';
        end;
        Set_BackThreadMVisible(BOn);

        WMsg:=ConCat('You are about to move ',dbFormatName(MoveNomView.NomViewLine.ViewCode,MoveNomView.NomViewLine.Desc),' into ',
              dbFormatName(GrpNomView.NomViewLine.ViewCode,GrpNomView.NomViewLine.Desc),#13);
        WMsg:=ConCat(WMsg,'The heading totals affected will be blanked out until the move is complete.',#13);
        WMsg:=ConCat(WMsg,'This operation should be performed with all other users out of this G/L view.',#13,
              'Do you wish to continue?');

        mbRet:=CustomDlg(Application.MainForm,'Please Confirm','G/L View Move',WMsg,mtConfirmation,[mbYes,mbNo]);

        Set_BackThreadMVisible(BOff);

        Result:=(mbRet=mrOk);

        If (Result) then
          Result:=AddMove2Thread(Self,MoveRec);

        {If (Result) then
          Update_TotalMove(FrmPIdx,ToPIdx,WasNCat,NewNCat,BOn);}

      end; {With..}
    finally
      Dispose(MoveRec);

     end;
  end;


  {procedure TNomview.RefreshMove; Version which was called from move thread, not used

  Var
    N,Depth,
    PIdx1,PIdx2  :  Integer;

    Loop         :  Boolean;

    PNode        :  TSBSOutLNode;


  Begin
    With NLOLine do
    Begin
      If (MoveItemParent>0) and (Items[MoveItemParent].Parent.Index>0) then
        PIdx1:=Items[MoveItemParent].TopItem
      else
        PIdx1:=MoveItemParent;

      If (Items[MoveToItem].Parent.Index>0) then
        PIdx2:=Items[MoveToItem].TopItem
      else
        PIdx2:=MoveToItem;

      Loop:=BOff;
      N:=PIdx1;
      Repeat
        If (N>0) then
        Begin
          PNode:=Items[n];

          PNode.Collapse;

          Delete_OutLines(n,BOff);

          Depth:=Pred(PNode.Level);

          Drill_OutLines(Depth,Depth+2,n);

          PNode.Expand;
        end;

        Loop:=Not Loop;

        N:=PIdx2;

      Until (Not Loop);
    end;

    SetChildMove;

    If (Assigned(ChildNom)) and (InChild) then
      ChildNom.RefreshMove;
  end;}


  procedure TNViews.RefreshMove(WhichNode  :  Integer);

  Var
    N,Depth,
    PIdx1        :  Integer;

    PNode        :  TSBSOutLNode;


  Begin
    If (WhichNode>0) then
    With NLOLine do
    Begin
      If (Items[WhichNode].Parent.Index>0) then
        PIdx1:=Items[WhichNode].TopItem
      else
        PIdx1:=WhichNode;

      N:=PIdx1;
      If (N>0) then
      Begin
        PNode:=Items[n];

        PNode.Collapse;

        Delete_OutLines(n,BOff);

        Depth:=1;

        Drill_OutLines(Depth,Depth+2,n);

        PNode.Expand;

      end;

    end;

    If (Assigned(ChildNom)) and (InChild) then
      ChildNom.RefreshMove(WhichNode);
  end;



Procedure TNViews.Alter_Total(Const PIdx1 :  Integer;
                               Const NC    :  LongInt;
                               Const HideValues
                                           :  Boolean);

Var
  ONomRec    :  ^OutNomType;
  NIdx,PIdx  :  Integer;
  FoundOk,
  AbortOn    :  Boolean;

Begin
  FoundOk:=BOff;  AbortOn:=BOff;

  With NLOLine do
  If (PIdx1<=ItemCount) then
  Begin
    BeginUpdate;

    PIdx:=PIdx1;

    Repeat

      ONomRec:=Items[PIdx].Data;

      If (ONomRec^.OutNomCode=NC) or (PIdx<>PIdx1) then {* Still same nom code or down a level! *}
      Begin
        ONomRec^.HideValue:=HideValues;

        FoundOk:=BOff;

        NIdx:=Items[PIdx].GetLastChild;

        Repeat
          If (NIdx>0) then
          Begin
            ONomRec:=Items[NIdx].Data;

            FoundOk:=ONomRec^.HedTotal;

            If (FoundOk) then
              ONomRec^.HideValue:=HideValues
            else
              NIdx:=Items[PIdx].GetPrevChild(NIdx);

          end;

        Until (NIdx<1) or (FoundOk);

        PIdx:=Items[PIdx].Parent.Index;
      end
      else
        AbortOn:=BOn;

    Until (PIdx<1) or (AbortOn);

    EndUpDate;
  end; {With..}

end;

Procedure TNViews.HideAll_Totals(Const HideValues  :  Boolean);

Var
  ONomRec    :  ^OutNomType;
  NIdx,PIdx  :  Integer;
  FoundOk,
  AbortOn    :  Boolean;

Begin
  FoundOk:=BOff;  AbortOn:=BOff;

  With NLOLine do
  If (ItemCount>0) then
  Begin
    BeginUpdate;

    PIdx:=0; NIdx:=Pred(ItemCount);

    Repeat
      Inc(PIdx);

      ONomRec:=Items[PIdx].Data;

      ONomRec^.HideValue:=HideValues;

      FoundOk:=BOff;

    Until (PIdx>=NIdx) or (AbortOn);

    EndUpDate;
  end; {With..}

   If (Assigned(ChildNom)) and (InChild) then
    ChildNom.HideAll_Totals(HideValues);
end;

Function TNViews.FindXONC(Const NC1  :  LongInt)  :  Integer;

Var
  n          :  Integer;
  ONomRec    :  ^OutNomType;


Begin
  Result:=-1;

  With NLOLine do
  Begin
    For n:=1 to ItemCount do
    Begin
      ONomRec:=Items[n].Data;

      If (ONomRec^.OutNomCode=NC1) then
      Begin
        Result:=n;
        Break;
      end;
    end;
  end;

end;

Procedure TNViews.Update_TotalMove(Const NC1,NC2     :  LongInt;
                                    Const CalcMode    :  Boolean);

Var
  PIdx1, PIdx2  :  Integer;
  NC3           :  LongInt;
  ONomRec       :  ^OutNomType;


Begin
  NC3:=-1;  PIdx1:=-1; PIdx2:=-1;

  If (NC1>0) then
  Begin
    PIdx1:=FindxONC(NC1);

  end;

  If (PIdx1>0) then
    Alter_Total(PIdx1,NC1,CalcMode);

  If (NC2>0) and (NC2<>NC1) then
  Begin
    PIdx2:=FindxONC(NC2);

  end;

  If (PIdx2>0) then
    Alter_Total(PIdx2,NC2,CalcMode);

  {* Auto blank p&l b/f if present *}

  PIdx2:=FindxONC(Syss.NomCtrlCodes[ProfitBF]);

  If (PIdx2>0) then
  Begin
    PIdx2:=NLOLine.Items[PIdx2].Parent.Index;

    If (PIdx2>0) then
    Begin
      ONomRec:=NLOLine.Items[PIdx2].Data;
      NC3:=ONomRec^.OutNomCode;
    end;
  end;

  If (PIdx2>0) then
    Alter_Total(PIdx2,NC3,CalcMode);

  If (Assigned(ChildNom)) and (InChild) then
    ChildNom.Update_TotalMove(NC1,NC2,CalcMode);
end;


Procedure TNViews.Update_Total4Thread(RecAddr  :  LongInt;
                                       CalcMode :  Boolean);

Var
  MoveRec  :  MoveRepPtr;

Begin
  MoveRec:=Pointer(RecAddr);

  If (Assigned(MoveRec)) then
  With MoveRec^ do
  Begin
    Update_TotalMove(WasNCat,NewNCat,CalcMode);

    If (Not CalcMode) then
      Dispose(MoveRec);

    
  end
  else
  Begin {Hide all, could be coming from Check G/L}
    HideAll_Totals(CalcMode);

    If (Not CalcMode) then
      Update_ViewCtrl;
  end;

  Cursor:=LastCursor;

end;

{$ENDIF}



procedure TNViews.SetChildMove;

Begin
  If (Assigned(ChildNom)) and (InChild) then
  Begin
    ChildNom.MoveItem:=MoveItem;
    ChildNom.MoveToItem:=MoveToItem;
    ChildNom.MoveItemParent:=MoveItemParent;
    ChildNom.MoveInsMode:=MoveInsMode;
    ChildNom.MoveMode:=BOn;

  end;
end;


procedure TNViews.Move1Click(Sender: TObject);


Var
  MMode    :  TSBSAttachMode;
  ONomRec  :  ^OutNomType;
  LastText :  Str255;

  SIdx,
  Depth,
  NIdx     :  Integer;

  Ok2Cont,
  UseAdd   :  Boolean;

  BMoveMode:  Byte;

begin
  UseAdd:=BOff;  Ok2Cont:=BOff;


  If (Sender=Move1) or (Sender=Move2) then
    BMoveMode:=Ord(MoveMode)
  else
    If (Sender=CanlMove1) then
      BMoveMode:=3
    else
      BMoveMode:=4;

  With NLOLine do
  Begin
    If (SelectedItem>0) or (BMoveMode In [3,4]) then
    Case BMoveMode of
      0    :  Begin
                 MoveItem:=SelectedItem;
                 MoveItemParent:=Items[MoveItem].Parent.Index;
                 MoveMode:=Not MoveMode;
                 LastCursor:=Cursor;
                 Cursor:=crDrag;
               end;

      1     :  Begin
                 If (Items[SelectedItem].Parent.Index=Items[MoveItem].Parent.Index) or (Is_NodeParent(MoveItem,SelectedItem)) then
                 Begin
                   Set_BackThreadMVisible(BOn);

                   ShowMessage('It is not possible to move within the same heading!');

                   Set_BackThreadMVisible(BOff);

                 end
                 else
                   If (SelectedItem=MoveItem) or (SelectedItem<=0) then
                   Begin
                     Set_BackThreadMVisible(BOn);

                     ShowMessage('It is not possible to move to the heading specified!');

                     Set_BackThreadMVisible(BOff);

                   end
                   else
                   Begin

                     Try
                       ONomRec:=Items[MoveItem].Data;
                       LastText:=Items[MoveItem].Text;

                       Items[MoveItem].Collapse;

                       SIdx:=Place_InOrder(MoveItem,SelectedItem,UseAdd);

                       If (UseAdd) then {Add/Insert}
                         MMode:=TSBSAttachMode(0)
                       else
                         MMode:=TSBSAttachMode(2);

                       NIdx:=Items[SIdx].Parent.Index;

                       {$IFDEF POST}
                         Ok2Cont:=Confirm_Move(MoveItem,SIdx);
                       {$ELSE}
                         Ok2Cont:=BOff;
                       {$ENDIF}

                       If (Ok2Cont) then
                       Begin
                         MoveToItem:=SIdx;
                         MoveInsMode:=MMode;

                         Items[MoveItem].Collapse;

                         {* Changes here need to be reflected in the 4: section for the child control *}
                         BeginUpdate;

                         Items[MoveItem].MoveTo(MoveToItem,MoveInsMode);
                       end;

                     Finally
                       Begin
                         If (Ok2Cont) then
                         Begin
                           EndUpDate;

                           SetChildMove;

                           If (InChild) and (Assigned(ChildNom)) then
                           Begin
                             ChildNom.Move1Click(Nil);
                           end;

                           MoveMode:=Not MoveMode;
                           Cursor:=LastCursor;

                         end;
                       end;
                     end;
                   end;
               end;
      3    :  Begin
                 MoveItem:=-1;
                 MoveMode:=BOff;
                 Cursor:=LastCursor;
                 Move1.Enabled:=BOn;
              end;

      4    :  If (MoveMode) then {For Child }
              Begin
                Try
                  Items[MoveItem].Collapse;

                  BeginUpdate;

                  Items[MoveItem].MoveTo(MoveToItem,MoveInsMode);


                finally
                  Begin
                    EndUpDate;

                    SetChildMove;

                    If (InChild) and (Assigned(ChildNom)) then
                    Begin
                      {ChildNom.LastCursor:=LastCursor;}
                      ChildNom.Move1Click(Nil);
                    end;

                    MoveMode:=Not MoveMode;
                    {Move1.Enabled:=BOn;
                    Cursor:=LastCursor;}
                  end;
                end;
              end;

    end; {Case..}
  end; {With..}

  If (Not IAmChild) then
  Begin
    CanlMove1.Visible:=MoveMode;
    Move1.Visible:=Not MoveMode;
    Move2.Visible:=Not Move1.Visible;
  end;


end;

procedure TNViews.Check1Click(Sender: TObject);
begin
  If (Sender is TMenuItem) then
  Begin

  {$IFDEF POST}

    LastCursor:=Cursor;
    Cursor:=crHourGlass;
    If (TMenuItem(Sender).Tag=0) then
      Nom.CarryF:=GLViewIdx
    else
      Nom.CarryF:=0; {Its all..}

    AddCheckNom2Thread(Self,Nom,JobRec^,6);
  {$ENDIF}
  end; {If..}
end;



procedure TNViews.Show1Click(Sender: TObject);
begin
  FiltNType:=Not FiltNType;

  Show1.Checked:=FiltNType;

  Update_OutLines(NomViewF,NVViewIdxK);
end;

procedure TNViews.ShowG1Click(Sender: TObject);
begin
  ShowGLCode:=Not ShowGLCode;

  ShowG1.Checked:=ShowGLCode;

  Update_OutLines(NomViewF,NVViewIdxK);
end;


procedure TNViews.Commit1Click(Sender: TObject);
begin
  {$IFDEF SOP}
     If (Sender is TMenuItem) then
     Begin
       If (CommitMode<>TMenuItem(Sender).Tag) then
       Begin
         CommitMode:=TMenuItem(Sender).Tag;
         TMenuItem(Sender).Checked:=BOn;
         Update_OutLines(NomViewF,NVViewIdxK);
         CreateCaption;
       end;

     end;
  {$ENDIF}
end;


procedure TNViews.Show_CCDepViewHistory(ShowGraph  :  Boolean;
                                         ViewMode   :  Byte);

Var
  OldCCDepCode  :  Str10;
  OldCCDepMode  :  Boolean;
  ONomRec       :  OutNomType;


Begin
  If (InCCDepView) and (Not InCCDepVLink) then
  With CCDepView do
  Begin
    InCCDepVLink:=BOn;

    OldCCDepMode:=CCNomMode;

    OldCCDepCode:=CCNomFilt[CCNomMode];

    Try
      CCNomMode:=ThisCCMode;
      CCNomFilt[CCNomMode]:=ThisCCCode;

      With Self.NLOLine do
        ONomRec:=OutNomType(Items[SelectedItem].Data^);

      Case ViewMode of
        0  :  Display_History(ONomRec,BOff,ShowGraph);
        1  :  With Self.NLOLine do
                If (Not StopDD) and (Not Items[SelectedItem].HasItems) then
                  Display_Recon(16,ONomRec,BOff);
      end; {Case..}

    finally
      CCNomMode:=OldCCDepMode;
      CCNomFilt[CCNomMode]:=OldCCDepCode;
      InCCDepVLink:=BOff;

    end; {try..}
  end;

end;


Function TNViews.Being_Posted(Const LMode  :  Byte)  :  Boolean;

Const
  LockSet  :  Set of Byte = [1..4,9,21..24];
  Fnum     =  MiscF;
  Keypath  =  MIK;


Var
  n     :  Byte;
  KeyStr:  Str255;
  LAddr :  LongInt;


Begin
  Result:=BOff;

  For n:=1 to 30 do
    If (n In LockSet) then
    Begin
      KeyStr:=FullPLockKey(PostUCode,PostLCode,n);

      Status:=Find_Rec(B_GetEq+B_MultNWLock,F[Fnum],Fnum,RecPtr[Fnum]^,KeyPath,KeyStr);

      Result:=(Status=85) or (Status=84);

      If (StatusOK) then {We need to unlock}
      Begin
        Status:=GetPos(F[Fnum],Fnum,LAddr);  {* Preserve DocPosn *}

        Status:=UnLockMultiSing(F[Fnum],Fnum,LAddr);

        If (Status<>81) then
          Report_BError(Fnum,Status);

      end;

      If (Result) then
        Break;
    end;


end;



procedure TNViews.ObjectClone2Click(Sender: TObject);
begin
  ObjectClone2.Checked:=Not ObjectClone2.Checked;

  {$B-}
  If (Not ObjectClone2.Checked) or (ParentNom.Currency.ItemIndex=GrandPNom.Currency.ItemIndex) then
  {$B+}
  Begin
    {* Alter Caption, disable period *}

    UseYTD:=Not UseYTD; {* Force a re-draw through *}

    NLOLine.Refresh;

    If (ObjectClone2.Checked) then
    Begin
      CreateDiffCaption;

      NLCrPanel.Caption:='Difference  ';
      NLDrPanel.Caption:='% Difference  ';

    end
    else
    Begin
      CreateCaption;

      NLCrPanel.Caption:='Debit  ';
      NLDrPanel.Caption:='Credit  ';

    end;
  end
  else
    CustomDlg(Application.MainForm,'Note','ObjectClone Difference','In order to calculate the difference, the parent and grandparent currencies must match.',mtConfirmation,[mbOK]);

  Period.Enabled:=Not ObjectClone2.Checked;

  ToPeriod.Enabled:=Period.Enabled;
  Year.Enabled:=Period.Enabled;
  YTDChk.Enabled:=Period.Enabled;
  Currency.Enabled:=Period.Enabled;
  NomSplitBtn.Enabled:=Period.Enabled;
  ObjectClone1.Enabled:=Period.Enabled;
end;



procedure TNViews.Copy1Click(Sender: TObject);
Var
  FromGL,
  InpOk,
  FoundOk  :  Boolean;

  n,
  ViewLong,
  FoundCat,
  FoundLong
           :  LongInt;

  SCode    :  String;

  ONomRec    :  ^OutNomType;


begin
  FoundOk:=BOff; FoundLong:=0; ViewLong:=0; FoundCat:=0;

  FromGL:=(Sender=Show1);

  If (Not FromGL) then
    Repeat

      InpOk:=InputQuery('Copy General Ledger Structure','Please enter the general ledger code of the heading whose contents you wish to copy into this view. (Leave blank for all)',SCode);

      FoundOk:=(Scode='');

      If (InpOk) and (Not FoundOk) then
        FoundOk:=GetNom(Self,SCode,FoundLong,1);

    Until (FoundOk) or (Not InpOk)
  else
  Begin
    FoundOk:=BOn;
    FoundLong:=CopyFromGLNo;

    // MH 12/03/2012 v6.10 ABSEXCH-11907: Uninitialised variable in this path causing code below to intermittantly fail
    InpOk := True;
  end;

  If (FoundOk) and (InpOk) then
  With NLOLine do
    Begin

      LastCursor:=Application.MainForm.Cursor;
      Application.MainForm.Cursor:=crHourGlass;

      If (SelectedItem<>0) then
      Begin
        ONomRec:=Items[SelectedItem].Data;

        If (ONomRec^.HedTotal) then
          ViewLong:=ONomRec^.OutNomCode
        else
          ViewLong:=ONomRec^.OutNomCat;

      end;

      If (FoundLong<>0) then
      Begin
        FoundCat:=Nom.Cat;

        {$B-}
        If (Not FromGL) and (MessageDlg('Do you wish to copy '+dbFormatName(Form_Int(Nom.NomCode,0),Nom.Desc)+' into this G/L view as well as its contents?',
                       mtConfirmation,[mbYes,mbNo],0)=mrNo) then
        {$B+}
        Begin
          FoundCat:=FoundLong;
          FoundLong:=0;
        end;
      end;

      Copy_StdNom(ExLocal,GLViewIdx,FoundCat,0,ViewLong,FoundLong,MasterVCtrl);

      For n:=1 to ItemCount do
      Begin
        ONomRec :=Items[n].Data;
        Dispose(ONomRec);
      end;

      Clear;

      Add_OutLines(0,2,0,0,NomViewF,NVCatK);

      If (FoundLong<>0) then
        PlaceNomCode(LJVar(Form_Int(FoundLong,0),VNomKeyLen));

      Application.MainForm.Cursor:=LastCursor;
    end;
end;

procedure TNViews.Update_ViewCtrl;

Begin
  MasterVCtrl:=Get_GLViewCtrlRec(GLViewIdx);

  If (MasterVCtrl.LoadedOk) then
    With MasterVCtrl do
    Begin
      If (Not DefUseF6) then
      Begin
        Period.ItemIndex:=Pred(DefPeriod);
        ToPeriod.ItemIndex:=Pred(DefPeriodTo);

        Year.ItemIndex:=Pred(DefYear);

        YTDChk.Checked:=DefYTD;

      end
      else
      Begin
        Period.ItemIndex:=Pred(Syss.CPr);

        Year.ItemIndex:=Pred(Syss.CYr);

        YTDChk.Checked:=BOn;

      end;

      If (IncludeBudgetCols <> IncBudget) Then
      Begin
        IncludeBudgetCols := IncBudget;
        NLOLine.ShowValCol := IfThen(IncludeBudgetCols, 5, 2);
        FormResize(Self);
      End; // If (IncludeBudgetCols <> IncBudget)

      {$IFDEF MC_On}
        Currency.ItemIndex:=DefCurr;
        TxLateChk.Checked:=DefCurrTx;
      {$ENDIF}

      I2PrYrF.InitPeriod(LastPeriod,LastYear,BOn,BOn);
      I1TransDateF.DateValue:=LastUpdate;

      NCCF.Text:=LinkCCDep[BOn]+' / '+LinkCCDep[BOff];

      NOpoF.Text:=Trim(LastOpo)+'.                         '+Form_Int(LastPRunNo,0);

      NIICf.Checked:=IncCommit;

      NPr:=Succ(Period.ItemIndex);

      NPrTo:=Succ(ToPeriod.ItemIndex);

      NYr:=TxlateYrVal(StrToInt(Year.Text),BOn);

      {$IFDEF MC_On}
        NCr:=Currency.ItemIndex;
      {$ELSE}
        NCr:=0;
      {$ENDIF}



      If (LastPRunNo<>Pred(GetNextCount(RUN,BOff,BOff,0))) and (LastPRunNo<>0) then
      Begin
        Label85.Font.Color:=clRed;

      end
      else
      Begin
        Label85.Font.Color:=clBlack;

      end;

      Label84.Font.Color:=Label85.Font.Color;
      NIICF.Font.Color:=Label85.Font.Color;
      Label87.Font.Color:=Label85.Font.Color;

    end;

  CreateCaption;
end;

procedure TNViews.Change_View(NewIdx  :  LongInt);

Begin
  With NLOLine do
  Begin
    {BeginUpdate;}

    If (ItemCount>0) then
    Repeat
      Delete_OutLines(1,BOn);
    Until (ItemCount<=0);

    NLOLine.Refresh;

    {EndUpdate;}

    GLViewIdx:=NewIdx;


    Update_ViewCtrl;

    Add_OutLines(0,2,0,0,NomViewF,NVCatK);


  end;
end;



procedure TNViews.ViewFExit(Sender: TObject);
begin
  If (Sender is TCurrencyEdit) then
    With TCurrencyEdit(Sender) do
      If (Value>0.0) then
        Change_View(Trunc(Value));
end;



procedure TNViews.ViewCB1Change(Sender: TObject);

Var
  cbViewNo  :  Integer;
begin
  If (ViewCB1.ItemIndex>0) then
  Begin
    cbViewNo:=IntStr(Copy(ViewCB1.Items[ViewCB1.ItemIndex],1,3));

    If (cbViewNo>0) and (cbViewNo<>GLViewIdx) then
      Change_View(cbViewNo);
  end;
end;


Initialization

LastSelView:=0;

end.
