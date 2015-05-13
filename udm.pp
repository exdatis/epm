unit udm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db, FileUtil;

type

  { Tdm }

  Tdm = class(TDataModule)
    dsPrj: TDataSource;
    dbh: TIBConnection;
    qGeneral: TSQLQuery;
    qPrj: TSQLQuery;
    qPrjP_CODE: TStringField;
    qPrjP_DESC: TMemoField;
    qPrjP_ID: TLongintField;
    qPrjP_NAME: TStringField;
    qPrjP_SUBJECT: TStringField;
    sqlt: TSQLTransaction;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.lfm}

end.

