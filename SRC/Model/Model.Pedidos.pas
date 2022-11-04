unit Model.Pedidos;

interface

uses
 Model.Acao;
type
  TModelPedidos = class
  private
    Fnumeropedido   :Integer;
    Fdataemissao    :TDate;
    Fcodigocliente  :Integer;
    FValorTotal     :Real;
    Facao           :Tacao;
    procedure Setdataemissao(const Value: TDate);
    procedure Setcodigocliente(const Value: Integer);
    procedure Setvalortotal(const Value: real);
    procedure Setnumeropedido(const Value: Integer);
    procedure Setacao(const Value: Tacao);
  public
    function Salvar : boolean;
    property dataemissao           :TDate read Fdataemissao write Setdataemissao;
    property codigocliente         :Integer read Fcodigocliente write Setcodigocliente;
    property ValorTotal            :Real read FValorTotal write Setvalortotal;
    property Numeropedido          :Integer read Fnumeropedido write Setnumeropedido;
    property Acao                  :TAcao read Facao write Setacao;
    procedure carregar(ANumeroPedido : integer);
  end;
implementation

uses Model.Dao.Pedidos, System.SysUtils;

{ TModelPedidos }

procedure TModelPedidos.carregar(ANumeroPedido : integer);
Var
 VPedidosDao : TCadastroPedidos;
begin
 VPedidosDao := TCadastroPedidos.create;
 try
   VPedidosDao.carregarPedido(self,ANumeroPedido);
 finally
   FreeAndNil(VPedidosDao);
 end;

end;

procedure TModelPedidos.Setdataemissao(const Value: TDate);
begin
  Fdataemissao := value;
end;

procedure TModelPedidos.Setnumeropedido(const Value: Integer);
begin
 Fnumeropedido := Value;
end;

function TModelPedidos.Salvar: boolean;
var
  VPedidosDao : TCadastroPedidos;
begin
  result := false;
  VPedidosDao := TCadastroPedidos.create;
  try
    case Facao of
      Tacao.tacincluir : Result := VPedidosDao.incluir(self);
      Tacao.tacalterar : Result := VPedidosDao.alterar(self);
      Tacao.tacexcluir : Result := VPedidosDao.excluir(self);
    end;
  finally
    FreeAndNil(VPedidosDao);
  end;
end;

procedure TModelPedidos.Setacao(const Value: Tacao);
begin
  Facao := value;
end;

procedure TModelPedidos.Setcodigocliente(const Value: Integer);
begin
  Fcodigocliente := value;
end;

procedure TModelPedidos.Setvalortotal(const Value: real);
begin
  FValorTotal := value;
end;

end.
