unit clsStudent;

interface

uses system.Sysutils, dm_u;

type
TStudent = Class(TObject)
private
fID : integer;
fUsername : string;
arrEnrolled : array[1..7] of integer;

//functions used within class only
function SubjToID(sSubject:string):integer;
function IDToSubj(iID:integer):string;

public
//accessors
function GetID:integer;
function GetName:string;
function GetSubjects: TArray<String>;
//other
procedure UpdateEnrollments(arrNewSubjects:array of string);


constructor Create(pID:integer; pUsername:string);
end;
implementation

{ TStudent }

constructor TStudent.Create(pID: integer; pUsername: string);
var
i: integer;
//sSubject : string;
begin
fID:= pID;
fUsername:= pUsername;

//read from enrollments table and append subject names to array
for i := 1 to length(arrEnrolled) do arrEnrolled[i]:=-1;//clean array
i:=0;
with dm do
begin
tbEnrollments.First;
while NOT tbEnrollments.Eof do
  begin
  if tbEnrollments['enStudent'] = fID then
    begin
      inc(i);
      arrEnrolled[i]:=tbEnrollments['enEducator'];
    end;

  tbEnrollments.Next;
  end; //end while
end;//end with
end;

function TStudent.GetID: integer;
begin
Result:= fID;
end;

function TStudent.GetName: string;
begin
Result:= fUsername;
end;

function TStudent.GetSubjects: TArray<String>;
var
  i: Integer;
begin //really cool stuff with returning arrays!
SetLength(result,7);
for i := 1 to length(result) do
  begin
    result[i-1]:= IDToSubj(arrEnrolled[i]);
  end;
end;

function TStudent.IDToSubj(iID: integer): string;
begin
if iID = -1 then Result:= ''
else
begin
  tbEducators.Locate('eID',iID,[]);
  Result:= tbEducators['eSubject'];
end;
end;

function TStudent.SubjToID(sSubject: string): integer;
begin
if sSubject = '' then Result:= -1
else
begin
  tbEducators.Locate('eSubject',sSubject,[]);
  Result:= tbEducators['eID'];
end;
end;

procedure TStudent.UpdateEnrollments(arrNewSubjects:array of string);
var
  i, j: Integer;
  bFound: boolean;
begin
//REMOVE OLD SUBJECTS FROM TABLE
for i := 1 to length(arrEnrolled) do//go through old subject list 1 by 1
begin
 j:= 0;
 bFound:= false;
 repeat //loop through new subj list, check if it includes the old one
  inc(j); //..if the old one has not been found, bool will be false
  if arrEnrolled[i] = SubjToID(arrNewSubjects[j-1]) then bFound:= true;
 until (j = length(arrNewSubjects)) OR (bFound);
 if (NOT bFound) AND (arrEnrolled[i] <> -1) then//-1 indicates no subject
 begin //remove old subject from the db
   tbEnrollments.First;
   while NOT (tbEnrollments.EOF) do
   begin //loop through tb, check if specific enrollment exists
   if (tbEnrollments['enStudent']=fID) AND (tbEnrollments['enEducator']=arrEnrolled[i])
   then tbEnrollments.Delete;//if so, del it
   tbEnrollments.Next;
   end;//end while
 end;
end; //end for
///////////////////

//REPLACE OLD ARRAY WITH NEW
if length(arrNewSubjects) = 7 then  //ensure array is appropriate length
begin
  for i := 1 to length(arrEnrolled) do
  begin//overwrite old educator IDs with new ones, by getting ID using subject
    arrEnrolled[i]:= SubjToId(arrNewSubjects[i-1]);
  end;
end;
/////////////

//ADD ANY NEW SUBJECTS TO ENROLLMENTS TABLE
for i := 1 to length(arrEnrolled) do
begin
  bFound:= false;
  tbEnrollments.First;
  while NOT (tbEnrollments.EOF OR bFound) do//OR is incl so i can skip some loops if subj already exists
  begin
    if(tbEnrollments['enStudent'] = fID) AND //if this enrollment exists in tb
      (tbEnrollments['enEducator'] = arrEnrolled[i]) then bFound:=true;
    tbEnrollments.Next;
  end; //end while
  if (NOT bFound) AND (arrEnrolled[i]<>-1) then
  begin
    tbEnrollments.Insert;
    tbEnrollments['enEducator']:= arrEnrolled[i];
    tbEnrollments['enStudent']:= fID;
    tbEnrollments.Post;
  end;
end;//end for

end;

end.
