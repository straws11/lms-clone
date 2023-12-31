unit dm_u;

interface

uses
  System.SysUtils, System.Classes, db, adodb;

type
  Tdm = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;
  conPAT: TADOConnection;

//Declare Queries
  Query : TADOQuery;
  dscQuery: TDataSource;
  Query2 : TADOQuery;
  dscQuery2: TDataSource;

//Table Declaration
  tbAttempts : TADOTable;
  dscAttempts: TDataSource;

  tbEducators : TADOTable;
  dscEducators: TDataSource;

  tbEnrollments : TADOTable;
  dscEnrollments: TDataSource;

  tbQuizzes : TADOTable;
  dscQuizzes: TDataSource;

  tbStudents : TADOTable;
  dscStudents: TDataSource;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  conPAT := TADOConnection.Create(dm);

//Table Connection Instantiation
  tbAttempts := TADOTable.Create(dm);
  dscAttempts := TDataSource.Create(dm);

  tbEducators := TADOTable.Create(dm);
  dscEducators := TDataSource.Create(dm);

  tbEnrollments := TADOTable.Create(dm);
  dscEnrollments := TDataSource.Create(dm);

  tbQuizzes := TADOTable.Create(dm);
  dscQuizzes := TDataSource.Create(dm);

  tbStudents := TADOTable.Create(dm);
  dscStudents := TDataSource.Create(dm);

//Query Connection Instantiation
  Query := TADOQuery.Create(dm);
  dscQuery := TDataSource.Create(dm);
  Query2:= TADOQuery.Create(dm);
  dscQuery2:= TDataSource.Create(dm);

  { STAP 3 Manipulate }

//keep start
  conPAT.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    ExtractFilePath(ParamStr(0)) + 'PAT.mdb' + '; Persist Security Info=False';
  conPAT.LoginPrompt := False;     //mdb Access 2000

  conPAT.Open;
//keep end

//dylan code start
  tbAttempts.Active:= False;
  tbAttempts.Connection:= conPAT;
  tbAttempts.TableName:= 'tblAttempts';
  tbAttempts.Active:= True;
  tbAttempts.Open;
  dscAttempts.DataSet:= tbAttempts;

  tbEducators.Active:= False;
  tbEducators.Connection:= conPAT;
  tbEducators.TableName:= 'tblEducators';
  tbEducators.Active:= True;
  tbEducators.Open;
  dscEducators.DataSet:= tbEducators;

  tbEnrollments.Active:= False;
  tbEnrollments.Connection:= conPAT;
  tbEnrollments.TableName:= 'tblEnrollments';
  tbEnrollments.Active:= True;
  tbEnrollments.Open;
  dscEnrollments.DataSet:= tbEnrollments;

  tbQuizzes.Active:= False;
  tbQuizzes.Connection:= conPAT;
  tbQuizzes.TableName:= 'tblQuizzes';
  tbQuizzes.Active:= True;
  tbQuizzes.Open;
  dscQuizzes.DataSet:= tbQuizzes;

  tbStudents.Active:= False;
  tbStudents.Connection:= conPAT;
  tbStudents.TableName:= 'tblStudents';
  tbStudents.Active:= True;
  tbStudents.Open;
  dscStudents.DataSet:= tbStudents;
//dylan code end
//dylan code start
  Query.Connection:= conPat;
  dscQuery.DataSet:= Query;
  Query2.Connection:= conPat;
  dscQuery2.DataSet:= Query2;
//dylan code end
end;

end.
