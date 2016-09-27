unit WinCash.Business.Desconto.RateamentoAliquotaGeral;

interface

uses
  Gsoft.Model.LancamentoVenda.Item,
  Gsoft.Model.ValorMonetario,
  Gsoft.Model.AliquotaDesconto,
  WinCash.Business.Desconto.AliquotaGeral;

type
  TDescontoRateamentoAliquotaGeral = class
  private
  public
    procedure ratear(
      aliquotaDesconto : TAliquotaDesconto;
      valorLiquido : TValorMonetario;
      listaItens : TLancamentoVendaItemLista);
  end;

implementation

{ TDescontoRateamentoAliquotaGeral }

procedure TDescontoRateamentoAliquotaGeral.ratear(
      aliquotaDesconto : TAliquotaDesconto;
      valorLiquido : TValorMonetario;
      listaItens : TLancamentoVendaItemLista);
var
  valorDesconto: TValorMonetario;
  item: TLancamentoVendaItem;
  aliquotaDescontoRateamento: TAliquotaDesconto;
  aliquotaDescontoGeral : TDescontoAliquotaGeral;
begin
  aliquotaDescontoGeral := TDescontoAliquotaGeral.Create(aliquotaDesconto);
  if not aliquotaDescontoGeral.isValorLiquidoValido(valorLiquido, listaItens.valorTotalBruto) then
    Exit;
  valorDesconto := TValorMonetario.Create(listaItens.valorTotalBruto.valor - valorLiquido.valor);
  aliquotaDescontoRateamento := TAliquotaDesconto.Create(100 * valorDesconto.valor / listaItens.valorTotalBruto.valor);

  for item in listaItens do
    item.valorDescontoFechamento.valor := aliquotaDescontoRateamento.aplicarAliquotaDesconto(item.valorUnitarioBruto.valor);

  if valorLiquido.valor - listaItens.valorTotalLiquido.valor > 0.01 then
  begin
    item := listaItens.itemMaiorValor;
    item.valorDescontoFechamento.valor :=
      item.valorDescontoFechamento.valor + valorLiquido.valor - listaItens.valorTotalLiquido.valor;
  end
  else
  if listaItens.valorTotalLiquido.valor - valorLiquido.valor > 0.01 then
  begin
    item := listaItens.itemMaiorValor;
    item.valorDescontoFechamento.valor :=
      item.valorDescontoFechamento.valor - (listaItens.valorTotalLiquido.valor - valorLiquido.valor);
  end;
end;

end.