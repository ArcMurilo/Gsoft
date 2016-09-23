unit WinCash.Business.Desconto.AliquotaGeral;

interface

uses
  WinCash.Business.Desconto.AliquotaDesconto;

type
  TDescontoAliquotaGeral = class
  private
    FAliquotaDescontoMaximo : TAliquotaDesconto;
  public
    property aliquotaDescontoMaximo: TAliquotaDesconto read FAliquotaDescontoMaximo;
    constructor Create(aAliquotaDescontoMaximo : TAliquotaDesconto);
    function descontoMaximo(valorTotalBruto : double) : double;
    function isValorLiquidoValido(valorTotalLiquido, valorTotalBruto: double) : boolean;
  end;

implementation

{$D+}

{ TDescontoAliquotaGeral }

constructor TDescontoAliquotaGeral.Create(aAliquotaDescontoMaximo: TAliquotaDesconto);
begin
  self.FAliquotaDescontoMaximo := aAliquotaDescontoMaximo;
end;

function TDescontoAliquotaGeral.descontoMaximo(valorTotalBruto : double) : double;
begin
  result := valorTotalBruto * self.aliquotaDescontoMaximo.aliquota / 100;
end;

function TDescontoAliquotaGeral.isValorLiquidoValido(valorTotalLiquido, valorTotalBruto: double) : boolean;
var
  valorTotalLiquidoMinimo: double;
begin
  valorTotalLiquidoMinimo := valorTotalBruto - self.descontoMaximo(valorTotalBruto);
  result := valorTotalLiquidoMinimo - valorTotalLiquido < 0.01;
end;

end.
