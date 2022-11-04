unit Controller.Control;

interface

uses
  Model.Dao.Conexao, System.SysUtils, Model.Pedidos, Model.PedidosProdutos;

Type
  TControlSistema = class      //classe controladora do sistema
  private
     Fconexao               : Tconexao;
     FPedidoModel           : TModelPedidos;
     FPedidosProdutosModel  : TModelPedidosProdutos;

     class var FInstancia : TControlSistema;

     public
      constructor create();
      destructor destroy ; override;

      FUNCTION salvarpedido         : boolean;
      FUNCTION salvarpedidoprodutos : boolean;

      procedure CarregarPedido(ANumeroPedido : Integer);
      procedure CarregarPedidoProdutos(ANumeroPedido : Integer);
      class function GetInstancia : TControlSistema;

      property Conexao              : Tconexao read Fconexao write fconexao;
      property Pedidomodel          : TModelPedidos read FPedidoModel write FPedidoModel;
      property PedidoProdutosmodel  : TModelPedidosProdutos read FPedidosProdutosModel write FPedidosProdutosModel;
  end;

implementation


{ TControl }



procedure TControlSistema.CarregarPedido(ANumeroPedido : Integer);
begin
  FPedidoModel.carregar(ANumeroPedido);
end;

procedure TControlSistema.CarregarPedidoProdutos(ANumeroPedido : Integer);
begin
  FPedidosProdutosModel.carregar(ANumeroPedido);
end;

constructor TControlSistema.create;
begin
  Fconexao                := Tconexao.create;
  FPedidoModel            := TModelPedidos.create();
  FPedidosProdutosModel   := TModelPedidosProdutos.Create();
end;

destructor TControlSistema.destroy;
begin
  freeandnil(FPedidosProdutosModel);
  freeandnil(FPedidoModel);
  freeandnil(Fconexao);
  inherited;
end;

class function TControlSistema.GetInstancia: TcontrolSistema;
begin
  if not Assigned(self.FInstancia) then
  begin
    Self.FInstancia := TControlSistema.create();
  end;
  result := Self.FInstancia;
end;


function TControlSistema.salvarpedido: boolean;
begin
 result := FPedidoModel.Salvar;
end;

function TControlSistema.salvarpedidoprodutos: boolean;
begin
 result := FPedidosProdutosModel.Salvar;

end;

end.
