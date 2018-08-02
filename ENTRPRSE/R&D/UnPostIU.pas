unit UnPostIU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,BTSupU3,
  Repinp1u, ExtCtrls, SBSPanel, StdCtrls, TEditVal, bkgroup, Animate,
  BorBtns, Mask;

type
  TUnpostInp = class(TRepInpMsg)
    Label84: Label8;
    I1PrYrF: TEditPeriod;
    CBRTF: TBorCheck;
    CBCalcTaxF: TBorCheck;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkCP1BtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CRepParam  :    PUnPostPtr;

  public
    { Public declarations }
  end;


procedure UnPostIt(AOwner  :  TComponent);


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Implementation

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

Uses
  ETStrU,
  ETDateU,
  ETMiscU,
  GlobVar,
  VarConst,
  SysU1,
  UnPostU,
  BTSupU2,
  BTSupU1,

  oProcessLock;

{$R *.DFM}

procedure TUnpostInp.FormCreate(Sender: TObject);
Var
  LPr,LYr :  Byte;

begin
  inherited;

  ClientHeight:=175;
  ClientWidth:=299;

  New(CRepParam);

  try
    FillChar(CRepParam^,Sizeof(CRepParam^),0);
  except
    Dispose(CRepParam);
    CRepParam:=nil;
  end;

  LPr:=GetLocalPr(0).CPr;
  LYr:=GetLocalPr(0).CYr;

  I1PrYrF.InitPeriod(LPr,LYr,BOn,BOn);

  SetLastValues;
end;

procedure TUnpostInp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  If (Assigned(CRepParam)) then
    Dispose(CRepParam);

  //PR: 15/05/2017 ABSEXCH-18683 v2017 R1 Release process lock if cancelled
  if ModalResult <> mrOK then
    SendMessage(Application.MainForm.Handle, WM_LOCKEDPROCESSFINISHED, Ord(plUnpost), 0);
end;



procedure TUnpostInp.OkCP1BtnClick(Sender: TObject);
begin
  If (Sender=OkCP1Btn) then
  Begin
    OKCP1Btn.Enabled:=BOff;

    With CRepParam^ do
    Begin
      I1PrYrF.InitPeriod(UnpostPr,UnpostYr,BOff,BOff);

      UnResetVAT:=CBRTF.Checked;
      RecalcVATPr:=CBCalcTaxF.Checked;

      AddPUnpost2Thread(Owner,CRepParam^);
    end;
  end;

  inherited;

end;




procedure TUnpostInp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {}
  Inherited;
end;

procedure TUnpostInp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  {}
  Inherited;
end;


procedure UnPostIt(AOwner  :  TComponent);



Var
  RepInpMsg1  :  TUnpostInp;

Begin
  RepInpMsg1:=TUnpostInp.Create(AOwner);

  try
  except
    RepInpMsg1.Free;
  end;

end;


end.
