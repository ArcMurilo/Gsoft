unit Gsoft.Model.LancamentoVenda.Venda;

interface

uses
  Gsoft.Model.LancamentoVenda.Item,
  Gsoft.Model.InterfaceDesconto;

type
  TLancamentoVendaVenda = class
  private
    FlistaItens: TLancamentoVendaItemLista;
    FModoDesconto: IDesconto;

  public
    property listaItens: TLancamentoVendaItemLista read FlistaItens;
    property ModoDesconto: IDesconto read FModoDesconto write FModoDesconto;
  end;

implementation

end.
