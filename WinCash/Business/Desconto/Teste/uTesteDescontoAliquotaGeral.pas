unit uTesteDescontoAliquotaGeral;

interface

uses
  TestFramework,
  WinCash.Business.Desconto.AliquotaGeral,
  WinCash.Business.Desconto.AliquotaDesconto;

type
  TTesteDescontoAliquotaGeral = class(TTestCase)

  published
    procedure testeDescontoMaximo();
    procedure testeValorLiquidoValido();
  end;

implementation

{$D+}

{ TTesteDesconto }

procedure TTesteDescontoAliquotaGeral.testeDescontoMaximo;
var
  descontoAliquotaGeral: TDescontoAliquotaGeral;
begin
  descontoAliquotaGeral := TDescontoAliquotaGeral.Create(TAliquotaDesconto.Create(10));
  CheckEquals(10, descontoAliquotaGeral.descontoMaximo(100));
end;

procedure TTesteDescontoAliquotaGeral.testeValorLiquidoValido;
var
  descontoAliquotaGeral: TDescontoAliquotaGeral;
begin
  descontoAliquotaGeral := TDescontoAliquotaGeral.Create(TAliquotaDesconto.Create(10));
  checkTrue(descontoAliquotaGeral.isValorLiquidoValido(90, 100));
  checkTrue(descontoAliquotaGeral.isValorLiquidoValido(110, 100));
  checkFalse(descontoAliquotaGeral.isValorLiquidoValido(80, 100));
end;

initialization
  TestFramework.RegisterTest('TTesteDescontoAliquotaGeral Testes',
                             TTesteDescontoAliquotaGeral.Suite);

end.