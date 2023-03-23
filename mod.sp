mod "clc_cc_actions" {
  title = "Cloud Covered Actions"
}


### S3 Bucket Queries
query "s3_buckets" {
    sql = <<-EOQ
SELECT
  name AS bucket_name,
  region,
  split_part(tags ->> 'cc_action', '@',
    1) AS action,
  split_part(tags ->> 'cc_action', '@',
    2) AS date
FROM
  aws_s3_bucket
WHERE
  tags ? 'cc_action';
EOQ
}

query "s3_buckets_count" {
    sql = <<-EOQ
SELECT
  count(*) AS number_of_buckets
FROM
  aws_s3_bucket
WHERE
  tags ? 'cc_action';
EOQ
}

### EC2 Instance Queries
query "ec2_instances" {
   sql = <<-EOQ
SELECT
  instance_id AS instance_id,
  region,
  tags ->> 'cc_action' AS cc_action,
  split_part(tags ->> 'cc_action', '@',
    1) AS action,
  split_part(tags ->> 'cc_action', '@',
    2) AS date
FROM
  aws_ec2_instance
WHERE
  tags ? 'cc_action';
EOQ      
}

query "ec2_instances_count" {
   sql = <<-EOQ
SELECT
count(*) AS number_of_instances
FROM
  aws_ec2_instance
WHERE
  tags ? 'cc_action';
EOQ      
}
