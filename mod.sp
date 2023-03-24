mod "clc_cc_actions" {
  title = "Cloud Covered Actions"
}


### S3 Bucket Queries
query "s3_buckets" {
  sql = <<-EOQ
SELECT
  name AS "Bucket Name",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_s3_bucket
WHERE
  tags ? 'cc_action';
EOQ
}

query "s3_buckets_count" {
  sql = <<-EOQ
SELECT
  count(*) AS "Number Buckets with Action"
FROM
  aws_s3_bucket
WHERE
  tags ? 'cc_action';
EOQ
}

query "s3_buckets_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) AS "Number Buckets no Action"
FROM
  aws_s3_bucket
WHERE
  tags -> 'cc_action' is null;
EOQ
}

##########################
### EC2 Instance Queries
query "ec2_instances" {
   sql = <<-EOQ
SELECT
  instance_id AS "Instance ID",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ec2_instance
WHERE
  tags ? 'cc_action';
EOQ      
}

query "ec2_instances_count" {
  sql = <<-EOQ
SELECT
  count(*) AS "EC2 with Action"
FROM
  aws_ec2_instance
WHERE
  tags ? 'cc_action';
EOQ      
}
query "ec2_instances_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) AS "EC2 no Action"
FROM
  aws_ec2_instance
WHERE
  tags -> 'cc_action' is null;
EOQ      
}

##########################
### EBS Volume Queries
query "ebs_volumes" {
  sql = <<-EOQ
SELECT
  volume_id AS "Volume ID",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ebs_volume
WHERE
  tags ? 'cc_action';
EOQ
}

query "ebs_volumes_count" {
  sql = <<-EOQ
SELECT
  count(*) AS "EBS Vols with Action"
FROM
  aws_ebs_volume
WHERE
  tags ? 'cc_action';
EOQ
}

query "ebs_volumes_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) AS "EBS Vols NO Action"
FROM
  aws_ebs_volume
WHERE
  tags -> 'cc_action' is null;
EOQ
}
