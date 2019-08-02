unit U_Dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient, FireDAC.Phys.IBBase,
  FireDAC.Comp.UI, Data.DBXFirebird, Data.FMTBcd, Data.SqlExpr, System.IniFiles,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL;

type
  TDM = class(TDataModule)
    FDQMenu: TFDQuery;
    ConexaoBD: TFDConnection;
    FDQQuery: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQQuery1: TFDQuery;
    FDQQuery3: TFDQuery;
    FDQMenuIDMODULO: TIntegerField;
    FDQMenuITEM: TStringField;
    FDQMenuDESCRICAO: TStringField;
    FDQMenuNIVELMENU: TStringField;
    FDQMenuICONE: TStringField;
    FDQMenuNOMEFORM: TStringField;
    FDQEmpresa: TFDQuery;
    FDQEmpresaCad: TFDQuery;
    FDQEmpresaAux: TFDQuery;
    FDQEmpresaCadEMPRESA_ID: TIntegerField;
    FDQEmpresaCadEMPRESA_FILIAL: TIntegerField;
    FDQEmpresaCadEMPRESA_NOME: TStringField;
    FDQEmpresaCadEMPRESA_CNPJ: TStringField;
    FDQEmpresaCadEMPRESA_AMBIENTE_ESOCIAL: TIntegerField;
    FDQEmpresaCadEMPRESA_SENHA_CERTIFICADO: TStringField;
    FDQEmpresaEMPRESA_ID: TIntegerField;
    FDQEmpresaEMPRESA_FILIAL: TIntegerField;
    FDQEmpresaEMPRESA_NOME: TStringField;
    FDQEmpresaEMPRESA_CNPJ: TStringField;
    FDQEmpresaEMPRESA_AMBIENTE_ESOCIAL: TIntegerField;
    FDQEmpresaEMPRESA_SENHA_CERTIFICADO: TStringField;
    FDQEmpresaAuxEMPRESA_ID: TIntegerField;
    FDQEmpresaAuxEMPRESA_FILIAL: TIntegerField;
    FDQEmpresaAuxEMPRESA_NOME: TStringField;
    FDQEmpresaAuxEMPRESA_CNPJ: TStringField;
    FDQEmpresaAuxEMPRESA_AMBIENTE_ESOCIAL: TIntegerField;
    FDQEmpresaAuxEMPRESA_SENHA_CERTIFICADO: TStringField;
    FDQEmpresaCadEMPRESA_VIGENCIA_ESOCIAL: TStringField;
    FDQEmpresaEMPRESA_VIGENCIA_ESOCIAL: TStringField;
    FDQEmpresaAuxEMPRESA_VIGENCIA_ESOCIAL: TStringField;
    FDQEmpresaCadEMPRESA_SEQ: TIntegerField;
    FDQEmpresaEMPRESA_SEQ: TIntegerField;
    FDQEmpresaAuxEMPRESA_SEQ: TIntegerField;
    FDQUsuarioCad: TFDQuery;
    FDQUsuario: TFDQuery;
    FDQUsuarioCadUSUARIO_ID: TIntegerField;
    FDQUsuarioCadUSUARIO_NOME: TStringField;
    FDQUsuarioCadUSUARIO_EMAIL: TStringField;
    FDQUsuarioCadUSUARIO_ADMIN: TStringField;
    FDQUsuarioCadUSUARIO_SENHA: TStringField;
    FDQUsuarioCadUSUARIO_ERP: TStringField;
    FDQUsuarioCadUSUARIO_DATAULTIMOACESSO: TSQLTimeStampField;
    FDQUsuarioEMPRESA_ID: TIntegerField;
    FDQUsuarioEMPRESA_FILIAL: TIntegerField;
    FDQUsuarioUSUARIO_ID: TIntegerField;
    FDQUsuarioUSUARIO_ID_1: TIntegerField;
    FDQUsuarioUSUARIO_NOME: TStringField;
    FDQUsuarioUSUARIO_EMAIL: TStringField;
    FDQUsuarioUSUARIO_ADMIN: TStringField;
    FDQUsuarioUSUARIO_SENHA: TStringField;
    FDQUsuarioUSUARIO_ERP: TStringField;
    FDQUsuarioUSUARIO_DATAULTIMOACESSO: TSQLTimeStampField;
    FDQQuery2: TFDQuery;
    FDQCAD: TFDQuery;
    FDQLISTA: TFDQuery;
    FDQTeste: TFDQuery;
    FDQDET: TFDQuery;
    FDQ_PECAPADRAO: TFDQuery;
    procedure ConexaoBDBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function FB_ReturnNextCOD_ByGenerator(NomeGenerator: string): Longint;
    function FB_ReturnMAXCOD_ByTabela(Tabela: string): Longint;
  end;

var
  DM: TDM;

implementation

uses
  ServerController;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDm }

procedure TDM.ConexaoBDBeforeConnect(Sender: TObject);
var
  ArqIni: TiniFile;
begin
  if FileExists('.\config.ini') then
  begin
    ArqIni := TiniFile.Create('.\config.ini');
    ConexaoBD.Connected := false;
    ConexaoBD.Params.Values['Server'] := ArqIni.ReadString('CONFIG', 'Server',
      'localhost');
    ConexaoBD.Params.Values['Database'] := ArqIni.ReadString('CONFIG',
      'DataBase', 'SISFERAGENS.FDB');
    ArqIni.Free;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ConexaoBD.Connected := false;
end;

function TDM.FB_ReturnMAXCOD_ByTabela(Tabela: string): Longint;
var
  SQL: TStringList;
  Qry: TFDQuery;
label
  FIM;
begin
{$I-}
  Result := 0;

  Qry := TFDQuery.Create(nil);
  Qry.Connection := ConexaoBD;

  SQL := TStringList.Create;
  Result := 0;

  SQL.Add('Select Max(cod_' + Tabela + ') as NEWID from ' + Tabela);
  Qry.Open(SQL.Text);

  Result := StrToInt(Qry.FieldValues['NEWID']) + 1;

  SQL.Free;

end;

function TDM.FB_ReturnNextCOD_ByGenerator(NomeGenerator: string): Longint;
var
  SQL: TStringList;
  Qry: TFDQuery;
label
  FIM;
begin
{$I-}
  Qry := TFDQuery.Create(nil);
  Qry.Connection := ConexaoBD;

  SQL := TStringList.Create;
  Result := 0;

  SQL.Add('SELECT GEN_ID(' + NomeGenerator + ', 1) AS NEWID FROM RDB$DATABASE');
  Qry.Open(SQL.Text);

  Result := StrToInt(Qry.FieldValues['NEWID']);

  if Result <= 0 then
    Result := 0;

FIM:
  SQL.Free;

end;

end.
