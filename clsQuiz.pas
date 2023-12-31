unit clsQuiz;

interface
uses system.sysutils, dm_u;
type
TQuiz = class(TObject)
  private
    fName:string;
    fCreatorID:integer;
    fQuizID:integer;
    fScore:integer;
    fQCount:integer;
    fFilePath:string;
    arrQnA: array[1..5,1..15] of string;//why did i make this 15? question limit?
  public
    function getName:string;
    function getCreatorID:integer;
    function getScore:integer;
    function getQuizID:integer;
    function getQCount:integer;
    function getItem(iCol,iRow:integer):string;
    procedure UpdateScore(iScore:integer);
    procedure MyChangeDir(ChangeToDir:string);


    constructor Create(pName:string;pCreatorID:integer;pQuizID:integer;pFilePath:string);

end;
implementation
uses Main_u;
{ TQuiz }


constructor TQuiz.Create(pName:string;pCreatorID,pQuizID:integer;pFilePath:string);
var
tFile :textfile;
sLine,sItem:string;
i:integer;
begin
fName:=pName;
fCreatorID:=pCreatorID;
fQuizID:=pQuizID;
fScore:=0;
fQCount:=0;
fFilePath:=pFilePath;
//reads file contents into arrQnA
MyChangeDir(Copy(fFilePath,1,Pos('\',fFilePath)));
i:=Pos('\',fFilePath);//using i because it's not in use anyway
if NOT FileExists(Copy(fFilePath,i+1,length(fFilePath)-i)) then exit;
AssignFile(tFile,Copy(fFilePath,i+1,length(fFilePath)-i));
Reset(tFile);
ReadLn(tFile,sLine);//Quiz Name is first line, don't need to use it
while NOT EOF(tFile) do
  begin //reads all questions and their data into 2d array
    ReadLn(tFile,sLine);
    inc(fQCount);
    for i := 1 to 5 do
        begin
          sItem:=frmMain.GetQuizItem(i,sLine);
          arrQnA[i,fQCount]:=sItem;
        end;
  end;
CloseFile(tFile);
end;

function TQuiz.getCreatorID: integer;
begin
with dm do
  begin
    tbEducators.Locate('eID',fCreatorID,[]);
    Result:= tbEducators['eID'];
  end;
end;

function TQuiz.getItem(iCol, iRow: integer): string;
begin
Result:=arrQnA[iCol,iRow];
end;

function TQuiz.getName: string;
begin
Result:=fName;
end;

function TQuiz.getQCount: integer;
begin
Result:=fQCount;
end;

function TQuiz.getQuizID: integer;
begin
Result:=fQuizID;
end;

function TQuiz.getScore: integer;
begin
Result:=fScore;
end;

procedure TQuiz.MyChangeDir(ChangeToDir: string);
var
sDir:string;
begin
sDir:=Copy(GetCurrentDir,1,pos('Debug',GetCurrentDir)+5);
ChDir(sDir+'\'+ChangeToDir);
end;

procedure TQuiz.UpdateScore(iScore:integer);
begin
fScore:= fScore+ iScore;
end;

end.
