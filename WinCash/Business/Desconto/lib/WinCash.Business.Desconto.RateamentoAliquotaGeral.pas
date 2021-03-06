unit WinCash.Business.Desconto.RateamentoAliquotaGeral;

interface

uses
  Gsoft.Model.LancamentoVenda.Item,
  Gsoft.Model.ValorMonetario,
  Gsoft.Model.AliquotaDesconto,
  Gsoft.Model.InterfaceDesconto,
  WinCash.Business.Desconto.AliquotaGeral;

type
  TDescontoRateamentoAliquotaGeral = class(TInterfacedObject, IDesconto)
  private
  public
    function getDescontoMaximo(aliquotaDescontoGeral: TAliquotaDesconto;
      listaItens: TLancamentoVendaItemLista): TValorMonetario;
    function isValorLiquidoValido(valorLiquido: TValorMonetario;
      aliquotaDescontoGeral: TAliquotaDesconto;
      listaItens: TLancamentoVendaItemLista): Boolean;
    function ratear(valorLiquido: TValorMonetario;
      aliquotaDescontoGeral: TAliquotaDesconto;
      listaItens: TLancamentoVendaItemLista): Boolean;

  end;

implementation

{ TDescontoRateamentoAliquotaGeral }

function TDescontoRateamentoAliquotaGeral.getDescontoMaximo(
  aliquotaDescontoGeral: TAliquotaDesconto;
  listaItens: TLancamentoVendaItemLista): TValorMonetario;
var
  descontoGeral: TDescontoAliquotaGeral;
begin
  descontoGeral := TDescontoAliquotaGeral.Create(aliquotaDescontoGeral);
  result := descontoGeral.descontoMaximo(listaItens.valorTotalBruto);
  descontoGeral.Free();
end;

function TDescontoRateamentoAliquotaGeral.isValorLiquidoValido(
  valorLiquido: TValorMonetario; aliquotaDescontoGeral: TAliquotaDesconto;
  listaItens: TLancamentoVendaItemLista): Boolean;
var
  descontoGeral: TDescontoAliquotaGeral;
begin
  descontoGeral := TDescontoAliquotaGeral.Create(aliquotaDescontoGeral);
  result := descontoGeral.isValorLiquidoValido(valorLiquido, listaItens.valorTotalBruto);
  descontoGeral.Free();
end;

function TDescontoRateamentoAliquotaGeral.ratear(valorLiquido: TValorMonetario;
  aliquotaDescontoGeral: TAliquotaDesconto;
  listaItens: TLancamentoVendaItemLista): Boolean;
var
  valorDesconto: TValorMonetario;
  item: TLancamentoVendaItem;
  aliquotaDescontoRateamento: TAliquotaDesconto;
  DescontoGeral : TDescontoAliquotaGeral;
begin
  DescontoGeral := TDescontoAliquotaGeral.Create(aliquotaDescontoGeral);
  if not DescontoGeral.isValorLiquidoValido(valorLiquido, listaItens.valorTotalBruto) then
    Exit;
  valorDesconto := TValorMonetario.Create(listaItens.valorTotalBruto.valor - valorLiquido.valor);
  aliquotaDescontoRateamento := TAliquotaDesconto.Create(100 * valorDesconto.valor / listaItens.valorTotalBruto.valor);

  for item in listaItens do
    item.valorDescontoFechamento.valor := aliquotaDescontoRateamento.aplicarAliquotaDesconto(item.valorUnitarioBruto.valor);

  item := listaItens.itemMaiorValor;
  item.valorDescontoFechamento.valor :=
    item.valorDescontoFechamento.valor + (listaItens.valorTotalLiquido.valor - valorLiquido.valor);
end;

end.
