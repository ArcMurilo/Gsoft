unit Gsoft.Model.InterfaceDesconto;

interface

uses
  Gsoft.Model.ValorMonetario,
  Gsoft.Model.AliquotaDesconto,
  Gsoft.Model.LancamentoVenda.Item;

type
  IDesconto = interface
    function ratear(
      valorLiquido : TValorMonetario;
      aliquotaDescontoGeral : TAliquotaDesconto;
      listaItens : TLancamentoVendaItemLista
    ) : boolean;
    function isValorLiquidoValido(
      valorLiquido : TValorMonetario;
      aliquotaDescontoGeral : TAliquotaDesconto;
      listaItens : TLancamentoVendaItemLista
    ) : boolean;
    function getDescontoMaximo(
      aliquotaDescontoGeral : TAliquotaDesconto;
      listaItens : TLancamentoVendaItemLista
    ) : TValorMonetario;
  end;

implementation

end.
