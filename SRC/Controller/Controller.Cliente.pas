unit Controller.Cliente;

interface
uses
Model.clientes,
FireDac.Comp.client;

type
  TControllerCliente = class
  private
    FClienteModel : TModelClientes;

    public
    constructor create;

    Destructor Destroy; override;
    function carregarcliente : TFDquery;
  end;


implementation

uses
  System.SysUtils;

{ TControllerCliente }

function TControllerCliente.carregarcliente: TFDquery;
begin
  result := FClienteModel.CarregarClientes;
end;

constructor TControllerCliente.create;
begin
  FClienteModel := TModelClientes.Create;
end;

destructor TControllerCliente.Destroy;
begin
   freeandnil(FClienteModel);
  inherited;
end;

end.
