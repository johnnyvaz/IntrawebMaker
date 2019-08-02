object IWServerController: TIWServerController
  OldCreateOrder = False
  OnCreate = IWServerControllerBaseCreate
  AppName = 'SisFerragens'
  Description = 'Sistema para Ferragens'
  DisplayName = 'SisFerragens'
  Port = 8099
  ServerResizeTimeout = 0
  ShowLoadingAnimation = True
  SessionTimeout = 3000
  SSLOptions.NonSSLRequest = nsAccept
  SSLOptions.Port = 0
  SSLOptions.SSLVersions = []
  Version = '14.2.8'
  AllowMultipleSessionsPerUser = False
  SecurityOptions.CheckSameIP = False
  LogCommandEnabled = False
  RestartExpiredSession = True
  HTMLLanguage = 'pt-br'
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
end
