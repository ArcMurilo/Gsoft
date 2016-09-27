unit Gsoft.Model.AliquotaDesconto;

interface

type
  TAliquotaDesconto = class
  private
    FAliquota: double;
  public
    property aliquota: double read FAliquota;
    constructor Create(aAliquota : double);
    function aplicarAliquotaDesconto(valor : double) : double;
  end;

implementation

{ TDescontoAliquota }

function TAliquotaDesconto.aplicarAliquotaDesconto(valor: double): double;
begin
  result := valor * self.aliquota / 100;
end;

constructor TAliquotaDesconto.Create(aAliquota: double);
begin
  self.FAliquota := 0;
  if (aAliquota >= 0) and (aAliquota <= 100) then
    self.FAliquota := aAliquota;
end;

end.
