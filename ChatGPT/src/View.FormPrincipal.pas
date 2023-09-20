unit View.FormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Objects,
  FMX.Layouts, FMX.TabControl;

type
  TFormPrincipal = class(TForm)
    MemoPrompt: TMemo;
    GroupBoxPrompt: TGroupBox;
    ButtonSend: TButton;
    MemoResponse: TMemo;
    Response: TGroupBox;
    LayoutMain: TLayout;
    ImageLogo: TImage;
    TabControlGUI: TTabControl;
    TabItemChat: TTabItem;
    TabItemImage: TTabItem;
    LayoutImage: TLayout;
    TabControlImage: TTabControl;
    TabItemPromtImage: TTabItem;
    TabItemPicture: TTabItem;
    ButtonImage: TButton;
    MemoImage: TMemo;
    ImageGenerated: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure ButtonImageClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

const
  API_TOKEN = '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';

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}
uses
  OpenAI, OpenAI.Completions, OpenAI.Images;

var
  OpenAI : TOpenAIComponent;

procedure TFormPrincipal.ButtonImageClick(Sender: TObject);
begin
//var Images := OpenAI.Image.Create(
//  procedure(Params: TImageCreateParams)
//  begin
//    Params.Prompt(MemoImage.Text);
//    Params.ResponseFormat('url');
//  end);
//try
//  for var Image in Images.Data do
//    ImageGenerated.Bitmap.
//    LoadFromUrl(Image.Url);
//finally
//  Images.Free;
//end;
end;

procedure TFormPrincipal.ButtonSendClick(Sender: TObject);
begin
  var Completions := OpenAI.Completion.Create(
    procedure(Params: TCompletionParams)
    begin
      Params.Prompt(MemoPrompt.Text);
      Params.MaxTokens(2048);
    end);
  try
    for var Choice in Completions.Choices do
      MemoResponse.Lines.Add(Choice.Index.ToString + ' ' + Choice.Text);
  finally
    Completions.Free;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  OpenAI := TOpenAIComponent.Create(Self);
  OpenAI.Token := API_TOKEN;

  TabControlGUI.TabIndex := 0;
end;

end.
