dashboard "clc_cc_actions" {
  title = "Cloud Covered Actions"
  
text{
    value = "This dashboard contains resources that have been identified by the Cloud Covered platform"
}
container {
    width = 6
    text {
        value = "### S3 buckets"
    }

    card {
        sql = query.s3_buckets_count.sql
        width = 4
    }

    table {
        sql = query.s3_buckets.sql
    }
}

container {
    width = 6
    text {
        value = "### EC2 Instances"
    }

    card {
        sql = query.ec2_instances_count.sql
        width = 4
    }

    table {
        sql = query.ec2_instances.sql
    }
}






}



