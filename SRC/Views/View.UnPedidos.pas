unit View.UnPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Controller.Cliente,
  Datasnap.DBClient, Controller.Control;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Model.Acao;

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var
  VControllerPedido         : TControlSistema;
  Vquery                    : TFDQuery;
begin
  VControllerPedido := TControlSistema.create;
  try
    // AQUI É SO UM EXEMPLO, ESTÁ INCOMPLETO
    VControllerPedido.Pedidomodel.Acao            := model.Acao.tacincluir;
    VControllerPedido.Pedidomodel.dataemissao     := Now;
    VControllerPedido.Pedidomodel.codigocliente   := 6;

    VControllerPedido.PedidoProdutosmodel.Acao    := model.Acao.tacincluir;
    VControllerPedido.PedidoProdutosmodel.codigopedidoproduto := 15;
    VControllerPedido.PedidoProdutosmodel.quantidade := 20;

    Vquery  := TcontrolSistema.GetInstancia().Conexao.TQuery;
    try
      vquery.ExecSQL('START TRANSACTION');

      if (VControllerPedido.salvarpedido) and (VControllerPedido.salvarpedidoprodutos) then
      begin
        vquery.close;
        vquery.sql.Clear;
        vquery.ExecSQL('COMMIT');


        ShowMessage('Produto gravado com sucesso');
      end;

    Except
      on msg: Exception do
      begin
        vquery.close;
        vquery.sql.Clear;
        vquery.ExecSQL('COMMIT');

        showmessage('Erro ao tentar gravar o pedido: '+msg.Message);
      end;
    end;


  finally
    FreeAndNil(VControllerPedido);
  end;

end;

initialization
  ReportMemoryLeaksOnShutdown := true;

end.
