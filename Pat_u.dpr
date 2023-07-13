program Pat_u;

uses
  Vcl.Forms,
  Main_u in 'Main_u.pas' {frmMain},
  dm_u in 'dm_u.pas' {dm: TDataModule},
  StudentHome_u in 'StudentHome_u.pas' {frmStudentHome},
  EducatorHome_u in 'EducatorHome_u.pas' {frmEducatorHome},
  Quiz_u in 'Quiz_u.pas' {frmQuiz},
  clsStudent in 'clsStudent.pas',
  clsEducator in 'clsEducator.pas',
  clsQuiz in 'clsQuiz.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmStudentHome, frmStudentHome);
  Application.CreateForm(TfrmEducatorHome, frmEducatorHome);
  Application.CreateForm(TfrmQuiz, frmQuiz);
  Application.Run;
end.
