unit Gsoft.Model.ValorMonetario;

interface

uses
  SysUtils,
  Math;
  
type
  TValorMonetario = class
  private
    FValor: double;
    procedure setValor(const Value: double);
  public
    property valor: double read FValor write setValor;
    constructor Create(aValor : double);
    function Equals(obj : TObject) : boolean; override;
  end;

implementation

{ TValorMonetario }

constructor TValorMonetario.Create(aValor: double);
begin
  self.valor := aValor;
end;

function TValorMonetario.Equals(obj: TObject): boolean;
var
  valorMonetario: TValorMonetario;
begin
  valorMonetario := TValorMonetario(obj);
  result := self.valor = valorMonetario.valor;
end;

procedure TValorMonetario.setValor(const Value: double);
var
  valorStr: string;
begin
  self.FValor := Value;
  valorStr := self.FValor.ToString(ffNumber, 18, 3);
  if valorStr[valorStr.Length] = '5' then
    self.FValor := self.FValor + 0.001;
  self.FValor := RoundTo(self.FValor, -2);
end;

end.
