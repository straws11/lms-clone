object frmMain: TfrmMain
  Left = 5
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Login or Register'
  ClientHeight = 405
  ClientWidth = 720
  Color = 4469538
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuizzle: TLabel
    Left = 288
    Top = 26
    Width = 165
    Height = 53
    Caption = 'Quizzle'
    Color = 4469794
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -43
    Font.Name = 'Rockwell'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object pnlSignUp: TPanel
    Left = 200
    Top = 97
    Width = 320
    Height = 259
    BevelWidth = 5
    Color = 8952166
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object lblSignUp: TLabel
      Left = 20
      Top = 16
      Width = 280
      Height = 33
      Caption = 'Sign Up For An Account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnSignUp: TButton
      Left = 100
      Top = 211
      Width = 121
      Height = 25
      Caption = 'Sign Up!'
      TabOrder = 3
      OnClick = btnSignUpClick
    end
    object ledConfirmPass: TLabeledEdit
      Left = 100
      Top = 172
      Width = 121
      Height = 21
      EditLabel.Width = 86
      EditLabel.Height = 13
      EditLabel.Caption = 'Confirm Password'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
    object ledNewPassword: TLabeledEdit
      Left = 100
      Top = 131
      Width = 121
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Password'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object ledNewUsername: TLabeledEdit
      Left = 100
      Top = 83
      Width = 121
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Username'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      TabOrder = 0
    end
  end
  object pnlLogin: TPanel
    Left = 200
    Top = 116
    Width = 320
    Height = 217
    BevelWidth = 5
    Color = 8952166
    ParentBackground = False
    TabOrder = 0
    object lblLogin: TLabel
      Left = 25
      Top = 17
      Width = 269
      Height = 33
      Caption = 'Login To Your Account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnLogin: TButton
      Left = 100
      Top = 168
      Width = 121
      Height = 25
      Caption = 'Login'
      TabOrder = 2
      OnClick = btnLoginClick
    end
    object ledPassword: TLabeledEdit
      Left = 100
      Top = 132
      Width = 121
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Password'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = 'Lucy5309^'
    end
    object ledUsername: TLabeledEdit
      Left = 100
      Top = 83
      Width = 121
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Username'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Tara Bailey'
    end
  end
  object btnNoAcc: TButton
    Left = 300
    Top = 339
    Width = 121
    Height = 25
    Caption = 'New? Sign Up here'
    TabOrder = 3
    OnClick = btnNoAccClick
  end
  object btnHaveAcc: TButton
    Left = 300
    Top = 362
    Width = 121
    Height = 25
    Caption = 'Back to Login'
    TabOrder = 2
    Visible = False
    OnClick = btnHaveAccClick
  end
  object pnlSignUpInfo: TPanel
    Left = 8
    Top = 119
    Width = 180
    Height = 226
    Color = 8952166
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object lblSignUpInfo: TLabel
      Left = 35
      Top = 13
      Width = 99
      Height = 32
      Alignment = taCenter
      Caption = 'How to Create a Secure Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object redSignUpInfo: TRichEdit
      Left = 5
      Top = 65
      Width = 170
      Height = 150
      Color = 5596740
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'To create a valid password, you '
        'will need to include at least one of '
        'each of the following:'
        '- A special character'
        '- A numerical character'
        '- An uppercase character'
        'Do not share your passwords '
        'with other people!')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Zoom = 100
    end
  end
  object btbQuit: TBitBtn
    Left = 624
    Top = 372
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 5
  end
end
