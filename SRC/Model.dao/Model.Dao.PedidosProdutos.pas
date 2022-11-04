unit Model.Dao.PedidosProdutos;

interface

uses
  Model.PedidosProdutos,
  FireDAC.Comp.Client,
  FireDac.Stan.param,
  Controller.Control,
  System.SysUtils,
  Model.Dao.Conexao;

type
  TCadastroPedidosProdutos = class
    procedure carregarPedidoProduto(APedidosprodutos : TModelPedidosProdutos; ANumeroPedido : Integer);
    function incluir(APedidosprodutos : TModelPedidosProdutos) : boolean;
    function excluir(APedidosprodutos : TModelPedidosProdutos) : boolean;
    function alterar(APedidosprodutos : TModelPedidosProdutos) : boolean;
  private
    Fconexao : Tconexao;

  public
    constructor create;
  end;



implementation

{ TCadastroPedidosProdutos }

function TCadastroPedidosProdutos.alterar(
  APedidosprodutos: TModelPedidosProdutos): boolean;
var VFdquery : TFdQuery;
begin
   VFdquery := TcontrolSistema.GetInstancia().Conexao.TQuery;
   try
     VFdquery.ExecSQL('UPDATE TBLPEDIDOSPRODUTOS SET '+
                      'QUANTIDADE=:QUANTIDADE, VALORTOTAL=:VALORTOTAL, '+
                      'VALORUNITARIO=:VALORUNITARIO WHERE CODIGOPEDIDOPRODUTO=:CODIGOPEDIDOPRODUTO',
                      [APedidosprodutos.quantidade, APedidosprodutos.valorunitario,
                      APedidosprodutos.valortotal,APedidosprodutos.codigopedidoproduto]);

     result := true;
   finally
     freeandnil(VFdquery);
   end;
end;

procedure TCadastroPedidosProdutos.carregarPedidoProduto(
  APedidosprodutos: TModelPedidosProdutos; ANumeroPedido: Integer);
var  VFdQuery : TFDQuery;
begin
  VFdQuery := TControlSistema.GetInstancia().Conexao.TQuery;
  try
    VFdQuery.Open('SELECT * FROM TBLPEDIDOSPRODUTOS where NUMEROPEDIDO= :NUMEROPEDIDO',[ANumeroPedido]);
    TRY
      APedidosprodutos.codigopedidoproduto  := VFdQuery.FieldByName('codigopedidoproduto').AsInteger;
      APedidosprodutos.numeropedido         := VFdQuery.FieldByName('numeropedido').AsInteger;
      APedidosprodutos.codigoproduto        := VFdQuery.FieldByName('codigoproduto').AsInteger;
      APedidosprodutos.quantidade           := VFdQuery.FieldByName('quantidade').AsFloat;
      APedidosprodutos.valorunitario        := VFdQuery.FieldByName('valorunitario').AsFloat;
      APedidosprodutos.ValorTotal           := VFdQuery.FieldByName('ValorTotal').AsFloat;

    FINALLY
      VFdQuery.Close;
    END;
  finally
    FreeAndNil(VFdQuery);
  end;
end;

constructor TCadastroPedidosProdutos.create;
begin
  Fconexao := TControlSistema.GetInstancia().Conexao;
end;

function TCadastroPedidosProdutos.excluir(
  APedidosprodutos: TModelPedidosProdutos): boolean;
var  VFdQuery : TFDQuery;
begin
  VFdQuery := Fconexao.TQuery;
  try
    VFdQuery.ExecSQL('DELETE FROM TBLPEDIDOSPRODUTOPS WHERE NUMEROPEDIDO=:NUMEROPEDIDO',
                     [APedidosprodutos.Numeropedido]);
    RESULT :=TRUE;

  finally
    freeandnil(VFdquery);
  end;
end;

function TCadastroPedidosProdutos.incluir(
  APedidosprodutos: TModelPedidosProdutos): boolean;
var VFdquery : TFdQuery;
begin
   VFdquery := TcontrolSistema.GetInstancia().Conexao.TQuery;
   try
     VFdquery.ExecSQL('INSERT INTO TBLPEDIDOSPRODUTOS(CODIGOPRODUTO, NUMEROPEDIDO, '+
                      'QUANTIDADE, VALORUNITARIO, VALORTOTAL) VALUES( '+
                      ':CODIGOPRODUTO, :NUMEROPEDIDO,:QUANTIDADE, :VALORUNITARIO, :VALORTOTAL)',
                      [APedidosprodutos.codigoproduto,APedidosprodutos.numeropedido,
                      APedidosprodutos.quantidade,APedidosprodutos.valorunitario,
                      APedidosprodutos.valortotal]);
     result := true;
   finally
     freeandnil(VFdquery);
   end;
end;

end.
