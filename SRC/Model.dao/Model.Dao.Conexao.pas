unit Model.Dao.Conexao;

interface
uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQL,
  Data.DB,
  System.SysUtils,
  IniFiles,
  Vcl.Forms;
Type
  Tconexao = class
    private
      FConnection : TFdConnection;
      FPhysMySQLDriver: TFDPhysMySQLDriverLink;
      procedure parametrosconexao;
    public
      constructor create;
      destructor Destroy; override;
      function GetConnection : TFdConnection;
      function TQuery : TFdQuery;
  end;


implementation


{ Tconexar }

constructor Tconexao.create;
begin
  FConnection             := TFDConnection.Create(nil);
  FPhysMySQLDriver        := TFDPhysMySQLDriverLink(nil);
  self.parametrosconexao();
end;

destructor Tconexao.Destroy;
begin
  freeandnil(FConnection);
  freeandnil(FPhysMySQLDriver);
  inherited;
end;

function Tconexao.GetConnection: TFdConnection;
begin
  Result := FConnection;
end;

procedure Tconexao.parametrosconexao;
var
  ArquivoIni  : TIniFile;
begin
  SetCurrentDir(ExtractFilePath(Application.ExeName));
  ArquivoIni  := TIniFile.Create(GetCurrentDir + '\\paramentos.ini');
  Fconnection.LoginPrompt       := false;
  Fconnection.Params.DriverID   := 'MySql';
  Fconnection.Params.UserName   := 'root';
  Fconnection.Params.Password   := '77883354';
  Fconnection.Params.Database   := ArquivoIni.ReadString('BASE','base','');
  Fconnection.Params.Add('server='+ ArquivoIni.ReadString('SERVIDOR','servidor',''));
  Fconnection.Params.Add('port='+ArquivoIni.ReadString('PORTA','porta',''));

  FreeAndNil(ArquivoIni);
end;

function Tconexao.TQuery: TFdQuery;
var
  VQuery : TFdQuery;
begin
  VQuery            := TFdQuery.Create(nil);
  VQuery.Connection := Fconnection;

  result := VQuery;
end;

end.
