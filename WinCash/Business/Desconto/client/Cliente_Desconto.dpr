program Cliente_Desconto;

uses
  Vcl.Forms,
  uCliente in 'uCliente.pas' {Form3},
  uDMCliente in 'uDMCliente.pas' {dmCliente: TDataModule},
  uConsProd in 'uConsProd.pas' {frmConsProd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
