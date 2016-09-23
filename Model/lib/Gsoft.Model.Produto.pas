unit Gsoft.Model.Produto;

interface

uses
  Gsoft.Model.ProdutoTabelaPreco,
  Gsoft.Model.ValorMonetario;

type
  TProduto = class
    private
    FCodigo: integer;
    FProduto: string;
    FCustoRealUnitario: TValorMonetario;
    FPrecoVenda: TValorMonetario;
    FDescontoMaximo: double;
    FTabelasPreco: TProdutoTabelaPrecoLista;

    public
    property Codigo: integer read FCodigo write FCodigo;
    property Produto: string read FProduto write FProduto;
    property CustoRealUnitario: TValorMonetario read FCustoRealUnitario;
    property PrecoVenda: TValorMonetario read FPrecoVenda;
    property DescontoMaximo: double read FDescontoMaximo write FDescontoMaximo;
    property TabelasPreco: TProdutoTabelaPrecoLista read FTabelasPreco write FTabelasPreco;

    constructor Create();
    destructor Destroy(); override;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  FCustoRealUnitario := TValorMonetario.Create(0);
  FPrecoVenda := TValorMonetario.Create(0);
  TabelasPreco := TProdutoTabelaPrecoLista.Create();
end;


destructor TProduto.Destroy;
begin
  TabelasPreco.Free();
  inherited;
end;

end.
