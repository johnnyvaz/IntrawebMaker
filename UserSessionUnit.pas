unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, IdHashMessageDigest,
  System.Generics.Collections, IWAppForm, IWInit, IniFiles, U_DM,
  System.Math, Vcl.Graphics, EncdDecd, IWCompText, DateUtils, Winapi.Windows, Winapi.Messages, System.Variants,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout, IWHTMLTag,
  IWTemplateProcessorHTML, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit, Data.DB, IWCompListbox, IWCompLabel,
  IWDBStdCtrls, IWBaseComponent, IWBaseHTMLComponent, IWBaseHTML40Component,
  IWCompExtCtrls, frxClass, frxExportPDF, frxDBSet, IWCompGrids,
  IWDBGrids,
  IWDBExtCtrls, StrUtils;

type
  TIWUserSession = class(TIWUserSessionBase)
        procedure IWUserSessionBaseCreate(Sender: TObject);
    procedure FindReplaceMemo(const Enc, subs: String; var Texto: TIWText);

  private
    { Private declarations }
  public
    { Public declarations }

    DM: TDM;

    IDModulo: Integer;
    GLBPK: Integer;
    GLBPK2: Integer;
    GLBPK3: string;
    GLBCrud: string;
    GLBNomeTela: String;
    GLBNomeRelatorio: string;

    MenuPrincipal: string;

    //
    // Variaveis Globais da Empresa em Uso
    //
    xUsuario: String;
    xCodUsuario: Integer;
    xDataUltimoAcesso: String;
    xErro: String;
    xTipoAcesso: String;
    xCliente: String;
    xCodCliente: Integer;
    Empresa_ID: Integer;
    Empresa_Filial: Integer;
    xcnpj: String;
    formativo: String;
    inicioform: Boolean;
    Arquivo: String;
    xsenhacertficado: String;
    xadmin: String;
    xEmpresaNome: String;
    formDetalhe: Integer;
    FiltraEmpresa: Boolean;
    FiltraFilial: Boolean;
    xOrcamento:integer;
    xItemOrc:Integer;
    xItemPecaPadrao:Integer;
    xIdPecaPadrao:Integer;
    xDesPecaPadrao:String;
    xCantosPecaPadrao:Integer;


    function MontaPaginacao(PagAtual, ItensPag, TotalPag, TotalRegistros
      : Integer): String;
    function MD5(const Texto: string): string;
    function AcaoMenu(Acao: String): String;
    function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
    // procedure LimpaEdit (Form: TIWAppForm);
  end;

implementation

{$R *.dfm}

uses funcoes, 
ServerController,
U_FrmIndex,
U_FrmDesenho;
{
  procedure TIWUserSession.LimpaEdit(Form:TIWAppForm);
  var
  i : Integer;
  begin
  for i := 0 to Form.ComponentCount -1 do
  if Form.Components[i] is TIWEdit then
  begin
  TIWEdit(Form.Components[i]).Text := '';
  end;

  end;
  // assim limpara todos os Edits, Memos, MaskEdits, etc...
  //Valeu!!
}

function TIWUserSession.MontaPaginacao(PagAtual, ItensPag, TotalPag,
  TotalRegistros: Integer): String;
var
  html: String;
  Pos1, Pos2: Integer;
begin
  Pos1 := ((ItensPag * (PagAtual - 1)) + 1);
  Pos2 := Pos1 + (ItensPag - 1);
  if Pos2 > TotalRegistros then
    Pos2 := TotalRegistros;

  html := '';
  html := html + '<div class="row"> ' + SLineBreak;
  html := html + '    <div class="col-xs-12 col-sm-5 text-left"> ' + SLineBreak;
  html := html + '        <br /> ' + SLineBreak;
  html := html + '        Mostrando de ' + Pos1.ToString + ' até ' +
    Pos2.ToString + ' de ' + TotalRegistros.ToString + ' registros' +
    SLineBreak;
  html := html + '    </div> ' + SLineBreak;
  html := html + '    <div class="col-xs-12 col-sm-7 text-right"> ' +
    SLineBreak;
  html := html + '        <ul class="sync-pagination pagination-sm"></ul> ' +
    SLineBreak;
  html := html + '    </div> ' + SLineBreak;
  html := html + '</div> ' + SLineBreak;
  html := html + '<script> ' + SLineBreak;
  html := html + '    $(''.sync-pagination'').twbsPagination({ ' + SLineBreak;
  html := html +
    '        first: ''<i class="glyphicon glyphicon-fast-backward text-primary"></i>'', '
    + SLineBreak;
  html := html +
    '        last: ''<i class="glyphicon glyphicon-fast-forward text-primary"></i>'', '
    + SLineBreak;
  html := html +
    '        prev: ''<i class="glyphicon glyphicon-backward text-primary"></i>'', '
    + SLineBreak;
  html := html +
    '        next: ''<i class="glyphicon glyphicon-forward text-primary"></i>'', '
    + SLineBreak;
  html := html + '        startPage: ' + PagAtual.ToString + ', ' + SLineBreak;
  html := html + '        totalPages: ' + TotalPag.ToString + ', ' + SLineBreak;
  html := html + '        visiblePages: 5, ' + SLineBreak;
  html := html + '        onPageClick: function (event, page) { ' + SLineBreak;
  html := html + '            SetaAcao(''TWBS '', page); ' + SLineBreak;
  html := html + '        } ' + SLineBreak;
  html := html + '    }); ' + SLineBreak;
  html := html + ' ' + SLineBreak;
  html := html + '</script> ' + SLineBreak;

  Result := html;
end;

procedure TIWUserSession.FindReplaceMemo(const Enc, subs: String;
  var Texto: TIWText);
Var
  i, Posicao: Integer;
  Linha: string;
Begin
  For i := 0 to Texto.Lines.count - 1 do
  begin
    Linha := Texto.Lines[i];
    Repeat
      Posicao := Pos(Enc, Linha);
      If Posicao > 0 then
      Begin
        Delete(Linha, Posicao, Length(Enc));
        Insert(subs, Linha, Posicao);
        Texto.Lines[i] := Linha;
      end;
    until Posicao = 0;
  end;

end;


function TIWUserSession.AcaoMenu(Acao: String): String;
begin
  if Acao = 'Encerrar' then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    //TFrmLogin.Create(WebApplication).Show;
  end;

  if Acao = 'Iniciar' then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TFrmIndex.Create(WebApplication).Show;
    if xcnpj = '' then
      WebApplication.ShowMessage('CNPJ não encontrado na Base de Dados!');

  end;


if (Acao = 'Desenho') and (formativo<>'Desenho') then
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TfrmDesenho.Create(WebApplication).Show;
  formativo:='Desenho';
end;

end;

function TIWUserSession.MD5(const Texto: string): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Result := idmd5.HashStringAsHex(Texto);
  finally
    idmd5.Free;
  end;
end;

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin
  DM := TDM.Create(Self);
end;

function TIWUserSession.IIf(Expressao: Variant;
  ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
    Result := ParteTRUE
  else
    Result := ParteFALSE;
end;

end.
