unit uabout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, LCLIntf;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    Bevel1: TBevel;
    btnOk: TButton;
    DividerBevel1: TDividerBevel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label6MouseEnter(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.lfm}

{ TfrmAbout }

procedure TfrmAbout.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
  self:= nil;
end;

procedure TfrmAbout.btnOkClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmAbout.Image1Click(Sender: TObject);
const
  LAZARUS_IDE: String = 'http://www.lazarus-ide.org/';
begin
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(LAZARUS_IDE);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmAbout.Label2Click(Sender: TObject);
const
  MAIL_TO : String = 'mailto:exdatis@yahoo.com';
begin
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(MAIL_TO);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmAbout.Label2MouseEnter(Sender: TObject);
begin
  Label2.Font.Color:= clNavy;
  Label2.Font.Underline:= True;
end;

procedure TfrmAbout.Label2MouseLeave(Sender: TObject);
begin
  Label2.Font.Color:= clOlive;
  Label2.Font.Underline:= False;
end;

procedure TfrmAbout.Label5Click(Sender: TObject);
const
  EPM_HOME : String = 'https://github.com/exdatis/epm';
begin
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(EPM_HOME);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmAbout.Label5MouseEnter(Sender: TObject);
begin
  Label5.Font.Color:= clNavy;
  Label5.Font.Underline:= True;
end;

procedure TfrmAbout.Label5MouseLeave(Sender: TObject);
begin
  Label5.Font.Color:= clOlive;
  Label5.Font.Underline:= False;
end;

procedure TfrmAbout.Label6Click(Sender: TObject);
const
  LGPL_LICENSE : String = 'http://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License';
begin
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(LGPL_LICENSE);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmAbout.Label6MouseEnter(Sender: TObject);
begin
  Label6.Font.Color:= clNavy;
  Label6.Font.Underline:= True;
end;

procedure TfrmAbout.Label6MouseLeave(Sender: TObject);
begin
  Label6.Font.Color:= clOlive;
  Label6.Font.Underline:= False;
end;

end.

