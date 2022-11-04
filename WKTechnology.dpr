program WKTechnology;

uses
  Vcl.Forms,
  View.UnPedidos in 'SRC\Views\View.UnPedidos.pas' {Form1},
  Model.Dao.Conexao in 'SRC\Model.dao\Model.Dao.Conexao.pas',
  Model.Pedidos in 'SRC\Model\Model.Pedidos.pas',
  Model.Dao.Pedidos in 'SRC\Model.dao\Model.Dao.Pedidos.pas',
  Controller.Control in 'SRC\Controller\Controller.Control.pas',
  Model.PedidosProdutos in 'SRC\Model\Model.PedidosProdutos.pas',
  Model.Dao.PedidosProdutos in 'SRC\Model.dao\Model.Dao.PedidosProdutos.pas',
  Model.Acao in 'SRC\Model.dao\Model.Acao.pas',
  Model.Clientes in 'SRC\Model\Model.Clientes.pas',
  Model.Dao.Clientes in 'SRC\Model.dao\Model.Dao.Clientes.pas',
  Controller.Cliente in 'SRC\Controller\Controller.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
