dashboard "elastic_ip_dashboard" {
    title = "Elastic IP Actions"
    text{
        value = "This dashboard contains Elastic IP Addresses resources identified by the Cloud Covered platform"
    }

    container {
        width = 12
        text {
            value = "# Elastic IP Addresses"
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        card {
            sql = query.eip_count.sql
            width = 2
        }

        table {
            width = 6
            sql = query.eip.sql
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        chart {
            width = 8
            type = "bar"
            title = "Elastic IP Actions per Region"

            legend {
                display = "auto"
                position = "top"
            }

            series action {
                title = "EIP with actions"
                color = "red"
            }

            series no_action {
                title = "EIP w/o actions"
                color = "green"
            }

            axes { 
                x {
                    title {
                        value = "Totals"
                    }
                    labels {
                        display = "show"
                    }
                }
                y {
                    title {
                    }
                    labels {
                        display = "show"
                    }
                }
            }
            sql = query.eip_actions_bar.sql
        }
    }
}
