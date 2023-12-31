unit Main_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,dm_u, Vcl.StdCtrls, Vcl.ExtCtrls,jpeg,
  Vcl.ComCtrls, mmsystem, StudentHome_u, EducatorHome_u, Quiz_u, clsStudent, clsEducator, clsQuiz,
  Vcl.Buttons, data.db, VCL.DBGrids, vcl.Grids;

type
  TfrmMain = class(TForm)
    ledUsername: TLabeledEdit;
    ledPassword: TLabeledEdit;
    btnLogin: TButton;
    btnSignUp: TButton;
    ledNewPassword: TLabeledEdit;
    ledNewUsername: TLabeledEdit;
    lblSignUp: TLabel;
    lblLogin: TLabel;
    ledConfirmPass: TLabeledEdit;
    pnlLogin: TPanel;
    pnlSignUp: TPanel;
    btnNoAcc: TButton;
    btnHaveAcc: TButton;
    pnlSignUpInfo: TPanel;
    lblSignUpInfo: TLabel;
    redSignUpInfo: TRichEdit;
    btbQuit: TBitBtn;
    lblQuizzle: TLabel;
    procedure btnNoAccClick(Sender: TObject);
    procedure btnHaveAccClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    //my functions
    function validLogin(sUser,sPass: string):boolean;
    procedure btnSignUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function GetQuizItem(iIndex:integer;sString:string):string;
    procedure colorColumns(dbGrid:TDBGrid;iColCount:integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  //global vars
  iEducatorID, iStudentID : integer;
  objStudent : TStudent;
  objEducator: TEducator;
  objQuiz: TQuiz;
const
//my colors
colDarkGreen = $556644;
colLightGreen = $889966;
colDark = $443322;
colLight = $FFDDCC;
colGray = $775544;

implementation
{$R *.dfm}


procedure TfrmMain.FormShow(Sender: TObject);
begin
iStudentID:= 0;
iEducatorID:=0;
{PlaySound(pchar('startup.wav'), 0, SND_ASYNC or SND_FILENAME);}
end;

function TfrmMain.GetQuizItem(iIndex: integer; sString: string): string;
var //function to extract desired item from the textfile string with delims
iPos1, iPos2, i, iDelimCount: integer;
sSection : string;
begin
iPos1:= 0;
iPos2:= 0;
iDelimCount:= 0;
for i := 1 to length(sString) do//will count delimiters and find the 2 surrounding the string part I want
  begin
    if sString[i]='~' then
      begin
        inc(iDelimCount);

        if iDelimCount=(iIndex-1) then //the delimiter before iIndex'th item
          begin
            iPos1:= i;            //if have found N-th delimiter, assign its Pos
          end else if iDelimCount = iIndex then
          begin
            iPos2:= i;             //if have found the delimiter after iPos1
          end;
      end;
  end;

sSection:= Copy(sString,iPos1+1,iPos2-iPos1-1);//copies from after delim until right before next delim
Result:= sSection;
end;

procedure TfrmMain.btnHaveAccClick(Sender: TObject);
begin
pnlSignUp.Visible:= False;
pnlSignUpInfo.Visible:=false;
pnlLogin.Visible:= True;
btnHaveAcc.Visible:= False;
btnNoAcc.Visible:= True;
//CLEAR FIELDS
ledNewPassword.Clear;
ledNewUsername.Clear;
ledConfirmPass.Clear;
ledUsername.SetFocus;
end;

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
//if user is trying to log in, open respective form after confirming
  //validity of login using validLogin() func
if validLogin(ledUsername.Text,ledPassword.Text) then
  begin
    if iStudentID <> 0 then  //studentId will be 0 if an educator has logged in
      begin
        tbStudents.Locate('stuID',iStudentID,[]);
        objStudent:= TStudent.Create(iStudentID,tbStudents['stuName']);
        self.Hide;
        frmStudentHome.Show;

      end else//any other situation educator id will not be 0, so no need to state that
      begin
        //create educator object, before show form, so obj is loaded when FormShow runs on eduform
        tbEducators.Locate('eID',iEducatorID,[]);
        objEducator:= TEducator.Create(iEducatorID,tbEducators['eName'],tbEducators['eSubject']);
        self.hide;
        frmEducatorHome.Show;
      end;
  end else showmessage('Login Failed: Please enter valid login details!');
end;

procedure TfrmMain.btnNoAccClick(Sender: TObject);
begin     //130 325
{pnlSignUp.Top:= 200;
pnlSignUp.Left:= 485;}  //aligns the signup panel to be centered in screen
pnlLogin.Visible:= False;
pnlSignUp.Visible:= True;
pnlSignUpInfo.Visible:=true;
btnNoAcc.Visible:= False;
btnHaveAcc.Visible:= True;
//CLEAR FIELDS
ledPassword.Clear;
ledUsername.Clear;
ledNewUsername.SetFocus;
end;

procedure TfrmMain.btnSignUpClick(Sender: TObject);
var
bStrongPass: boolean;
sPassword : string;
i, iCapCount,iDigCount, iSpecCount, iSpaceCount: Integer;
begin
bStrongPass:= false;
sPassword:= ledNewPassword.Text;
iCapCount:= 0;
iDigCount:= 0;
iSpecCount:= 0;
iSpaceCount:= 0;
//check if password is strong, follows certain rules, length etc
if (length(sPassword) >= 8) AND (length(sPassword) <=20) then
begin
for i := 1 to length(sPassword) do
  begin
    if sPassword[i] in ['A'..'Z'] then inc(iCapCount);//has a capital
    if sPassword[i] in ['0'..'9'] then inc(iDigCount);//has a digit
    if sPassword[i] in ['!'..'/',':'..'@','['..'`','{'..'~'] then inc(iSpecCount);//all special character ranges
    if sPassword[i] = ' ' then inc(iSpaceCount);
  end; //end for
  if (iCapCount > 0) AND (iSpecCount > 0) AND (iDigCount > 0) AND (iSpaceCount = 0) then
  begin //code  will only run if all necessary chars are present and no spaces
    bStrongPass:= true;
  end else //small inner if end
  begin
    showmessage('Password does not comply with requisites!');
    exit;
  end;
end else  //outer if end
begin
  showmessage('Password not within length bounds: 8-20');
  exit;
end;

//adds new student to database
if (sPassword = ledConfirmPass.Text) AND bStrongPass then
begin
with dm do
  begin
    tbStudents.Insert;
    tbStudents['stuName']:= ledNewUsername.Text;
    tbStudents['stuPassword']:= ledNewPassword.Text;
    tbStudents.Post;
  end;       //end with
  showmessage('Your account has successfully been created.');
  pnlLogin.Visible:= True;
  pnlSignUp.Visible:= False;
  pnlSignUpInfo.Visible:=false;
  btnNoAcc.Visible:= True;
  btnHaveAcc.Visible:= False;
end else showmessage('Passwords don''t match'); //end if
end;

procedure TfrmMain.colorColumns(dbGrid:TDBGrid;iColCount: integer);
var//because loading data in runtime, need to code in the colors for titles
i:integer;//so I wrote a neat function to do it!
begin
for i := 0 to iColCount-1 do dbGrid.Columns[i].Title.Font.Color:=clWhite;
end;

function TfrmMain.validLogin(sUser, sPass: string): boolean;
begin
//checks if user that is trying to login is an educator or student and confirms validity
Result:= false;
with dm do
  begin
    tbStudents.First;
    while NOT tbStudents.Eof do
      begin
        if sUser = tbStudents['stuName'] then
          begin
            if sPass = tbStudents['stuPassword'] then
            begin
              iStudentID:= tbStudents['stuID']; //reaching this means valid user is student
              Result:= true;
              //exit; efficient?
            end;
          end;
        tbStudents.Next;
      end;   //while
  end;//with

//if educator
with dm do
  begin
    tbEducators.First;
    while NOT tbEducators.Eof do
      begin
        if sUser = tbEducators['eName'] then
        begin
          if sPass = tbEducators['ePassword'] then
          begin
            iEducatorID:= tbEducators['eID'];
            Result:= true;
          end;
        end;
        tbEducators.Next;
      end; //while
  end;            //with
end;

end.
