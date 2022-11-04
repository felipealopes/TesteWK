unit Model.Dao.Clientes;

interface

uses
 FireDac.Comp.Client,
 Model.Dao.Conexao;

type
 TClientesDao = class
   private
   FConexao : Tconexao;

   public

   Constructor create();
   destructor Destroy; override;

   function CarregarClientes : TFDQuery;

 end;

implementation

{ TClientesDao }

uses Controller.Control, System.SysUtils;

function TClientesDao.CarregarClientes: TFDQuery;
var
  Vquery : TFDQuery;
begin
  Vquery := FConexao.TQuery();
  Vquery.open('SELECT * FROM TBLCLIENTES ORDER BY NOME');

  result := Vquery;
end;

constructor TClientesDao.create;
begin
  FConexao := TControlSistema.GetInstancia().Conexao;
end;

destructor TClientesDao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

end.


