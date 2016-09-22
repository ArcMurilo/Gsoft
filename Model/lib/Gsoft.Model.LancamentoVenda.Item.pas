unit Gsoft.Model.LancamentoVenda.Item;

interface

uses
  Gsoft.Model.Produto,
  System.Generics.Collections;

type
  TLancamentoVendaItem = class
  private
    FProduto: TProduto;
    FValorUnitarioBruto: double;
    FQuantidade: double;
    FValorDescontoLancamento: double;
    FValorDescontoFechamento: double;
    function getValorTotalLiquido: double;
    function getValorDescontoTotal: double;
  public
    property produto: TProduto read FProduto;
    property valorUnitarioBruto: double read FValorUnitarioBruto write FValorUnitarioBruto;
    property quantidade: double read FQuantidade write FQuantidade;
    property valorDescontoLancamento: double read FValorDescontoLancamento write FValorDescontoLancamento;
    property valorDescontoFechamento: double read FValorDescontoFechamento write FValorDescontoFechamento;
    property valorDescontoTotal : double read getValorDescontoTotal;
    property valorTotalLiquido: double read getValorTotalLiquido;
    constructor Create(aProduto : TProduto);
  end;

  TLancamentoVendaItemLista = class(TList<TLancamentoVendaItem>)
  end;

implementation

{ TLancamentoVendaItem }

constructor TLancamentoVendaItem.Create(aProduto: TProduto);
begin
  self.FProduto := aProduto;
end;

function TLancamentoVendaItem.getValorDescontoTotal: double;
begin
  result := self.valorDescontoLancamento + self.valorDescontoFechamento;
end;

function TLancamentoVendaItem.getValorTotalLiquido: double;
begin
  result := self.valorUnitarioBruto * self.quantidade - self.valorDescontoTotal;
end;

end.
