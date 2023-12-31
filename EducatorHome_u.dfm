object frmEducatorHome: TfrmEducatorHome
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Educator Home Page'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEducatorName: TLabel
    Left = 750
    Top = 13
    Width = 116
    Height = 15
    Caption = 'Educator Name here'
    Color = 4469538
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GlowSize = 1
    ParentColor = False
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 984
    Height = 546
    ActivePage = TabSheet2
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Student Management'
      object pnlStudentMgmt: TPanel
        Left = 0
        Top = 0
        Width = 980
        Height = 545
        Color = 7820612
        ParentBackground = False
        TabOrder = 0
        object lblEnrolledStudents: TLabel
          Left = 588
          Top = 16
          Width = 309
          Height = 33
          Caption = 'Manage Enrolled Students'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblAttemptHistory: TLabel
          Left = 136
          Top = 16
          Width = 186
          Height = 33
          Caption = 'Attempt History'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbgEnrolledStudents: TDBGrid
          Left = 600
          Top = 55
          Width = 265
          Height = 120
          Hint = 
            'If students don'#39't show up, it is because they have made no quiz ' +
            'attempts!'
          DrawingStyle = gdsGradient
          GradientEndColor = 8952166
          GradientStartColor = 5596740
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgEnrolledStudentsCellClick
          OnDrawColumnCell = dbgEnrolledStudentsDrawColumnCell
        end
        object dbeUser: TDBEdit
          Left = 506
          Top = 349
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbeQuiz: TDBEdit
          Left = 506
          Top = 379
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnFilterUser: TButton
          Left = 651
          Top = 346
          Width = 75
          Height = 25
          Caption = 'Filter By User'
          TabOrder = 3
          OnClick = btnFilterUserClick
        end
        object btnFilterQuiz: TButton
          Left = 651
          Top = 377
          Width = 75
          Height = 25
          Caption = 'Filter By Quiz'
          TabOrder = 4
          OnClick = btnFilterQuizClick
        end
        object dbgAttemptHistory: TDBGrid
          Left = 50
          Top = 55
          Width = 450
          Height = 400
          DrawingStyle = gdsGradient
          GradientEndColor = 8952166
          GradientStartColor = 5596740
          ReadOnly = True
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgAttemptHistoryCellClick
          OnDrawColumnCell = dbgAttemptHistoryDrawColumnCell
        end
        object dbeID: TDBEdit
          Left = 506
          Top = 408
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object btnAddComment: TButton
          Left = 50
          Top = 461
          Width = 186
          Height = 25
          Caption = 'Add a comment to this attempt'
          TabOrder = 7
          OnClick = btnAddCommentClick
        end
        object btnRemoveStudent: TButton
          Left = 730
          Top = 185
          Width = 144
          Height = 25
          Caption = 'Remove Selected Student'
          TabOrder = 8
          OnClick = btnRemoveStudentClick
        end
        object dbeEnrolledUser: TDBEdit
          Left = 600
          Top = 185
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object btnClearFilter: TButton
          Left = 530
          Top = 408
          Width = 75
          Height = 25
          Caption = 'Clear Filters'
          TabOrder = 10
          OnClick = btnClearFilterClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Quiz Management'
      ImageIndex = 1
      object pnlQuizMgmt: TPanel
        Left = 0
        Top = 2
        Width = 980
        Height = 545
        Color = 7820612
        ParentBackground = False
        TabOrder = 0
        object lblEditQuizzes: TLabel
          Left = 50
          Top = 29
          Width = 155
          Height = 39
          Caption = 'Edit A Quiz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblQuizCreation: TLabel
          Left = 50
          Top = 29
          Width = 266
          Height = 39
          Caption = 'Create A New Quiz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -32
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object pnlInfo: TPanel
          Left = 60
          Top = 82
          Width = 249
          Height = 113
          Color = 8952166
          ParentBackground = False
          TabOrder = 0
          object lblInfo: TLabel
            Left = 16
            Top = 14
            Width = 222
            Height = 91
            Caption = 
              'Enter a question and its answer, as well as 3 incorrect answers ' +
              'for the multiple choice quiz. Click "Add Question" to add this q' +
              'uestion! You can double click on a question in the grid below to' +
              ' edit it, just make sure your question panel is empty or you wil' +
              'l lose its current contents!'
            Color = 9083494
            ParentColor = False
            WordWrap = True
          end
        end
        object sgQuestions: TStringGrid
          Left = 12
          Top = 303
          Width = 775
          Height = 206
          Color = clBtnFace
          DefaultColWidth = 150
          DefaultRowHeight = 18
          DrawingStyle = gdsGradient
          FixedCols = 0
          RowCount = 16
          GradientEndColor = 8952166
          GradientStartColor = 5596740
          ScrollBars = ssVertical
          TabOrder = 1
          OnDblClick = sgQuestionsDblClick
        end
        object btnCreateQuiz: TButton
          Left = 434
          Top = 195
          Width = 113
          Height = 25
          Caption = 'Create New Quiz'
          TabOrder = 3
          Visible = False
          OnClick = btnCreateQuizClick
        end
        object btnEditQuiz: TButton
          Left = 434
          Top = 195
          Width = 113
          Height = 25
          Caption = 'Edit An Existing Quiz'
          TabOrder = 4
          OnClick = btnEditQuizClick
        end
        object pnlNewQuiz: TPanel
          Left = 434
          Top = 11
          Width = 479
          Height = 184
          Color = 8952166
          ParentBackground = False
          TabOrder = 5
          object lblWrong2: TLabel
            Left = 24
            Top = 103
            Width = 88
            Height = 13
            Caption = 'Wrong Answer #2'
          end
          object lblCorrect: TLabel
            Left = 24
            Top = 52
            Width = 75
            Height = 13
            Caption = 'Correct Answer'
          end
          object lblWrong1: TLabel
            Left = 24
            Top = 76
            Width = 88
            Height = 13
            Caption = 'Wrong Answer #1'
          end
          object lblWrong3: TLabel
            Left = 24
            Top = 130
            Width = 88
            Height = 13
            Caption = 'Wrong Answer #3'
          end
          object lblQuestion: TLabel
            Left = 24
            Top = 25
            Width = 43
            Height = 13
            Caption = 'Question'
          end
          object btnAddQ: TButton
            Left = 116
            Top = 154
            Width = 75
            Height = 25
            Caption = 'Add Question'
            TabOrder = 5
            OnClick = btnAddQClick
          end
          object edtCorrect: TEdit
            Left = 116
            Top = 49
            Width = 350
            Height = 21
            TabOrder = 1
          end
          object edtWrong1: TEdit
            Left = 116
            Top = 73
            Width = 350
            Height = 21
            TabOrder = 2
          end
          object edtWrong2: TEdit
            Left = 116
            Top = 100
            Width = 350
            Height = 21
            TabOrder = 3
          end
          object edtWrong3: TEdit
            Left = 116
            Top = 127
            Width = 350
            Height = 21
            TabOrder = 4
          end
          object btnSaveQuiz: TButton
            Left = 390
            Top = 154
            Width = 75
            Height = 25
            Caption = 'Save Quiz'
            TabOrder = 6
            OnClick = btnSaveQuizClick
          end
          object edtQuestion: TEdit
            Left = 116
            Top = 22
            Width = 350
            Height = 21
            TabOrder = 0
          end
          object btnDeleteQuestion: TButton
            Left = 200
            Top = 154
            Width = 89
            Height = 25
            Caption = 'Delete Question'
            Enabled = False
            TabOrder = 7
            OnClick = btnDeleteQuestionClick
          end
        end
        object pnlEditQuizChoose: TPanel
          Left = 360
          Top = 152
          Width = 327
          Height = 129
          Color = 8952166
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object dbgQuizList: TDBGrid
            Left = 31
            Top = 8
            Width = 177
            Height = 120
            DrawingStyle = gdsGradient
            GradientEndColor = 8952166
            GradientStartColor = 5596740
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = dbgQuizListCellClick
            OnDrawColumnCell = dbgQuizListDrawColumnCell
          end
          object btnEditThis: TButton
            Left = 248
            Top = 90
            Width = 75
            Height = 25
            Caption = 'Edit This Quiz'
            TabOrder = 1
            OnClick = btnEditThisClick
          end
          object btnCancel: TButton
            Left = 248
            Top = 11
            Width = 75
            Height = 25
            Caption = 'Cancel'
            TabOrder = 2
            OnClick = btnCancelClick
          end
          object dbeSelIndex: TDBEdit
            Left = 243
            Top = 64
            Width = 55
            Height = 21
            TabOrder = 3
            Visible = False
          end
          object btnDeleteQuiz: TButton
            Left = 240
            Top = 49
            Width = 83
            Height = 25
            Caption = 'Delete This Quiz'
            TabOrder = 4
            OnClick = btnDeleteQuizClick
          end
        end
      end
    end
  end
  object btnLogOut: TButton
    Left = 901
    Top = 516
    Width = 75
    Height = 25
    Caption = 'Log Out'
    TabOrder = 1
    OnClick = btnLogOutClick
  end
end
