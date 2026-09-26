unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  Vcl.StdCtrls,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXHTMLMemo,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TMainView = class(TForm)
    Panel1: TPanel;
    TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo;
    btnOpen: TButton;
    btnSave: TButton;
    StatusBar1: TStatusBar;
    btnConfigureToolbar: TButton;
    Panel2: TPanel;
    btnApplyformattingSelection: TButton;
    btnClearFormatting: TButton;
    btnToolbarVisibility: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCWXHTMLMemo1ContentChange(Sender: TObject; HTMLContent, ContentPlainText: string);
    procedure btnApplyformattingSelectionClick(Sender: TObject);
    procedure btnClearFormattingClick(Sender: TObject);
    procedure btnConfigureToolbarClick(Sender: TObject);
    procedure btnToolbarVisibilityClick(Sender: TObject);
  private

  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  // HTML é um TStrings: atribua a marcação por meio de sua propriedade Text
  TMSFNCWXHTMLMemo1.HTML.Text :=
    '<h1>Title</h1>' +
    '<p>Paragraph 1 with <b>content</b></p>' +
    '<p>Paragraph 2 with <b>content 2</b></p>';
end;

procedure TMainView.TMSFNCWXHTMLMemo1ContentChange(Sender: TObject; HTMLContent, ContentPlainText: string);
begin
  //É disparado após cada edição
  //HTMLContent é a marcação
  //ContentPlainText é o mesmo conteúdo com todas as tags removidas
  StatusBar1.Panels[0].Text := Format('%d characters', [ContentPlainText.Length]);
end;

procedure TMainView.btnOpenClick(Sender: TObject);
var
  LFileName: string;
begin
  if TTMSFNCUtils.SelectFile(LFileName, '', 'HTML files|*.html|Text files|*.txt') then
    TMSFNCWXHTMLMemo1.HTML.LoadFromFile(LFileName);
end;

procedure TMainView.btnSaveClick(Sender: TObject);
var
  LFileName: string;
begin
  LFileName := 'TMS-FNC-WX-HTML-Memo-Demo.html';
  if TTMSFNCUtils.SaveFile(LFileName) then
    TMSFNCWXHTMLMemo1.HTML.SaveToFile(LFileName);
end;

procedure TMainView.btnApplyformattingSelectionClick(Sender: TObject);
begin
   //A formatação de caracteres alterna o estilo na seleção atual ou na posição do cursor
  TMSFNCWXHTMLMemo1.TextBold;
  TMSFNCWXHTMLMemo1.TextItalic;
  TMSFNCWXHTMLMemo1.TextUnderline;
  TMSFNCWXHTMLMemo1.TextStrikeThrough;

  //Aplique uma família e um tamanho de fonte (o tamanho é expresso na unidade de tamanho de fonte ativa
  TMSFNCWXHTMLMemo1.SetFontName('Georgia');
  TMSFNCWXHTMLMemo1.SetFontSize(14);

  //Layout de parágrafo. }
  TMSFNCWXHTMLMemo1.JustifyCenter;
  TMSFNCWXHTMLMemo1.SetLineHeight(2);
  TMSFNCWXHTMLMemo1.Indent;

  //Estrutura de inserção: True = lista ordenada (numerada), False = lista com marcadores
  TMSFNCWXHTMLMemo1.InsertList(True);
  TMSFNCWXHTMLMemo1.InsertText('A plain-text run');
  TMSFNCWXHTMLMemo1.PasteHTML('<mark>highlighted fragment</mark>');
end;

procedure TMainView.btnToolbarVisibilityClick(Sender: TObject);
begin
  TMSFNCWXHTMLMemo1.Toolbar.Visible :=
   not TMSFNCWXHTMLMemo1.Toolbar.Visible;
end;

procedure TMainView.btnClearFormattingClick(Sender: TObject);
begin
  //Limpe toda a formatação de caracteres da seleção
  TMSFNCWXHTMLMemo1.RemoveFormat;
end;

procedure TMainView.btnConfigureToolbarClick(Sender: TObject);
begin
  { Font group: keep bold/italic/underline, drop the rest. }
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.FontStyle.BtBold := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.FontStyle.BtItalic := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.FontStyle.BtUnderline := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.FontStyle.BtStrikeThrough := False;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.FontStyle.BtColor := False;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.FontStyle.BtClear := False;

  { Paragraph group: keep lists, drop the predefined-style picker. }
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Paragraph.BtStyle := False;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Paragraph.BtOList := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Paragraph.BtUList := True;

  { Insert group: allow links only. }
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Insert.BtLink := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Insert.BtPicture := False;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Insert.BtVideo := False;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Insert.BtTable := False;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Insert.BtHr := False;

  { Misc group: undo/redo on, raw HTML code-view button on. }
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Misc.BtUndo := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Misc.BtRedo := True;
  TMSFNCWXHTMLMemo1.Toolbar.Buttons.Misc.BtCodeView := True;
end;

end.
