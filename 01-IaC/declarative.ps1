Configuration MyServices
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node MyServer
    {
        Service WindowsUpdate {
            Name        = 'wuauserv'
            State       = 'Running'
            StartupType = 'Automatic'
        }
    }
}