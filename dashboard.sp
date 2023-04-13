  
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
        value = "## S3 Buckets"
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
        value = "## EC2 Instances"
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
        value = "## EBS Volumes"
    }

  image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 1
    }

    card {
        sql = query.ebs_volumes_count.sql
        width = 2
    }
    card {
        sql = query.ebs_volumes_count_nocc.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ebs_volumes.sql
    }
}

container {
    width = 12

    text {
        value = "## EBS Snapshots"
    }
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 1
    }

    card {
        sql = query.ebs_snapshots_count.sql
        width = 2
    }
    card {
        sql = query.ebs_snapshots_count_nocc.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ebs_snapshots.sql
    }
}


container {
    width = 12

    text {
        value = "## ALBs"
    }
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 1
    }

    card {
        sql = query.alb_count.sql
        width = 2
    }
    card {
        sql = query.alb_count_nocc.sql
        width = 2
    }

    table {
        width = 6
        sql = query.alb.sql
    }
}


container {
    width = 12
    text {
        value = "## EIP"
    }
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 1
    }

    card {
        sql = query.eip_count.sql
        width = 2
        label = "EIP"
    }
    card {
        sql = query.eip_count_nocc.sql
        width = 2
    }

    table {
        width = 6
        sql = query.eip.sql
    }
}

}



