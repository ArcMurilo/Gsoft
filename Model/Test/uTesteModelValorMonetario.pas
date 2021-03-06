unit uTesteModelValorMonetario;

interface

uses
  SysUtils,
  TestFramework,
  Gsoft.Model.ValorMonetario;

type
  TTesteModelValorMonetario = class(TTestCase)

  published
    procedure testeArredondamento();
  end;

implementation

{ TTesteModelValorMonetario }

procedure TTesteModelValorMonetario.testeArredondamento;
var
  valor: TValorMonetario;
begin
  valor := TValorMonetario.Create(1.005);
  checkTrue(
    abs(1.01 - valor.valor) < 0.01,
    format('esperado <%f>, recebido <%f>', [1.01, valor.valor])
  );
  valor := TValorMonetario.Create(1.008);
  checkTrue(
    abs(1.01 - valor.valor) < 0.01,
    format('esperado <%f>, recebido <%f>', [1.01, valor.valor])
  );
  valor := TValorMonetario.Create(1.004);
  checkTrue(
    abs(1.0 - valor.valor) < 0.01,
    format('esperado <%f>, recebido <%f>', [1.0, valor.valor])
  );
end;

initialization
  TestFramework.RegisterTest('TTesteModelValorMonetario Teste', TTesteModelValorMonetario.Suite);

end.
