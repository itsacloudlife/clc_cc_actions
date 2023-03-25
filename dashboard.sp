  
dashboard "clc_cc_actions" {
  image {
      src = "https://static.wixstatic.com/media/a5e8fd_846d417cf98c4d1891d8c5e22d13ae32~mv2.png/v1/fill/w_174,h_52,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/horizontal_logo-whiteBackground.png"
      alt = "Cloudlife Logo"
    }

    title = "Cloud Covered Actions"
    
    text{
        value = "This dashboard contains resources that have been identified by the Cloud Covered platform"
    }



container {
    width = 6
    text {
        value = "## S3 buckets"
    }

    card {
        sql = query.s3_buckets_count.sql
        width = 4
    }
    card {
        sql = query.s3_buckets_count_nocc.sql
        width = 4
    }

    table {
        sql = query.s3_buckets.sql
    }
}

container {
    width = 6
    text {
        value = "## EC2 Instances"
    }

    card {
        sql = query.ec2_instances_count.sql
        width = 4
    }
    card {
        sql = query.ec2_instances_count_nocc.sql
        width = 4
    }

    table {
        sql = query.ec2_instances.sql
    }
}


container {
    width = 6
    text {
        value = "## EBS Volumes"
    }

    card {
        sql = query.ebs_volumes_count.sql
        width = 4
    }
    card {
        sql = query.ebs_volumes_count_nocc.sql
        width = 4
    }

    table {
        sql = query.ebs_volumes.sql
    }
}

container {
    width = 6
    text {
        value = "## ALBs"
    }

    card {
        sql = query.alb_count.sql
        width = 4
    }
    card {
        sql = query.alb_count_nocc.sql
        width = 4
    }

    table {
        sql = query.alb.sql
    }
}



}



