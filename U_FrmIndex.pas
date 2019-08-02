unit U_FrmIndex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,U_FrmPadrao, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit, IWCompLabel, IWCompText;

type
  TFrmIndex = class(TFrmPadrao)
    Empresa: TIWText;
    procedure IWAppFormCreate(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmIndex: TFrmIndex;

implementation

{$R *.dfm}

uses SweetAlerts, ServerController, System.Math, funcoes,
  System.DateUtils;

procedure TFrmIndex.IWAppFormCreate(Sender: TObject);
var
  faz: String;
begin
  inherited;
  Empresa.Text := Controller.xEmpresaNome;
  //
  // MONTAGEM DO MENU VINDO DO BANCO DE DADOS
  //

  Controller.DM.FDQMenu.Close;
  Controller.DM.FDQMenu.Open;

  // Home

  Controller.MenuPrincipal := ' <ul class="sidebar-menu" data-widget="tree"> ' +
    #13 + #10 + '    <li class="header">Menu Principal</li> ' + #13 + #10 +
    '    <li> ' + #13 + #10 +
    '      <a href="javascript: SetaAcao(''Menu'', ''Iniciar'');"> ' + #13 + #10
    + '        <i class="fa fa-lg fa-fw fa-home"></i> ' + #13 + #10 +
    '        <span class="menu-item-parent"> Início </span>' + #13 + #10 +
    '      </a> ' + #13 + #10 + '    </li> ' + #13 + #10;
  Controller.DM.FDQMenu.First;

  while not Controller.DM.FDQMenu.Eof do
  begin
    faz := 'S';
    if copy(Controller.DM.FDQMenu.FieldByName('Item').AsString, 1, 1) = '5' then
    begin
      if Controller.xadmin = 'S' then
        faz := 'S'
      else
        faz := 'N'
    end;

    if faz = 'S' then
    begin

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Menu Nivel 1' then
      begin
        // <li>
        // <a href="#"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">App Views</span></a>
        // <ul>

        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '          <li class="treeview"> ' + #13 + #10 +
          '            <a href="javascript: void(0);"> ' + #13 + #10 +
          '              <i class="' + Controller.DM.FDQMenuICONE.AsString +
          '">&nbsp;</i>&nbsp; ' + #13 + #10 + '                <span>' +
          Controller.DM.FDQMenuDESCRICAO.AsString + '</span> ' + #13 + #10 +
          '              <span class="pull-right-container"> ' + #13 + #10 +
          '                <i class="fa fa-angle-left pull-right"></i>  ' + #13
          + #10 + '               </span>          ' + #13 + #10 +
          '            </a> ' + #13 + #10 +
          '            <ul class="treeview-menu"> ' + #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Item Nivel 1' then
      begin
        // <li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '							<li> ' + #13 + #10 +
          '							  <a href="javascript: SetaAcao(''Menu'', ''' +
          Controller.DM.FDQMenuNOMEFORM.AsString + ''');"> ' + #13 + #10 +
          '              <i class="' + Controller.DM.FDQMenuICONE.AsString +
          '">&nbsp;</i>&nbsp; ' + #13 + #10 + '							    ' +
          Controller.DM.FDQMenuDESCRICAO.AsString + #13 + #10 +
          '							  </a> ' + #13 + #10 + '							</li> ' +
          #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Item' then
      begin
        // <li>
        // <a href="projects.html"><i class="fa fa-file-text-o"></i><span class="menu-item-parent"> Projects</span></a>
        // </li>
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '							<li> ' + #13 + #10 +
          '							  <a href="javascript: SetaAcao(''Menu'', ''' +
          Controller.DM.FDQMenuNOMEFORM.AsString + ''');"> ' + #13 + #10 +
          '                  <i class="' + Controller.DM.FDQMenuICONE.AsString +
          '"></i> &nbsp;' + #13 + #10 +
          '							    <span class="menu-item-parent"> ' +
          Controller.DM.FDQMenuDESCRICAO.AsString + '</span> ' + #13 +
          #10 + '							  </a> ' + #13 + #10 + '							</li> ' +
          #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Menu Nivel 2' then
      begin
        // <li>                     não coloquei imagem para os itens, mas podemos colocar
        // <a href="#"><i class="fa fa-comments"></i> Forum Layout</a>
        // <ul>
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '							<li> ' + #13 + #10 +
          '							  <a href="javascript: void(0);"> ' + #13 + #10 +
          '							    ' + Controller.DM.FDQMenuDESCRICAO.AsString + #13 +
          #10 + '							  </a> ' + #13 + #10 + '                <ul> ' +
          #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Item Nivel 2' then
      begin
        // <li><a href="forum.html">General View</a></li>
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '									<li> ' + #13 + #10 +
          '									  <a href="javascript: SetaAcao(''Menu'', ''' +
          Controller.DM.FDQMenuNOMEFORM.AsString + ''');"> ' + #13 +
          #10 + '									    ' + Controller.DM.FDQMenuDESCRICAO.
          AsString + #13 + #10 + '									  </a> ' + #13 +
          #10 + '									</li> ' + #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Menu Nivel 3' then
      begin
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '						    	<li> ' + #13 + #10 +
          '							      <a href="javascript: void(0);"> ' + #13 +
          #10 + '							        ' + Controller.DM.FDQMenuDESCRICAO.
          AsString + #13 + #10 + '							      </a> ' + #13 + #10 +
          '                    <ul> ' + #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Item Nivel 3' then
      begin
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '                      <li> ' + #13 + #10 +
          '                        <a href="javascript: SetaAcao(''Menu'', ''' +
          Controller.DM.FDQMenuNOMEFORM.AsString +
          ''');" class="menu-item" data-i18n="nav.' +
          Controller.DM.FDQMenuITEM.AsString + '"> ' + #13 + #10 +
          '                          ' + Controller.DM.FDQMenuDESCRICAO.AsString
          + #13 + #10 + '                        </a> ' + #13 + #10 +
          '                      </li> ' + #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Fim Menu 1' then
      begin
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '            </ul> ' + #13 + #10 + '          </li> ' + #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Fim Menu 2' then
      begin
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '                </ul> ' + #13 + #10 + '              </li> ' +
          #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Fim Menu 3' then
      begin
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '                    </ul> ' + #13 + #10 + '                  </li> '
          + #13 + #10;
      end;

      if Controller.DM.FDQMenuNIVELMENU.AsString = 'Fim Menu 4' then
      begin
        Controller.MenuPrincipal := Controller.MenuPrincipal +
          '                    </ul> ' + #13 + #10 + '                  </li> '
          + #13 + #10;
      end;

    end;
    Controller.DM.FDQMenu.Next;
  end;
  Controller.MenuPrincipal := Controller.MenuPrincipal + '  </ul> ' + #13 + #10;
  Controller.MenuPrincipal := Controller.MenuPrincipal + '</nav> ' + #13 + #10;
  Controller.DM.FDQMenu.Close;
  // FIM MONTAGEM MENU
end;


end.
