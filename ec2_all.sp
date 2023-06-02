dashboard "ec2_and_ami_dashboard" {

    title = "EC2 and AMI Actions"
    
    text{
        value = "This dashboard provides insights into EC2 Instances and AMIs in the environment"
    }

container {
    width = 12
    text {
        value = "# EC2 Instances"
    }

    image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 2
    }

    card {
        sql = query.ec2_instances_count.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ec2_instances.sql
    }

    chart {
        width = 8
        type = "bar"
        title = "EC2 Instance Actions per Region"

        legend {
            display = "auto"
            position = "top"
        }

        series action {
            title = "EC2 with actions"
            color = "red"
        }

        series no_action {
            title = "EC2 w/o actions"
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
        sql = query.ec2_instances_bar.sql
    }

}

container {
    width = 12
    text {
        value = "# EC2 AMIs"
    }

    image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 2
    }

    card {
        sql = query.ami_count.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ami.sql
    }

    chart {
        width = 8
        type = "bar"
        title = "EC2 AMI Actions per Region"

        legend {
            display = "auto"
            position = "top"
        }

        series action {
            title = "AMI with actions"
            color = "red"
        }

        series no_action {
            title = "AMI w/o actions"
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
        sql = query.ami_actions_bar.sql
    }

}

}
