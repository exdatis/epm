program epm;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, poweredby, umain, udm, uabout
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='ExDatis';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  //Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.

