workspace "Open Telekom Cloud Example" "An example OTC deployment architecture." {

    model {
        themeTest = softwaresystem "2 tier Layout" "Displays simple network layout in the Open Telekom Cloud" {

        }

        live = deploymentEnvironment "Live" {

            deploymentNode "Cloud Vendor: Open Telekom Cloud" {
                tags " Open Telekom Cloud - Cloud"

                region = deploymentNode "Region: eu-de" {
                    tags " Open Telekom Cloud - Region"

                    deploymentNode "VPC: my-example" {
                        tags " Open Telekom Cloud - VPC"

                        publicSubnet = infrastructureNode "Subnet: public access" {
                            tags " Open Telekom Cloud - VPC subnet"
                        }

                        privateSubnet = infrastructureNode "Subnet: private access" {
                            tags " Open Telekom Cloud - VPC subnet"
                        }
                    }
                }
            }

            publicSubnet -> privateSubnet "Forwards requests to" "HTTPS only"
            privateSubnet -> privateSubnet "Accesses other resource" "TLS"
        }
    }

    views {
        
        deployment themeTest "Live" "OpenTelekomCloudDeployment" {
            include *
            autolayout lr

        }

        styles {
            element "Element" {
                shape roundedbox
                background #ffffff
            }
        }

        theme https://raw.githubusercontent.com/d-lopes/structurizr-themes/main/otc/theme.json
    }

}