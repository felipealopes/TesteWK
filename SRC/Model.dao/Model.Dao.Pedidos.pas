unit Model.Dao.Pedidos;

interface

uses
  Model.Pedidos,
  FireDAC.Comp.Client,
  FireDac.Stan.param,
  Controller.Control,
  System.SysUtils,
  Model.Dao.Conexao;
type
  TCadastroPedidos = class
    procedure carregarPedido(APedidos : TModelPedidos; ANumeroPedido : Integer);
    function incluir(APedidos : TModelPedidos) : boolean;
    function excluir(APedidos : TModelPedidos) : boolean;
    function alterar(APedidos : TModelPedidos) : boolean;
  private
    Fconexao : Tconexao;

  public
    constructor create;
  end;

implementation

{ TCadastroUsuarios }


function TCadastroPedidos.alterar(APedidos: TModelPedidos): boolean;
var VFdquery : TFdQuery;
begin
   VFdquery := TcontrolSistema.GetInstancia().Conexao.TQuery;
   try
     VFdquery.ExecSQL('UPDATE TBLPEDIDOS SET '+
                      'DATAEMISSAO=:DATAEMISSAO, CODIGOCLIENTE=:CODIGOCLIENTE, '+
                      'VALORTOTAL=:VALORTOTAL WHERE NUMEROPEDIDO=:NUMEROPEDIDO',
                      [APedidos.dataemissao,APedidos.codigocliente, APedidos.valortotal,
                      APedidos.numeropedido]);
     result := true;
   finally
     freeandnil(VFdquery);
   end;
end;


procedure TCadastroPedidos.carregarPedido(APedidos: TModelPedidos; ANumeroPedido : Integer);
var  VFdQuery : TFDQuery;
begin
  VFdQuery := TControlSistema.GetInstancia().Conexao.TQuery;
  try
    VFdQuery.Open('SELECT * FROM TBLPEDIDOS where NUMEROPEDIDO= :NUMEROPEDIDO',[ANumeroPedido]);
    TRY
      APedidos.dataemissao            := VFdQuery.FieldByName('dataemissao').AsDateTime;
      APedidos.codigocliente          := VFdQuery.FieldByName('codigocliente').AsInteger;
      APedidos.ValorTotal             := VFdQuery.FieldByName('valortotal').AsFloat;
      APedidos.Numeropedido           := VFdQuery.FieldByName('numeropedido').AsInteger;

    FINALLY
      VFdQuery.Close;
    END;
  finally
    FreeAndNil(VFdQuery);
  end;

end;

constructor TCadastroPedidos.create;
begin
  Fconexao := TControlSistema.GetInstancia().Conexao;
end;

function TCadastroPedidos.excluir(APedidos: TModelPedidos): boolean;
var  VFdQuery : TFDQuery;
begin
  VFdQuery := Fconexao.TQuery;
  try
    VFdQuery.ExecSQL('DELETE FROM TBLPEDIDOS WHERE NUMEROPEDIDO=:NUMEROPEDIDO',[APedidos.Numeropedido]);

    RESULT :=TRUE;

  finally
    freeandnil(VFdquery);
  end;


end;

function TCadastroPedidos.incluir(APedidos: TModelPedidos): boolean;
var VFdquery : TFdQuery;
begin
   VFdquery := TcontrolSistema.GetInstancia().Conexao.TQuery;
   try
     VFdquery.ExecSQL('INSERT INTO TBLPEDIDOS (DATAEMISSAO, CODIGOCLIENTE, VALORTOTAL) '+
                      'VALUES (:DATAEMISSAO, :CODIGOCLIENTE, :VALORTOTAL)',
                      [APedidos.dataemissao,APedidos.codigocliente,APedidos.ValorTotal]);

     result := true;
   finally
     freeandnil(VFdquery);
   end;
end;

end.
