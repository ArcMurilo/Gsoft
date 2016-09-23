unit uConsProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  uDMCliente,
  Gsoft.Model.Produto;

type
  TfrmConsProd = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FProduto : TProduto;
  public
    { Public declarations }
    property produto: TProduto read FProduto;
  end;

var
  frmConsProd: TfrmConsProd;

implementation

{$R *.dfm}

procedure TfrmConsProd.DBGrid1DblClick(Sender: TObject);
begin
  Fproduto := dmCliente.selecionarProduto();
  self.Close();
end;

procedure TfrmConsProd.FormCreate(Sender: TObject);
begin
  Fproduto := nil;
end;

end.
