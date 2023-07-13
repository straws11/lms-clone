object frmStudentHome: TfrmStudentHome
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Student Home Page'
  ClientHeight = 562
  ClientWidth = 1000
  Color = 4469538
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblPastAttempts: TLabel
    Left = 20
    Top = 17
    Width = 180
    Height = 25
    Caption = 'Your Past Attempts'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblAvailableQuizzes: TLabel
    Left = 439
    Top = 17
    Width = 160
    Height = 25
    Caption = 'Available Quizzes'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblStudentName: TLabel
    Left = 877
    Top = 17
    Width = 103
    Height = 13
    Caption = 'Welcome Back, NAME'
    Color = 4469794
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object btnEditEnrollments: TButton
    Left = 348
    Top = 343
    Width = 72
    Height = 49
    Caption = 'Edit Your Enrolled Courses'
    TabOrder = 1
    WordWrap = True
    OnClick = btnEditEnrollmentsClick
  end
  object dbgPastAttempts: TDBGrid
    Left = 20
    Top = 48
    Width = 400
    Height = 289
    DrawingStyle = gdsGradient
    GradientEndColor = 8952166
    GradientStartColor = 5596740
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgPastAttemptsDrawColumnCell
  end
  object dbgAvailableQuizzes: TDBGrid
    Left = 439
    Top = 48
    Width = 549
    Height = 289
    DrawingStyle = gdsGradient
    GradientEndColor = 8952166
    GradientStartColor = 5596740
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgAvailableQuizzesCellClick
    OnDrawColumnCell = dbgAvailableQuizzesDrawColumnCell
  end
  object btnStartQuiz: TButton
    Left = 439
    Top = 343
    Width = 107
    Height = 25
    Caption = 'Start Selected Quiz!'
    TabOrder = 4
    OnClick = btnStartQuizClick
  end
  object btnLogOut: TButton
    Left = 911
    Top = 527
    Width = 75
    Height = 25
    Caption = 'Log Out'
    TabOrder = 5
    OnClick = btnLogOutClick
  end
  object dbeQuizID: TDBEdit
    Left = 877
    Top = 446
    Width = 121
    Height = 21
    TabOrder = 6
    Visible = False
  end
  object dbeQuizName: TDBEdit
    Left = 877
    Top = 473
    Width = 121
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object dbeEduID: TDBEdit
    Left = 877
    Top = 500
    Width = 121
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object pnlEnrollments: TPanel
    Left = 20
    Top = 343
    Width = 296
    Height = 211
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelWidth = 5
    Color = 5596740
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object lblEditEnroll: TLabel
      Left = 23
      Top = 23
      Width = 190
      Height = 19
      Caption = 'Edit Your Enrolled Courses'
      Color = 5596740
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object btnSaveEnrollments: TButton
      Left = 206
      Top = 159
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = btnSaveEnrollmentsClick
    end
    object clbCourses: TCheckListBox
      Left = 23
      Top = 48
      Width = 177
      Height = 137
      Color = 8952166
      ItemHeight = 13
      Items.Strings = (
        'Afrikaans'
        'Biology'
        'Business Studies'
        'Computer Applications Tech'
        'Engineering & Graphic Design'
        'English'
        'Geography'
        'History'
        'Information Technology'
        'Mathematics'
        'Physical Science'
        'Tourism'
        'Visual Arts')
      TabOrder = 1
    end
  end
  object dbeSubject: TDBEdit
    Left = 648
    Top = 345
    Width = 234
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object btnFilterSubject: TButton
    Left = 888
    Top = 343
    Width = 98
    Height = 25
    Caption = 'Filter by Subject'
    TabOrder = 10
    OnClick = btnFilterSubjectClick
  end
  object btnClearFilter: TButton
    Left = 761
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Clear Filter'
    TabOrder = 11
    OnClick = btnClearFilterClick
  end
end
