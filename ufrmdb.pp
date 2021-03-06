unit ufrmdb;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ActnList, StdCtrls, sqldb, db;

type

  { TfrmDb }

  TfrmDb = class(TForm)
    acNew: TAction;
    acDelete: TAction;
    acSave: TAction;
    acCancel: TAction;
    acEdit: TAction;
    acRefresh: TAction;
    acFirst: TAction;
    acPrior: TAction;
    acNext: TAction;
    acLast: TAction;
    acCloseForm: TAction;
    ActionsDb: TActionList;
    btnFirst: TButton;
    btnPrior: TButton;
    btnNext: TButton;
    btnLast: TButton;
    btnNew: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    btnEdit: TButton;
    btnRefresh: TButton;
    btnClose: TButton;
    lblFormCaption: TLabel;
    panelBtns: TPanel;
    procedure acCancelExecute(Sender: TObject);
    procedure acCloseFormExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acFirstExecute(Sender: TObject);
    procedure acLastExecute(Sender: TObject);
    procedure acNewExecute(Sender: TObject);
    procedure acNextExecute(Sender: TObject);
    procedure acPriorExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
    //Morar: run procedure to create new record(insert)
    procedure doNewRec; virtual;
    //Morar: run procedure to remove existent record(delete)
    procedure doRemoveRec; virtual;
    //Morar: run procedure to save record(post)
    procedure doSaveRec; virtual;
    //Morar: run procedure to cancel all changes(cancel update)
    procedure doCancelRec; virtual;
    //Morar: run procedure to edit existent record(edit)
    procedure doEditRec; virtual;
    //Morar: run procedure to jump to the first record(dbState-browse)
    procedure doFirstRec; virtual;
    //Morar: run procedure to jump to prior record(dbState-browse)
    procedure doPriorRec; virtual;
    //Morar: run procedure to jump to next record(dbState-browse)
    procedure doNextRec; virtual;
    //Morar: run procedure to jump to the last record(dbState-browse)
    procedure doLastRec; virtual;
    //Morar: run procedure to refresh record(dbState-browse)
    procedure doRefresh; virtual;
    //Morar: run procedure to reopen all relevant data sets
    procedure doReopenDataSets; virtual;
    //Morar: Close base-form
    procedure doCloseForm; virtual;
    // on events
    procedure onNewRec(var dataSet : TSQLQuery);
    procedure onRemoveRec(var dataSet : TSQLQuery);
    procedure onSaveRec(var dataSet : TSQLQuery);
    procedure onCancelRec(var dataSet : TSQLQuery);
    procedure onEditRec(var dataSet : TSQLQuery);
    procedure onFirstRec(var dataSet : TSQLQuery);
    procedure onPriorRec(var dataSet : TSQLQuery);
    procedure onNextRec(var dataSet : TSQLQuery);
    procedure onLastRec(var dataSet : TSQLQuery);
    procedure onRefresh(var dataSet : TSQLQuery; const keyName : String);
    procedure onReopenDataSet(var dataSet : TSQLQuery);
    procedure onCheckDataSets(var dataSet : TSQLQuery);
  end;

var
  frmDb: TfrmDb;

implementation
uses
  udecide;
{$R *.lfm}

{ TfrmDb }

procedure TfrmDb.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // free and nil
  CloseAction:= caFree;
  self:= nil;
end;

procedure TfrmDb.acNewExecute(Sender: TObject);
begin
  doNewRec;
end;

procedure TfrmDb.acNextExecute(Sender: TObject);
begin
  doNextRec;
end;

procedure TfrmDb.acPriorExecute(Sender: TObject);
begin
  doPriorRec;
end;

procedure TfrmDb.acRefreshExecute(Sender: TObject);
begin
  //do no refresh, open all relevant data sets!
  doReopenDataSets;
end;

procedure TfrmDb.acSaveExecute(Sender: TObject);
begin
  doSaveRec;
end;

procedure TfrmDb.acDeleteExecute(Sender: TObject);
begin
  doRemoveRec;
end;

procedure TfrmDb.acEditExecute(Sender: TObject);
begin
  doEditRec;
end;

procedure TfrmDb.acFirstExecute(Sender: TObject);
begin
  doFirstRec;
end;

procedure TfrmDb.acLastExecute(Sender: TObject);
begin
  doLastRec;
end;

procedure TfrmDb.acCancelExecute(Sender: TObject);
begin
  doCancelRec;
end;

procedure TfrmDb.acCloseFormExecute(Sender: TObject);
begin
  doCloseForm;
end;

procedure TfrmDb.doNewRec;
begin
  // override
end;

procedure TfrmDb.doRemoveRec;
begin
  // override
end;

procedure TfrmDb.doSaveRec;
begin
  // override
