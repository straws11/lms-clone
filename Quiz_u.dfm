object frmQuiz: TfrmQuiz
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Quiz'
  ClientHeight = 405
  ClientWidth = 720
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
  object lblTitle: TLabel
    Left = 56
    Top = 24
    Width = 168
    Height = 39
    Caption = 'TITLE QUIZ'
    Color = 4469538
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblQuestion: TLabel
    Left = 56
    Top = 96
    Width = 522
    Height = 50
    AutoSize = False
    Caption = 'TITLE QUESTION MORE TEXT TEST SAMPLE WHY ARE YOU SPACING WEIRD'
    Color = 4469794
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object lblScore: TLabel
    Left = 595
    Top = 35
    Width = 79
    Height = 25
    Caption = 'SCORE: '
    Color = 4469538
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object imgResult: TImage
    Left = 600
    Top = 66
    Width = 105
    Height = 105
    Stretch = True
  end
  object btnAns1: TButton
    Left = 56
    Top = 297
    Width = 260
    Height = 100
    Caption = 'ANSWER1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = btnAns1Click
  end
  object btnAns2: TButton
    Left = 334
    Top = 297
    Width = 260
    Height = 100
    Caption = 'ANSWER2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = btnAns2Click
  end
  object btnAns3: TButton
    Left = 56
    Top = 177
    Width = 260
    Height = 100
    Caption = 'ANSWER3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = btnAns3Click
  end
  object btnAns4: TButton
    Left = 334
    Top = 177
    Width = 260
    Height = 100
    Caption = 'ANSWER4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    WordWrap = True
    OnClick = btnAns4Click
  end
  object btnQuitQuiz: TButton
    Left = 614
    Top = 372
    Width = 98
    Height = 25
    Caption = 'Cancel && Quit'
    TabOrder = 4
    OnClick = btnQuitQuizClick
  end
end
