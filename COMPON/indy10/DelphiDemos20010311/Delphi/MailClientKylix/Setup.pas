unit Setup;

interface

uses
   {$IFDEF Linux}
   QForms, QDialogs, QStdCtrls, QButtons, QComCtrls,
   {$ELSE}
   Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ComCtrls,
   {$ENDIF}
   SysUtils, Classes, QControls;

type
   TfmSetup = class(TForm)
      BitBtn1: TBitBtn;
    pcSetup: TPageControl;
    tsPop3: TTabSheet;
    tsSmtp: TTabSheet;
    Label1: TLabel;
    POPServer: TEdit;
    Label2: TLabel;
    POPPort: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblAuthenticationType: TLabel;
    cboAuthType: TComboBox;
    lbAccount: TLabel;
    edtAccount: TEdit;
    lbPassword: TLabel;
    edtPassword: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    SMTPServer: TEdit;
    SMTPPort: TEdit;
    Email: TEdit;
    Account: TEdit;
    Password: TEdit;
    procedure bbtnAuthenticationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
    { Private declarations }
   public
    { Public declarations }
   end;

var
   fmSetup: TfmSetup;

implementation

{$IFDEF Linux}{$R *.xfm}{$ELSE}{$R *.DFM}{$ENDIF}

uses Main, smtpauth, inifiles;

procedure TfmSetup.bbtnAuthenticationClick(Sender: TObject);
begin
   frmSMTPAuthentication.ShowModal;
end;

procedure TfmSetup.FormCreate(Sender: TObject);
begin
  POPServer.Text := Pop3ServerName;
  POPPort.Text := IntToStr(Pop3ServerPort);
  Account.Text := Pop3ServerUser;
  Password.Text := Pop3ServerPassword;

  SMTPServer.Text := SmtpServerName;
  SMTPPort.Text := IntToStr(SmtpServerPort);
  edtAccount.Text := SmtpServerUser;
  edtPassword.Text := SmtpServerPassword;
  cboAuthType.ItemIndex := SmtpAuthType;

  Email.Text := UserEmail;

end;

procedure TfmSetup.BitBtn1Click(Sender: TObject);
var
  MailIni: TIniFile;
begin
  MailIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Mail.ini');
  with MailIni do begin
    WriteString('Pop3', 'ServerName', POPServer.Text);
    Pop3ServerName := POPServer.Text;

    WriteString('Pop3', 'ServerPort', POPPort.Text);
    Pop3ServerPort := StrToIntDef(POPPort.Text, 110);

    WriteString('Pop3', 'ServerUser', Account.Text);
    Pop3ServerUser := Account.Text;

    WriteString('Pop3', 'ServerPassword', Password.Text);
    Pop3ServerPassword := Password.Text;

    WriteString('Smtp', 'ServerName', SMTPServer.Text);
    SmtpServerName := SMTPServer.Text;

    WriteString('Smtp', 'ServerPort', SMTPPort.Text);
    SmtpServerPort := StrToIntDef(SMTPPort.Text, 110);

    WriteString('Smtp', 'ServerUser', edtAccount.Text);
    SmtpServerUser := edtAccount.Text;

    WriteString('Smtp', 'ServerPassword', edtPassword.Text);
    SmtpServerPassword := edtPassword.Text;

    WriteString('Email', 'PersonalEmail', Email.Text);
    UserEmail := Email.Text;

    WriteInteger('Smtp', 'SMTPAuthenticationType', cboAuthType.ItemIndex);
    SmtpAuthType := cboAuthType.ItemIndex;

  end;
  MailIni.Free;
end;

procedure TfmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

