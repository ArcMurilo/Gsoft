unit uTesteDescontoAliquotaVendedorProduto;

interface

uses
  TestFramework,
  WinCash.Business.Desconto.AliquotaVendedorProduto,
  Gsoft.Model.AliquotaDesconto,
  Gsoft.Model.ValorMonetario;

type
  TTesteDescontoAliquotaVendedorProduto = class(TTestCase)
  private

  published
    procedure testeDescontoMaximo();
    procedure testeValorLiquidoValido();

  end;

implementation

{ TTesteDescontoAliquotaVendedorProduto }

procedure TTesteDescontoAliquotaVendedorProduto.testeDescontoMaximo;
var
  desconto: TDescontoAliquotaVendedorProduto;
begin
  desconto := TDescontoAliquotaVendedorProduto.Create(
    TAliquotaDesconto.Create(8), TAliquotaDesconto.Create(10)
  );
  checkTrue(
    TValorMonetario.Create(8).Equals(desconto.descontoMaximo(TValorMonetario.Create(100)))
  );
  desconto.Free();
  desconto := TDescontoAliquotaVendedorProduto.Create(
    TAliquotaDesconto.Create(18), TAliquotaDesconto.Create(10)
  );
  checkTrue(
    TValorMonetario.Create(10).Equals(desconto.descontoMaximo(TValorMonetario.Create(100)))
  );
  desconto.Free();
end;

procedure TTesteDescontoAliquotaVendedorProduto.testeValorLiquidoValido;
var
  desconto: TDescontoAliquotaVendedorProduto;
begin
  desconto := TDescontoAliquotaVendedorProduto.Create(
    TAliquotaDesconto.Create(10), TAliquotaDesconto.Create(8)
  );
  checkTrue(desconto.isValorLiquidoValido(TValorMonetario.Create(92), TValorMonetario.Create(100)));
  checkFalse(desconto.isValorLiquidoValido(TValorMonetario.Create(90), TValorMonetario.Create(100)));
end;

initialization
  TestFramework.RegisterTest('TTesteDescontoAliquotaVendedorProduto Teste', TTesteDescontoAliquotaVendedorProduto.Suite);

end.
