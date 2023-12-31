unit StudentHome_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, dm_u, Vcl.Mask, Vcl.DBCtrls,
  clsQuiz, Quiz_u;

type
  TfrmStudentHome = class(TForm)
    clbCourses: TCheckListBox;
    btnSaveEnrollments: TButton;
    pnlEnrollments: TPanel;
    dbgPastAttempts: TDBGrid;
    btnEditEnrollments: TButton;
    lblPastAttempts: TLabel;
    dbgAvailableQuizzes: TDBGrid;
    btnStartQuiz: TButton;
    lblAvailableQuizzes: TLabel;
    btnLogOut: TButton;
    lblEditEnroll: TLabel;
    dbeQuizID: TDBEdit;
    dbeQuizName: TDBEdit;
    dbeEduID: TDBEdit;
    dbeSubject: TDBEdit;
    btnFilterSubject: TButton;
    btnClearFilter: TButton;
    lblStudentName: TLabel;
    procedure btnSaveEnrollmentsClick(Sender: TObject);
    procedure btnEditEnrollmentsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStartQuizClick(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgAvailableQuizzesCellClick(Column: TColumn);
    procedure dbgPastAttemptsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgAvailableQuizzesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnFilterSubjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStudentHome: TfrmStudentHome;
  sSQLFilter:string;
implementation
uses Main_u;
{$R *.dfm}

procedure TfrmStudentHome.btnFilterSubjectClick(Sender: TObject);
begin
if dbeSubject.Text='' then
  begin
  showmessage('Select a record first');
  exit;
  end;

sSQLFilter:= ' AND (eSubject='+QuotedStr(dbeSubject.Text)+')';
FormShow(Sender);
end;

procedure TfrmStudentHome.btnLogOutClick(Sender: TObject);
var
i:integer;
begin
self.Hide;
frmMain.Show;
iStudentID:= 0; //allows login code to work, this data is useless until next login when it'll be overwritten
//not sure why iStudentID is a var anymore, check Main's login and Validation function
objStudent.Destroy;
dbeQuizID.DataField:='';
dbeQuizName.DataField:='';
dbeEduID.DataField:='';
dbeSubject.DataField:='';
//preps for new login
frmMain.ledUsername.Clear;
frmMain.ledPassword.Clear;
frmMain.ledUsername.SetFocus;
sSQLFilter:='';
for i := 1 to clbCourses.Items.Count do clbCourses.Checked[i-1]:=false;
end;

procedure TfrmStudentHome.btnSaveEnrollmentsClick(Sender: TObject);
var
i, iChecked:integer;
arrSubjects: array[1..7] of string;
begin
for i := 1 to length(arrSubjects) do arrSubjects[i]:= ''; //clean array
iChecked:= 0;
for i := 1 to clbCourses.Items.Count do
begin
  if (clbCourses.Checked[i-1]) AND (iChecked<7) then
  begin
    inc(iChecked);
    //showmessage(clbCourses.Items[i-1]);//debug
    arrSubjects[iChecked]:= clbCourses.Items[i-1];
  end else if iChecked=7 then
  begin
    showmessage('You have selected too many subjects. Maximum allowed is 7.');
    exit;
  end;
end; //end for

objStudent.UpdateEnrollments(arrSubjects);

pnlEnrollments.Visible:= False;
frmStudentHome.FormShow(Sender);//so my DB grids update
btnStartQuiz.Enabled:=true;
end;

procedure TfrmStudentHome.btnStartQuizClick(Sender: TObject);
var
sFilePath:string;
begin
//grab quiz info and open form with quiz fancy stuff
if dbeQuizID.Text='' then
  begin
    showmessage('Select a quiz first');//if no item is selected
    exit;
  end;

with dm do
begin
  tbQuizzes.Open;
  tbQuizzes.Locate('qID',StrToInt(dbeQuizID.Text),[]);
  sFilePath:=tbQuizzes['qFilePath'];
  tbQuizzes.Close;
end;
//create quiz object
objQuiz:=TQuiz.Create(dbeQuizName.Text,StrToInt(dbeEduID.Text),
          StrToInt(dbeQuizId.Text),sFilePath);
self.hide;
frmQuiz.Show;
end;

procedure TfrmStudentHome.dbgAvailableQuizzesCellClick(Column: TColumn);
begin
dbeQuizID.DataField:='qID';
dbeQuizName.DataField:='qQuizName';
dbeEduID.DataField:='qEducator';
dbeSubject.DataField:='eSubject';
end;

procedure TfrmStudentHome.dbgAvailableQuizzesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
dbgAvailableQuizzes.Canvas.Brush.Color:=$7ecf5b;//fill color
dbgAvailableQuizzes.Canvas.Font.Color:=clBlack;//text color, overrides column color white
dbgAvailableQuizzes.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmStudentHome.dbgPastAttemptsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
dbgPastAttempts.Canvas.Brush.Color:=$7ecf5b;//fill color
dbgPastAttempts.Canvas.Font.Color:=clBlack;//text color, overrides column color white
dbgPastAttempts.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TfrmStudentHome.btnClearFilterClick(Sender: TObject);
begin
sSQLFilter:='';
FormShow(Sender);
end;

procedure TfrmStudentHome.btnEditEnrollmentsClick(Sender: TObject);
var
arrSubjects: TArray<string>;
  i, j: Integer;
  bFound :  boolean;
begin
btnStartQuiz.Enabled:=false;
pnlEnrollments.Visible:= True;

arrSubjects:=objStudent.GetSubjects;//bc using TArray<T>, i can assign one array to another, not possible with array of T
 //debug start
 //for i := 0 to 6 do showmessage(arrSubjects[i] +'a');
 //debug end
for i := 1 to clbCourses.Items.Count do
  begin
    j:= 0;
    bFound:= false;
    repeat
      inc(j);
      if clbCourses.Items[i-1] = arrSubjects[j-1] then bFound:= true;
    until (j=length(arrSubjects)) OR (bFound);
    if bFound then
    begin
      clbCourses.Checked[i-1]:= True;
      //showmessage(arrSubjects[j-1]);//debug
    end;
  end;//end for

end;

procedure TfrmStudentHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmStudentHome.FormCreate(Sender: TObject);
begin
sSQLFilter:='';//need here so formshow refresh doesn't clear it
end;

procedure TfrmStudentHome.FormShow(Sender: TObject);
begin
//user name label
lblStudentName.Caption:='Welcome back, '+objStudent.GetName;
lblStudentName.Left:=1000-lblStudentName.GetTextLen*7;


//past attempts sql
dbgPastAttempts.DataSource:= dscQuery;
Query.Close;
Query.SQL.Clear;
Query.SQL.Add('SELECT qQuizName, aScore, aFeedback FROM tblQuizzes, tblAttempts ');
Query.SQL.Add('WHERE (aUser='+ IntToStr(objStudent.GetID) +') AND (qID = aQuiz);');
Query.ExecSQL;
Query.Open;
//user friendly column headers
dbgPastAttempts.Columns[0].Title.Caption:= 'Quiz';
dbgPastAttempts.Columns[1].Title.Caption:= 'Score Achieved';
dbgPastAttempts.Columns[2].Title.Caption:= 'Feedback';
dbgPastAttempts.Columns[2].Width:=175;
dbgPastAttempts.Columns[0].Width:=220;
frmMain.colorColumns(dbgPastAttempts,3);//own function, colors titles!

//available quizzes sql
dbgAvailableQuizzes.DataSource:= dscQuery2;
Query2.Close;
Query2.SQL.Clear;
Query2.SQL.Add('SELECT qID, qEducator, qQuizName, eSubject, eName FROM tblQuizzes, tblEnrollments, tblEducators ');
Query2.SQL.Add('WHERE (qEducator=enEducator) AND (eID=qEducator) AND ');
Query2.SQL.Add('(enStudent = '+IntToStr(objStudent.GetID)+')'+sSQLFilter+' ORDER BY eSubject DESC;');
Query2.Open;

//hide id column and column used for calculation
dbgAvailableQuizzes.Columns[0].Visible:=false;
dbgAvailableQuizzes.Columns[1].Visible:=false;
//user friendly column headers
dbgAvailableQuizzes.Columns[2].Title.Caption:='Quiz';
dbgAvailableQuizzes.Columns[3].Title.Caption:='Subject';
dbgAvailableQuizzes.Columns[4].Title.Caption:='Educator';
dbgAvailableQuizzes.Columns[2].Width:=220;
dbgAvailableQuizzes.Columns[3].Width:=220;
frmMain.colorColumns(dbgAvailableQuizzes,4);

dbeQuizName.DataSource:=dscQuery2;
dbeQuizId.DataSource:=dscQuery2;
dbeEduID.DataSource:=dscQuery2;
dbeSubject.DataSource:=dscQuery2;
end;

end.
