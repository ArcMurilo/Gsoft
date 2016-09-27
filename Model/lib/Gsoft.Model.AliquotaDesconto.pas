unit Gsoft.Model.AliquotaDesconto;

interface

type
  TAliquotaDesconto = class
  private
    FAliquota: double;
    procedure setAliquota(const Value: double);
  public
    property aliquota: double read FAliquota write setAliquota;
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
  self.aliquota := aAliquota;
end;

procedure TAliquotaDesconto.setAliquota(const Value: double);
begin
  self.FAliquota := 0;
  if (Value >= 0) and (Value <= 100) then
    self.FAliquota := Value;
end;

end.
