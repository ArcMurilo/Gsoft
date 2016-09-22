unit uTesteDescontoRateamento;

interface

uses
  TestFramework,
  Gsoft.Model.LancamentoVenda.Item,
  Gsoft.Model.Produto;

type
  TTesteDescontoRateamento = class(TTestCase)
  private
    listaItens : TLancamentoVendaItemLista;

  protected
    procedure SetUp; override;
    procedure TearDown; override;


  published
    procedure testeRateamentoDescontoAliquotaGeral();

  end;

implementation

{ TTesteDescontoRateamento }

procedure TTesteDescontoRateamento.SetUp;
begin
  inherited;
  listaItens := TLancamentoVendaItemLista.Create();
end;

procedure TTesteDescontoRateamento.TearDown;
begin
  inherited;
  listaItens.Free();
end;

procedure TTesteDescontoRateamento.testeRateamentoDescontoAliquotaGeral();
begin

end;

end.
