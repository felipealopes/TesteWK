unit Model.PedidosProdutos;

interface

uses
  Model.Acao;

type
  TModelPedidosProdutos = class
  private
    Fcodigopedidoproduto  : Integer;
    Fnumeropedido         : Integer;
    Fcodigoproduto        : Integer;
    Fquantidade           : Real;
    Fvalorunitario        : Real;
    FValorTotal           : Real;
    Facao                 : Tacao;

    procedure Setcodigopedidoproduto(const Value:Integer);
    procedure Setnumeropedido(const Value: Integer);
    procedure Setvalortotal(const Value: real);
    procedure Setcodigoproduto(const Value: Integer);
    procedure Setvalorunitario(const Value: real);
    procedure Setquantidade(const Value: Real);
    procedure Setacao(const Value: Tacao);
  public
    function Salvar : boolean;
    property codigopedidoproduto  :Integer read Fcodigopedidoproduto write Setcodigopedidoproduto;
    property numeropedido         :Integer read Fnumeropedido write Setnumeropedido;
    property codigoproduto        :Integer read Fcodigoproduto write Setcodigoproduto;
    property quantidade           :Real read Fquantidade write Setquantidade;
    property valorunitario        :Real read Fvalorunitario write Setvalorunitario;
    property ValorTotal           :Real read FValorTotal write SetValorTotal;
    property Acao                 :Tacao read FAcao write Setacao;
    procedure carregar(ANumeroPedido : integer);
  end;

implementation

uses Model.Dao.PedidosProdutos, System.SysUtils;

{ TModelPedidosProdutos }

procedure TModelPedidosProdutos.carregar(ANumeroPedido: integer);
Var
 VPedidosDaoProdutos : TCadastroPedidosProdutos;
begin
 VPedidosDaoProdutos := TCadastroPedidosProdutos.create;
 try
   VPedidosDaoProdutos.carregarPedidoProduto(self,ANumeroPedido);
 finally
   FreeAndNil(VPedidosDaoProdutos);
 end;
end;

function TModelPedidosProdutos.Salvar: boolean;
var
  VPedidosProdutoDao : TCadastroPedidosProdutos;
begin
  result := false;
  VPedidosProdutoDao := TCadastroPedidosProdutos.create;
  try
    case Facao of
      Tacao.tacincluir : Result := VPedidosProdutoDao.incluir(self);
      Tacao.tacalterar : Result := VPedidosProdutoDao.alterar(self);
      Tacao.tacexcluir : Result := VPedidosProdutoDao.excluir(self);
    end;
  finally
    FreeAndNil(VPedidosProdutoDao);
  end;
end;

procedure TModelPedidosProdutos.Setacao(const Value: Tacao);
begin
  fAcao := value;
end;

procedure TModelPedidosProdutos.Setcodigopedidoproduto(const Value: Integer);
begin
  Fcodigopedidoproduto := value;
end;

procedure TModelPedidosProdutos.Setcodigoproduto(const Value: Integer);
begin
  Fcodigoproduto := value;
end;

procedure TModelPedidosProdutos.Setnumeropedido(const Value: Integer);
begin
  Fnumeropedido := value;
end;

procedure TModelPedidosProdutos.Setquantidade(const Value: Real);
begin
  Fquantidade := value;
end;

procedure TModelPedidosProdutos.Setvalortotal(const Value: real);
begin
  Fvalortotal := value;
end;

procedure TModelPedidosProdutos.Setvalorunitario(const Value: real);
begin
  Fvalorunitario := value;
end;

end.
