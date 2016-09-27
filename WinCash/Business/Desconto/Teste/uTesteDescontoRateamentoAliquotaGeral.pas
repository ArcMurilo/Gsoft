unit uTesteDescontoRateamentoAliquotaGeral;

interface

uses
  SysUtils,
  TestFramework,
  Gsoft.Model.LancamentoVenda.Item,
  Gsoft.Model.Produto,
  Gsoft.Model.ValorMonetario,
  WinCash.Business.Desconto.RateamentoAliquotaGeral,
  WinCash.Business.Desconto.AliquotaGeral,
  Gsoft.Model.AliquotaDesconto;

type
  TTesteDescontoRateamentoAliquotaGeral = class(TTestCase)
  private
    listaItens : TLancamentoVendaItemLista;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testeRateamento();
    procedure testeRateamentoValorLiquidoInvalido();
  end;

implementation

{ TTesteDescontoRateamento }

procedure TTesteDescontoRateamentoAliquotaGeral.SetUp;
var
  produto: TProduto;
begin
  inherited;
  listaItens := TLancamentoVendaItemLista.Create();
  produto := TProduto.Create();
  produto.Codigo := 1;
  produto.Produto := 'COCA-COLA LATA';
  produto.CustoRealUnitario.valor := 1.89;
  produto.PrecoVenda.valor := 3.50;
  produto.DescontoMaximo.aliquota := 5;
  listaItens.Add(TLancamentoVendaItem.Create(produto));
  produto := TProduto.Create();
  produto.Codigo := 2;
  produto.Produto := 'X-FRANGO BACON';
  produto.CustoRealUnitario.valor := 8;
  produto.PrecoVenda.valor := 16.50;
  listaItens.Add(TLancamentoVendaItem.Create(produto));
end;

procedure TTesteDescontoRateamentoAliquotaGeral.TearDown;
begin
  inherited;
  listaItens.Free();
end;

procedure TTesteDescontoRateamentoAliquotaGeral.testeRateamento;
var
  rateamento: TDescontoRateamentoAliquotaGeral;
begin
  rateamento := TDescontoRateamentoAliquotaGeral.Create();
  rateamento.ratear(
    TValorMonetario.Create(18.00),
    TAliquotaDesconto.Create(10.00),
    self.listaItens
  );
  checkTrue(
    abs(18.00 - listaItens.valorTotalLiquido.valor) < 0.01,
    format(
      'esperado <%f>, recebido <%f>',
      [18.00, listaItens.valorTotalLiquido.valor]
    )
  );
  listaItens.limparDescontoFechamento();
  rateamento.ratear(
    TValorMonetario.Create(18.50),
    TAliquotaDesconto.Create(10.00),
    self.listaItens
  );
  checkTrue(
    abs(18.50 - listaItens.valorTotalLiquido.valor) < 0.01,
    format(
      'esperado <%f>, recebido <%f>',
      [18.50, listaItens.valorTotalLiquido.valor]
    )
  );
end;

procedure TTesteDescontoRateamentoAliquotaGeral.testeRateamentoValorLiquidoInvalido;
var
  rateamento: TDescontoRateamentoAliquotaGeral;
begin
  rateamento := TDescontoRateamentoAliquotaGeral.Create();
  rateamento.ratear(
    TValorMonetario.Create(15),
    TAliquotaDesconto.Create(10.00),
    listaItens);
  checkTrue(
    abs(listaItens.valorTotalBruto.valor - listaItens.valorTotalLiquido.valor) < 0.01,
    format(
      'esperado <%f>, recebido <%f>',
      [15.00, listaItens.valorTotalLiquido.valor]
    )
  );

end;

initialization
  TestFramework.RegisterTest('TTesteDescontoRateamento Teste', TTesteDescontoRateamentoAliquotaGeral.Suite);

end.
