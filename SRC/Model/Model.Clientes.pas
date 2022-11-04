unit Model.Clientes;

interface
uses
FireDac.Comp.Client,
Model.Dao.Clientes;
type
  TModelClientes = class
  private
    Fcodigo :Integer;
    Fnome   :String;
    Fcidade :String;
    Fuf     :String;
    procedure Setcodigo(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure Setcidade(const Value: String);
    procedure Setuf(const Value: String);
  public
    Function CarregarClientes : TFDQuery;
    property codigo :Integer read Fcodigo write Setcodigo;
    property nome   :String read Fnome write Setnome;
    property cidade :String read Fcidade write Setcidade;
    property uf     :String read Fuf write Setuf;
  end;

implementation

{ TModelClientes }

function TModelClientes.CarregarClientes: TFDQuery;
var
  VClienteDao : TClientesDao;
begin
  VClienteDao := TClientesDao.create;
  try
    result := VClienteDao.CarregarClientes;
  finally
    VClienteDao.Free;
  end;
end;

procedure TModelClientes.Setcidade(const Value: String);
begin
  Fcidade := value;
end;

procedure TModelClientes.Setcodigo(const Value: Integer);
begin
  Fcodigo := value
end;

procedure TModelClientes.Setnome(const Value: String);
begin
  Fnome := value;
end;

procedure TModelClientes.Setuf(const Value: String);
begin
  Fuf := value;
end;

end.
