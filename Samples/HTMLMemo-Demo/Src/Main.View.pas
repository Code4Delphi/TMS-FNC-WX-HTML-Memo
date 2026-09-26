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
  Vcl.ExtCtrls;

type
  TMainView = class(TForm)
    Panel1: TPanel;
    TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo;
    btnOpen: TButton;
    btnSave: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

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

end.
