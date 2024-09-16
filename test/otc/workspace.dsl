workspace "Open Telekom Cloud Example" "An example OTC deployment architecture." {

    model {
        themeTest = softwaresystem "2 tier Layout" "Enables deployment of simple network layout to the Open Telekom Cloud with terraform/opentofu" {

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
                    }
                }
            }

            publicSubnet -> publicSubnet "Forwards requests to" "HTTPS"
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