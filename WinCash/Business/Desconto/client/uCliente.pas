unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDMCliente,
  Vcl.StdCtrls, Vcl.Buttons, uConsProd, Gsoft.Model.LancamentoVenda.Item,
  WinCash.Business.Desconto.AliquotaGeral,
  WinCash.Business.Desconto.AliquotaDesconto,
  WinCash.Business.Desconto.RateamentoDesconto,
  Gsoft.Model.ValorMonetario;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    btnAdicionarItem: TBitBtn;
    edtValorLiquido: TEdit;
    label1: TLabel;
    btnAplicarVL: TBitBtn;
    edtValorBruto: TEdit;
    Label2: TLabel;
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAplicarVLClick(Sender: TObject);
  private
    { Private declarations }
    listaItens : TLancamentoVendaItemLista;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btnAdicionarItemClick(Sender: TObject);
var
  item : TLancamentoVendaItem;
begin
  item := nil;
  frmConsProd := TfrmConsProd.Create(self);
  try
    frmConsProd.ShowModal();
    if frmConsProd.produto <> nil then
    begin
      item := TLancamentoVendaItem.Create(frmConsProd.produto);
      listaItens.Add(item);
      dmCliente.adicionarItem(item);
      edtValorBruto.Text := listaItens.valorTotalBruto.valor.ToString();
    end;
  finally
    frmConsProd.Free();
  end;
end;

procedure TForm3.btnAplicarVLClick(Sender: TObject);
var
  rateamento: TRateamentoDescontoAliquotaGeral;
  valorLiquido: double;
  item: TLancamentoVendaItem;
begin
  rateamento := TRateamentoDescontoAliquotaGeral.Create();
  valorLiquido := StrToFloat(edtValorLiquido.Text);
  rateamento.ratear(
    TDescontoAliquotaGeral.Create(TAliquotaDesconto.Create(20)),
    TValorMonetario.Create(valorLiquido),
    listaItens
  );
  dmCliente.limparItens();
  for item in listaItens do
    dmCliente.adicionarItem(item);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  listaItens := TLancamentoVendaItemLista.Create();
end;

end.
