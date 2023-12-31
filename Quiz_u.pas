unit Quiz_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, math, dm_u, Vcl.ExtCtrls, jpeg;

type
  TfrmQuiz = class(TForm)
    lblTitle: TLabel;
    btnAns1: TButton;
    btnAns2: TButton;
    btnAns3: TButton;
    btnAns4: TButton;
    lblQuestion: TLabel;
    lblScore: TLabel;
    btnQuitQuiz: TButton;
    imgResult: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAns1Click(Sender: TObject);
    procedure btnAns2Click(Sender: TObject);
    procedure btnAns3Click(Sender: TObject);
    procedure btnAns4Click(Sender: TObject);

    //mine
    procedure placeAnswers;
    procedure Answer(sAns:string);
    procedure btnQuitQuizClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuiz: TfrmQuiz;
  iProgress:integer;
  bFinished, bCorrectAns :boolean;

implementation
uses Main_u, StudentHome_u; //by placing here, omits circular reference issue
{$R *.dfm}

procedure TfrmQuiz.Answer(sAns: string);
var
iGrade:integer;
begin //check if answered val (from btn click) is correct AND loads next q's
if sAns = objQuiz.getItem(2,iProgress) then
  begin 
    objQuiz.UpdateScore(1);
    lblScore.Caption:='SCORE: '+ IntToStr(objQuiz.getScore) + '/' + IntToStr(iProgress);
    //fancy stuff like notif on side/color background??
    imgResult.Picture.LoadFromFile('correct.jpg');
  end else
  begin
    lblScore.Caption:=IntToStr(objQuiz.getScore) + '/' + IntToStr(iProgress);
    //fancy stuff but bad
    imgResult.Picture.LoadFromFile('wrong.jpg');
  end;
//loads appropriate image


if NOT bFinished then placeAnswers() else//load next q if there are more
  begin//if the quiz is finished do this
    //clear stuff
    //take back to student home
    //ADDING QUIZ ATTEMPT TO DB
    with dm do
    begin
      iGrade:= round((objQuiz.getScore /objQuiz.getQCount)*100);
      tbAttempts.Open;
      tbAttempts.Insert;
      tbAttempts['aQuiz']:=objQuiz.getQuizID;
      tbAttempts['aUser']:=objStudent.GetID;
      tbAttempts['aScore']:=iGrade;//calcs a percentage score
      tbAttempts.Post;
      tbAttempts.Close;
      //showmessage('saved quiz');
    end;//end with
    self.hide;
    frmStudentHome.Show;
    imgResult.Picture.Graphic:=nil;
    showmessage('You have completed your quiz with '+
                lblScore.Caption+' which is a grade of '+IntToStr(iGrade)+'%');

  end;
end;

procedure TfrmQuiz.btnAns1Click(Sender: TObject);
begin
Answer(btnAns1.Caption);
end;

procedure TfrmQuiz.btnAns2Click(Sender: TObject);
begin
Answer(btnAns2.Caption);
end;

procedure TfrmQuiz.btnAns3Click(Sender: TObject);
begin
Answer(btnAns3.Caption);
end;

procedure TfrmQuiz.btnAns4Click(Sender: TObject);
begin
Answer(btnAns4.Caption);
end;

procedure TfrmQuiz.btnQuitQuizClick(Sender: TObject);
begin
self.Hide;
frmStudentHome.Show;
objQuiz.Destroy;
imgResult.Picture.Graphic:=nil;
end;

procedure TfrmQuiz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmQuiz.FormShow(Sender: TObject);
begin
lblScore.Caption:= 'SCORE: '+ IntToStr(objQuiz.getScore);
lblTitle.Caption:= objQuiz.getName;
iProgress:=0;
bFinished:=false;
bCorrectAns:=false;
placeAnswers;
ChDir(Copy(GetCurrentDir,1,pos('Debug',GetCurrentDir)+5));//this is so my images are loaded from the right place
end;

procedure TfrmQuiz.placeAnswers;
var
iRandomPos,iAns,i:integer;
sRandomPlacer:string;
begin //shuffle and put answers in buttons
inc(iProgress);//used to know which question they're on
lblQuestion.Caption:=objQuiz.getItem(1,iProgress);
//smart algorithm that uses a string to keep track of where I can place answers
sRandomPlacer:='1234';
for i:=4 downto 1 do
  begin
  iRandomPos:=randomrange(1,i+1);
  iAns:=StrToInt(sRandomPlacer[iRandomPos]);
  Delete(sRandomPlacer,iRandomPos,1);

    case i of
    1: btnAns1.Caption:=objQuiz.getItem(iAns+1,iProgress);
    2: btnAns2.Caption:=objQuiz.getItem(iAns+1,iProgress);
    3: btnAns3.Caption:=objQuiz.getItem(iAns+1,iProgress);
    4: btnAns4.Caption:=objQuiz.getItem(iAns+1,iProgress);
    end;

  end;
if objQuiz.getQCount=iProgress then bFinished:=true;//if i've loaded last question, am done

end;


end.
