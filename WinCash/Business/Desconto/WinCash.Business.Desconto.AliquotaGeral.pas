unit WinCash.Business.Desconto.AliquotaGeral;

interface

type
  TDescontoAliquotaGeral = class
  private

  public
    aliquotaDescontoMaximo : double;
    constructor Create(aAliquotaDescontoMaximo : double);
    function descontoMaximo(valorUnitBruto, quantidade : double) : double;
    function isValorLiquidoValido(valorLiquidoTotal, valorUnitBruto,
      quantidade : double) : boolean;
  end;

implementation

{ TDescontoAliquotaGeral }

constructor TDescontoAliquotaGeral.Create(aAliquotaDescontoMaximo: double);
begin
  self.aliquotaDescontoMaximo := aAliquotaDescontoMaximo;
end;

function TDescontoAliquotaGeral.descontoMaximo(valorUnitBruto,
  quantidade: double): double;
begin
  result := valorUnitBruto * quantidade * self.aliquotaDescontoMaximo / 100;
end;

function TDescontoAliquotaGeral.isValorLiquidoValido(valorLiquidoTotal,
  valorUnitBruto, quantidade: double): boolean;
begin
  result := false;
end;

end.
