unit uTesteModelAliquotaDesconto;

interface

uses
  TestFramework,
  Gsoft.Model.AliquotaDesconto;

type
  TTesteDescontoAliquotaDesconto = class(TTestCase)

  published
    procedure testeAplicarDesconto();
  end;

implementation

{ TTesteDescontoAliquotaDesconto }

procedure TTesteDescontoAliquotaDesconto.testeAplicarDesconto;
var
  desconto: TAliquotaDesconto;
begin
  desconto := TAliquotaDesconto.Create(10);
  checkEquals(10, desconto.aplicarAliquotaDesconto(100));
end;

initialization
  TestFramework.RegisterTest('TTesteDescontoAliquotaDesconto Teste', TTesteDescontoAliquotaDesconto.Suite);

end.
