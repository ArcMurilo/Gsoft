unit Gsoft.Model.ProdutoTabelaPreco;

interface

uses
  Gsoft.Model.TabelaPreco,
  System.Generics.Collections,
  Gsoft.Model.ValorMonetario;

type
  TProdutoTabelaPreco = class
    private
    FCodigo: integer;
    FTabelaPreco: TTabelaPreco;
    FPrecoVenda: TValorMonetario;
    FMarkup: double;

    public
    property Codigo: integer read FCodigo write FCodigo;
    property TabelaPreco: TTabelaPreco read FTabelaPreco write FTabelaPreco;
    property Markup: double read FMarkup write FMarkup;
    property PrecoVenda: TValorMonetario read FPrecoVenda write FPrecoVenda;
  end;

  TProdutoTabelaPrecoLista = class(TList<TProdutoTabelaPreco>)
  end;

implementation

end.
