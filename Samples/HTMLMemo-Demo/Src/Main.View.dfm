object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX HTMLMemo - Demo'
  ClientHeight = 486
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 38
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object btnOpen: TButton
      AlignWithMargins = True
      Left = 6
      Top = 5
      Width = 75
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnOpenClick
      ExplicitLeft = 8
      ExplicitTop = 4
      ExplicitHeight = 25
    end
    object btnSave: TButton
      AlignWithMargins = True
      Left = 86
      Top = 5
      Width = 75
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Save as...'
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitTop = 3
    end
    object btnConfigureToolbar: TButton
      AlignWithMargins = True
      Left = 288
      Top = 5
      Width = 117
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Configure Toolbar'
      TabOrder = 2
      OnClick = btnConfigureToolbarClick
      ExplicitLeft = 179
      ExplicitTop = 3
    end
    object btnToolbarVisibility: TButton
      AlignWithMargins = True
      Left = 166
      Top = 5
      Width = 117
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Toolbar visibility'
      TabOrder = 3
      OnClick = btnToolbarVisibilityClick
      ExplicitLeft = 152
      ExplicitTop = 3
    end
  end
  object TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo
    Left = 0
    Top = 76
    Width = 681
    Height = 391
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    AutoClearCache = True
    OnContentChange = TMSFNCWXHTMLMemo1ContentChange
    ExplicitTop = 32
    ExplicitHeight = 429
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 467
    Width = 681
    Height = 19
    Panels = <
      item
        Width = 500
      end
      item
        Width = 50
      end>
    ExplicitLeft = 352
    ExplicitTop = 256
    ExplicitWidth = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 38
    Width = 681
    Height = 38
    Align = alTop
    TabOrder = 3
    ExplicitTop = 8
    object btnApplyformattingSelection: TButton
      AlignWithMargins = True
      Left = 6
      Top = 5
      Width = 177
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Apply formatting to the selection'
      TabOrder = 0
      OnClick = btnApplyformattingSelectionClick
      ExplicitLeft = 319
    end
    object btnClearFormatting: TButton
      AlignWithMargins = True
      Left = 188
      Top = 5
      Width = 177
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = 'Clear formatting from selection'
      TabOrder = 1
      OnClick = btnClearFormattingClick
      ExplicitLeft = 502
    end
  end
end