end;

procedure TfrmDb.doCancelRec;
begin
  // override
end;

procedure TfrmDb.doEditRec;
begin
  // override
end;

procedure TfrmDb.doFirstRec;
begin
  // override
end;

procedure TfrmDb.doPriorRec;
begin
  // override
end;

procedure TfrmDb.doNextRec;
begin
  // override
end;

procedure TfrmDb.doLastRec;
begin
  // override
end;

procedure TfrmDb.doRefresh;
begin
  // override
end;

procedure TfrmDb.doReopenDataSets;
begin
  // override
end;

procedure TfrmDb.doCloseForm;
begin
  // override
end;

procedure TfrmDb.onNewRec(var dataSet: TSQLQuery);
begin
  //new record
  dataSet.Insert;
end;

procedure TfrmDb.onRemoveRec(var dataSet: TSQLQuery);
const
  DECIDE_MSG : String = 'Are you sure?';
var
  newDialog : TdlgDecide;
begin
  {can't be empty}
  if(dataSet.IsEmpty) then
    Exit;
  {check state, save all before}
  if(dataSet.State in [dsEdit, dsInsert]) then
    Exit;
  {confirm}
  newDialog:= TdlgDecide.Create(nil);
  newDialog.lblQuestion.Caption:= DECIDE_MSG;
  //show modal
  if(newDialog.ShowModal = mrOK) then
    dataSet.Delete;
  {free dialog}
  newDialog.Free;
end;

procedure TfrmDb.onSaveRec(var dataSet: TSQLQuery);
begin
  {check state and save}
  if(dataSet.State in [dsEdit, dsInsert]) then
    dataSet.Post;
end;

procedure TfrmDb.onCancelRec(var dataSet: TSQLQuery);
begin
  {check state and cancel updates}
  if(dataSet.State in [dsEdit, dsInsert]) then
    dataSet.Cancel;
end;

procedure TfrmDb.onEditRec(var dataSet: TSQLQuery);
begin
  {we need some records}
  if(dataSet.IsEmpty) then
    Exit;
  {check state}
  if(dataSet.State in [dsBrowse]) then
    dataSet.Edit;
end;

procedure TfrmDb.onFirstRec(var dataSet: TSQLQuery);
begin
  {can't be empty}
  if(not dataSet.IsEmpty) then
    if(not dataSet.BOF) then
      dataSet.First;
end;

procedure TfrmDb.onPriorRec(var dataSet: TSQLQuery);
begin
  {can't be empty}
  if(not dataSet.IsEmpty) then
    if(not dataSet.BOF) then
      dataSet.Prior;
end;

procedure TfrmDb.onNextRec(var dataSet: TSQLQuery);
begin
  {can't be empty}
  if(not dataSet.IsEmpty) then
    if(not dataSet.EOF) then
      dataSet.Next;
end;

procedure TfrmDb.onLastRec(var dataSet: TSQLQuery);
begin
  {can't be empty}
  if(not dataSet.IsEmpty) then
    if(not dataSet.EOF) then
      dataSet.Last;
end;

procedure TfrmDb.onRefresh(var dataSet : TSQLQuery; const keyName : String);
var
  currId : Integer = 0;
begin
  //set cursor(show progress
  Screen.Cursor:= crSQLWait;
  //save position
  currId:= TSQLQuery(dataSet).FieldByName(keyName).AsInteger;
  //disable controls before refresh
  TSQLQuery(dataSet).DisableControls;
  try
    // do not close(use refresh)
    TSQLQuery(dataSet).Refresh;
    TSQLQuery(dataSet).Locate(keyName, currId, []);
  finally
    TSQLQuery(dataSet).EnableControls;
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmDb.onReopenDataSet(var dataSet: TSQLQuery);
begin
  //close and open again
  Screen.Cursor:= crSQLWait;
  TSQLQuery(dataSet).DisableControls;
  try
    TSQLQuery(dataSet).Close;
    TSQLQuery(dataSet).Open;
  finally
    Screen.Cursor:= crDefault;
    TSQLQuery(dataSet).EnableControls;
  end;
end;

procedure TfrmDb.onCheckDataSets(var dataSet: TSQLQuery);
const
  DECIDE_MSG : String = 'Do you want to save changes?';
var
  newDialog : TdlgDecide;
begin
  {check states(changes)}
  if(dataSet.State in [dsEdit, dsInsert]) then
    begin
      {confirm}
      newDialog:= TdlgDecide.Create(nil);
      newDialog.lblQuestion.Caption:= DECIDE_MSG;
      //show modal
      if(newDialog.ShowModal = mrOK) then
        dataSet.Post
      else
        dataSet.Cancel;
      {free dialog}
      newDialog.Free;
    end;
end;

end.

