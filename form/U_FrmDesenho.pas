unit U_FrmDesenho;

interface

uses
  IWAppForm, IWApplication, IWColor, IWTypes,


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout, IWHTMLTag,
  IWTemplateProcessorHTML, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit, Data.DB, IWCompListbox, IWCompLabel,
  IWDBStdCtrls, IWBaseComponent, IWBaseHTMLComponent, IWBaseHTML40Component,
  IWCompExtCtrls, frxClass, frxDBSet, IWCompGrids, IWDBGrids,
  UserSessionUnit, ServerController,
  IWDBExtCtrls, IWCompText, StrUtils, FireDAC.Comp.Client;

type
  TfrmDesenho = class(TIWAppForm)
    TemplateProcessor: TIWTemplateProcessorHTML;
    IWACAO: TIWEdit;
    IWBTNACAO: TIWButton;
    ItensPagina: TIWComboBox;
    Paginacao: TIWLabel;
    TituloModal: TIWLabel;
    DS_FDQQUERY: TDataSource;
    ID: TIWDBEdit;
    DESCRICAO: TIWDBEdit;
    MEDIDAS: TIWDBEdit;
    JSON: TIWDBEdit;
    DESENHO: TIWDBEdit;
    CANTOS: TIWDBEdit;
    CREATED_AT: TIWDBLabel;
    UPDATED_AT: TIWDBLabel;
    USUARIO_ID: TIWDBLabel;
    IWLabel1: TIWLabel;
    DS_FDQQUERY2: TDataSource;
    procedure IWBTNACAOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure TemplateProcessorUnknownTag(const AName: string;
      var VValue: string);

    private
    { Private declarations }
    html: string;
    QtdeRegistros, PaginaAtual, TotalPaginas: Integer;

  public
  end;

implementation

{$R *.dfm}

uses U_DM, SweetAlerts;

procedure TfrmDesenho.IWBTNACAOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  //
  // Clicou em Salvar
  //
    if Trim(Copy(IWAcao.Text,1,5)) = 'Sal' then
    begin
      Controller.DM.FDQQuery.Open;
    try
      Controller.DM.FDQQuery.Post;
      WebApplication.CallBackResponse.AddJavaScriptToExecute(
      'toastr["success"]("Registro Salvo !")');
    except
      WebApplication.CallBackResponse.AddJavaScriptToExecute(
        'toastr["error"]("Opa, Não Salvou")'  );
      end;


  end;

  // Clicou em Incluir
  if Trim(Copy(IWAcao.Text,1,5)) = 'Inc' then
  begin
    Controller.GLBPK := -1;
    Controller.GLBCrud := 'Inclusão';
    // Atualizo o IWLabel que esta como RawText, assim atualizo o nome do título no Modal
    TituloModal.Text := Controller.GLBCrud;

    Controller.DM.FDQQuery.Close;
    Controller.DM.FDQQuery.Open;
    Controller.DM.FDQQuery.Insert;

    Controller.DM.FDQQuery.FieldByName('ID').Value := -1;

    WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#cadastrarPeca'').modal(''show'');');
  end;


  // Clicou em Alterar
  if Trim(Copy(IWAcao.Text,1,5)) = 'Alt' then
  begin
    Controller.GLBPK := StrToInt(Trim(Copy(IWAcao.Text,6,50)));
    Controller.GLBCrud := 'Alteração';
    // Atualizo o IWLabel que esta como RawText, assim atualizo o nome do título no Modal
    TituloModal.Text := Controller.GLBCrud;

    Controller.DM.FDQQuery.Close;
    Controller.DM.FDQQuery.ParamByName('IDCliente').AsInteger := Controller.GLBPK;
    Controller.DM.FDQQuery.Open;
    Controller.DM.FDQQuery.Edit;

    WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#Cadastro'').modal(''show'');');
  end;


  // Clicou em Excluir
  if Trim(Copy(IWAcao.Text,1,5)) = 'Exc' then
  begin
    WebApplication.CallBackResponse.AddJavaScriptToExecute(swalConfirm('CONFIRMAÇÃO', 'Deseja excluir o cliente nº '+Trim(Copy(IWAcao.Text,6,50)), 'warning', 'Excluir', 'Cancelar', 'BTNEXCLUIR'));
  end;

  // Clicou em Imprimir
  if Trim(Copy(IWAcao.Text,1,5)) = 'Impr' then
  begin
    WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#Relatorios'').modal(''show'');');
  end;


  // Clicou em Selecionar
  if Trim(Copy(IWAcao.Text,1,5)) = 'Sel' then
  begin
    //Controller.DM.FDQQuery.Close;
    Controller.DM.FDQQuery.SQL.Clear;
    Controller.DM.FDQQuery.SQL.Add('Select * from pecapadrao ');
    Controller.DM.FDQQuery.SQL.Add('Where ID = '+Trim(Copy(IWAcao.Text,6,50)));
    //  Controller.GLBPK := Trim(Copy(IWAcao.Text,6,50));
    Controller.DM.FDQQuery.Open;
//    Controller.DM.FDQQuery.Edit;


    WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#selecionaPeca'').modal(''hide'');');

  end;

end;

procedure TfrmDesenho.TemplateProcessorUnknownTag(const AName: string;
  var VValue: string);
begin
  inherited;

  if AName = 'GRIDE' then
  begin
    //
    // MONTA A TABLE GRID DO CADASTRO
    //
    Controller.DM.FDQQuery.Close;
    Controller.DM.FDQQuery.SQL.Clear;
    Controller.DM.FDQQuery.SQL.Add('Select * from pecapadrao');
    Controller.DM.FDQQuery.SQL.Add('Order by ID ');
    Controller.DM.FDQQuery.Open();

    html := '';
    html := html + '<table id="GRID" class="table table-bordered table-striped table-hover"> '+SLineBreak+
                   '    <thead> '+SLineBreak+
                   '        <tr> '+SLineBreak+
                   '            <th style="text-align: center;">Código</th> '+SLineBreak+
                   '            <th>Descrição</th> '+SLineBreak+
                   '            <th style="text-align: center;">Ações</th> '+SLineBreak+
                   '        </tr> '+SLineBreak+
                   '    </thead> '+SLineBreak+
                   '    <tbody> '+SLineBreak;

    Controller.DM.FDQQuery.First;
    while not Controller.DM.FDQQuery.Eof do
    begin
      html := html + '        <tr> '+SLineBreak+
                     '            <td align="center">'+Controller.DM.FDQQuery.FieldByName('ID').AsString+'</td> '+SLineBreak+
                     '            <td>'+Controller.DM.FDQQuery.FieldByName('DESCRICAO').AsString+'</td> '+SLineBreak+
                     '            <td align="center"> '+SLineBreak+
                     '                <button type="buttom" class="btn btn-xs btn-success" data-toggle="tooltip" data-placement="top" title="Selecionar" onclick="SetaAcao(''Sel'', '''+Controller.DM.FDQQuery.FieldByName('ID').AsString+''');"> '+SLineBreak+
                     '                    <i class="fa fa-pencil">Selecionar</i> '+SLineBreak+
                     '                </button> '+SLineBreak+
                     '            </td> '+SLineBreak+

                     '        </tr> '+SLineBreak;
      Controller.DM.FDQQuery.Next;
    end;
    Controller.DM.FDQQuery.Close;

    html := html + '    </tbody> '+SLineBreak;
    html := html + '</table> '+SLineBreak;

    VValue := html;
    html := '';
  end;



end;

initialization

TFrmDesenho.SetAsMainForm;

end.
