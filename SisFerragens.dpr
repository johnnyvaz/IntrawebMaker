program SisFerragens;

uses
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  Forms,
  IWStart,
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Extenso in 'Extenso.pas',
  funcoes in 'funcoes.PAS',
  SweetAlerts in 'SweetAlerts.pas',
  U_DM in 'U_DM.pas' {DM: TDataModule},
  U_FrmDesenho in 'form\U_FrmDesenho.pas' {frmDesenho: TIWAppForm},
  U_FrmPadrao in 'U_FrmPadrao.pas' {FrmPadrao: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);

end.
