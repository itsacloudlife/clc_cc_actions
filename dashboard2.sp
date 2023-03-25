  
dashboard "clc_cc_actions_two" {

    title = "Cloud Covered Actions Two"
    
    text{
        value = "This dashboard contains resources that have been identified by the Cloud Covered platform"
    }

container {
    width = 10
}
container {
    width = 2
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_637119421cde40008444ac9cb295f1bd~mv2.png"
      alt = "Cloudlife Logo"
    }
}


container {
    width = 12
    text {
        value = "## S3 buckets"
    }

  image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 1
    }

    card {
        sql = query.s3_buckets_count.sql
        width = 2
    }
    card {
        sql = query.s3_buckets_count_nocc.sql
        width = 2
    }

    table {
        width = 6
        sql = query.s3_buckets.sql
    }
}

container {
    width = 12
    text {
        value = "## EC2 Instances"
    }
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
      width = 1
    }

    card {
        sql = query.ec2_instances_count.sql
        width = 2
    }
    card {
        sql = query.ec2_instances_count_nocc.sql
        width = 2
    }

    table {
        width = 6
        sql = query.ec2_instances.sql
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



}



