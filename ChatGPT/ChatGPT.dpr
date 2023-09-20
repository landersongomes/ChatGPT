program ChatGPT;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.FormPrincipal in 'src\View.FormPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
