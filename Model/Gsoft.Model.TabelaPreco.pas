unit Gsoft.Model.TabelaPreco;

interface

type
  TTabelaPreco = class
    private
    FCodigo: integer;
    FDescricao: string;

    public
    property Codigo: integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.
