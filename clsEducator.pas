unit clsEducator;

interface

uses system.sysutils;
type
TEducator = class(TObject)
 private
   fID:integer;
   fName:string;
   fSubject:string;

 public
   function getID:integer;
   function getName:string;
   function getSubject:string;


   constructor Create(pID:integer;pName:string;pSubject:string);
end;
implementation

{ TEducator }

constructor TEducator.Create(pID: integer; pName, pSubject: string);
begin
fID:=pID;
fName:=pName;
fSubject:=pSubject;
end;

function TEducator.getID: integer;
begin
Result:=fID;
end;

function TEducator.getName: string;
begin
Result:= fName;
end;

function TEducator.getSubject: string;
begin
Result:= fSubject;
end;

end.
