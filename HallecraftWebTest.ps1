Configuration HallecraftWebTest 
{

    # Import the module that contains the resources we're using.
    Import-DscResource -ModuleName PsDesiredStateConfiguration

    # The Node statement specifies which targets this configuration will be applied to.
    Node 'Mulang-Sandbox' {

        # The first resource block ensures that the Web-Server (IIS) feature is enabled.
        WindowsFeature WebServer {
            Ensure = "Present"
            Name   = "Web-Server"
        }
        
        # The Second resource block ensures that network load balancer is enabled.
        WindowsFeature NetworkLoadBalancer {
            Ensure = "Present"
            Name   = "RSAT-NLB"
        }

        # The third resource block ensures that the website content copied to the website root folder.
        File WebsiteContent {
            Ensure = 'Present'
            SourcePath = 'C:\hallecraft-web\index.html'
            DestinationPath = 'c:\inetpub\wwwroot'
        }

        # The fourth resource block ensures that dns is enabled.
        WindowsFeature DNSServer {
            Ensure = "Present"
            Name   = "DNS"
        }

    }
} 

HallecraftWebTest