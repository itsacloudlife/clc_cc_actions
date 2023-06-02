dashboard "load_balancers_dashboard" {
    title = "Load Balancer Actions"
    text{
        value = "This dashboard contains Load Balancers resources identified by the Cloud Covered platform"
    }

    // Classic Load Balancers
    container {
        width = 12
        text {
            value = "# Classic Load Balancers"
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        card {
            sql = query.clb_count.sql
            width = 2
        }

        table {
            width = 6
            sql = query.clb.sql
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
            title = "Classic Load Balancer Actions per Region"

            legend {
                display = "auto"
                position = "top"
            }

            series action {
                title = "CLB with actions"
                color = "red"
            }

            series no_action {
                title = "CLB w/o actions"
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
            sql = query.clb_actions_bar.sql
        }
    }

    // Application Load Balancers
    container {
        width = 12
        text {
            value = "# Application Load Balancers"
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        card {
            sql = query.alb_count.sql
            width = 2
        }

        table {
            width = 6
            sql = query.alb.sql
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
            title = "Application Load Balancer Actions per Region"

            legend {
                display = "auto"
                position = "top"
            }

            series action {
                title = "ALB with actions"
                color = "red"
            }

            series no_action {
                title = "ALB w/oactions"
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
            sql = query.alb_actions_bar.sql
        }
    }

    // Network Load Balancers
    container {
        width = 12
        text {
            value = "# Network Load Balancers"
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        card {
            sql = query.nlb_count.sql
            width = 2
        }

        table {
            width = 6
            sql = query.nlb.sql
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
            title = "Network Load Balancer Actions per Region"

            legend {
                display = "auto"
                position = "top"
            }

            series action {
                title = "NLB with actions"
                color = "red"
            }

            series no_action {
                title = "NLB w/o actions"
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
            sql = query.nlb_actions_bar.sql
        }
    }
}
