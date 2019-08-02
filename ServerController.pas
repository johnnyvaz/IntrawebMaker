unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  UserSessionUnit, IWApplication, IWAppForm, IW.Browser.Browser,
  IW.HTTP.Request, IW.HTTP.Reply;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);
    procedure IWServerControllerBaseCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

function Controller: TIWUserSession;
function IWServerController: TIWServerController;

implementation

{$R *.dfm}

uses
  IWInit, IWGlobal, System.IniFiles;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

function Controller: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

{ TIWServerController }

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
var
  ArqIni: TiniFile;
begin
  if FileExists('.\config.ini') then
  begin
    ArqIni := TiniFile.Create('.\config.ini');
    Port := StrtoInt(ArqIni.ReadString('CONFIG', 'Porta', '8099'));
    SessionTimeout := StrtoInt(ArqIni.ReadString('CONFIG', 'SessionTimeout',
      '30000'));
    ArqIni.Free;
  end;
end;

procedure TIWServerController.IWServerControllerBaseNewSession
  (ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil, ASession);
end;

initialization

TIWServerController.SetServerControllerClass;

end.
