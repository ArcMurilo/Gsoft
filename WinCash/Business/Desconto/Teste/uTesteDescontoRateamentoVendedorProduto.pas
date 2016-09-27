unit uTesteDescontoRateamentoVendedorProduto;

interface

uses
  TestFramework,
  Gsoft.Model.LancamentoVenda.Item,
  Gsoft.Model.ValorMonetario,
  Gsoft.Model.Produto,
  Gsoft.Model.AliquotaDesconto,
  WinCash.Business.Desconto.AliquotaVendedorProduto,
  WinCash.Business.Desconto.RateamentoAliquotaVendedorProduto;

type
  TTesteDescontoRateamentoVendedorProduto = class(TTestCase)
  private
    listaItens : TLancamentoVendaItemLista;
  protected
    procedure SetUp; override;
    procedure TearDown; override;

  published
    procedure testeRateamento();
  end;


implementation

{ TTesteDescontoRateamentoVendedorProduto }

procedure TTesteDescontoRateamentoVendedorProduto.SetUp;
var
  produto: TProduto;
  //item: TLancamentoVendaItem;
begin
  inherited;
  listaItens := TLancamentoVendaItemLista.Create();
  produto := TProduto.Create();
  produto.Codigo := 1;
  produto.Produto := 'COCA-COLA LATA';
  produto.CustoRealUnitario.valor := 1.89;
  produto.PrecoVenda.valor := 3.50;
  produto.DescontoMaximo := 5;
  listaItens.Add(TLancamentoVendaItem.Create(produto));
  produto := TProduto.Create();
  produto.Codigo := 2;
  produto.Produto := 'X-FRANGO BACON';
  produto.CustoRealUnitario.valor := 8;
  produto.PrecoVenda.valor := 16.50;
  produto.DescontoMaximo := 10;
  listaItens.Add(TLancamentoVendaItem.Create(produto));
end;

procedure TTesteDescontoRateamentoVendedorProduto.TearDown;
begin
  listaItens.Free();
end;

procedure TTesteDescontoRateamentoVendedorProduto.testeRateamento;
var
  rateamento: TDescontoRateamentoAliquotaVendedorProduto;
  valorLiquido : TValorMonetario;
begin
  rateamento := TDescontoRateamentoAliquotaVendedorProduto.Create();
  valorLiquido := TValorMonetario.Create(19);
  rateamento.ratear(
    valorLiquido,
    TAliquotaDesconto.Create(10.00),
    listaItens
  );
  checkTrue(valorLiquido.valor = listaItens.valorTotalLiquido.valor);
end;

initialization
  TestFramework.RegisterTest('TTesteDescontoRateamentoVendedorProduto Teste',
    TTesteDescontoRateamentoVendedorProduto.Suite);

end.
