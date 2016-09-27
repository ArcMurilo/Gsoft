unit Gsoft.Model.Produto;

interface

uses
  Gsoft.Model.ProdutoTabelaPreco,
  Gsoft.Model.ValorMonetario,
  Gsoft.Model.AliquotaDesconto;

type
  TProduto = class
    private
    FCodigo: integer;
    FProduto: string;
    FCustoRealUnitario: TValorMonetario;
    FPrecoVenda: TValorMonetario;
    FDescontoMaximo: TAliquotaDesconto;
    FTabelasPreco: TProdutoTabelaPrecoLista;

    public
    property Codigo: integer read FCodigo write FCodigo;
    property Produto: string read FProduto write FProduto;
    property CustoRealUnitario: TValorMonetario read FCustoRealUnitario;
    property PrecoVenda: TValorMonetario read FPrecoVenda;
    property DescontoMaximo: TAliquotaDesconto read FDescontoMaximo;
    property TabelasPreco: TProdutoTabelaPrecoLista read FTabelasPreco;

    constructor Create();
    destructor Destroy(); override;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  FCustoRealUnitario := TValorMonetario.Create(0);
  FPrecoVenda := TValorMonetario.Create(0);
  FTabelasPreco := TProdutoTabelaPrecoLista.Create();
  FDescontoMaximo := TAliquotaDesconto.Create(0);
end;


destructor TProduto.Destroy;
begin
  TabelasPreco.Free();
  inherited;
end;

end.
