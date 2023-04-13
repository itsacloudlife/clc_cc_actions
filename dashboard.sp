  
dashboard "clc_cc_actions_two" {

    title = "Cloud Covered Actions"
    
    text{
        value = "This dashboard contains resources that have been identified by the Cloud Covered platform"
    }

container {
    width = 8
}
container {
    width = 2
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_637119421cde40008444ac9cb295f1bd~mv2.png"
      alt = "Cloudlife Logo"
    }
        image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 2
    }
}


container {

    width = 12
    text {
        value = "# S3 Buckets"
    }

    image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 2
    }

    card {
        sql = query.s3_buckets_count.sql
        width = 2
    }
 
    table {
        width = 6
        sql = query.s3_buckets.sql
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
        title = "S3 Bucket Actions per Region"

        legend {
            display = "auto"
            position = "top"
        }

        series action {
            title = "S3 with actions"
            color = "red"
        }

        series no_action {
            title = "S3 w/o actions"
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
                    display = "auto"
                }
            }

        }
        sql = query.s3_buckets_bar.sql
    }

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
        value = "# EBS Volumes"
    }

    image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 2
    }

    card {
        sql = query.ebs_volumes_count.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ebs_volumes.sql
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
        title = "EBS Volume Actions per Availability Zone"

        legend {
            display = "auto"
            position = "top"
        }

        series action {
            title = "EBS with actions"
            color = "red"
        }

        series no_action {
            title = "EBS w/o actions"
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
        sql = query.ebs_volumes_bar.sql
    }

}

container {
    width = 12
    text {
        value = "# EBS Snapshots"
    }

    image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 2
    }

    card {
        sql = query.ebs_snapshots_count.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ebs_snapshots.sql
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
        title = "EBS Snapshot Actions per Region"

        legend {
            display = "auto"
            position = "top"
        }

        series action {
            title = "EBS Snapshots with actions"
            color = "red"
        }

        series no_action {
            title = "EBS Snapshots w/o actions"
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
        sql = query.ebs_snapshots_bar.sql
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
            title = "ALB w/o actions"
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


