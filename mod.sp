mod "clc_cc_actions" {
  title = "Cloud Covered Actions"
}

#######################
### S3 Bucket Queries
#######################
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
  'S3 w/ Actions' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_s3_bucket
WHERE
  tags ? 'cc_action';
EOQ
}

query "s3_buckets_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  region,
FROM
  aws_s3_bucket
WHERE
  tags -> 'cc_action' is null
GROUP BY
  region;
EOQ
}

query "s3_buckets_bar" {
  sql = <<-EOQ
    with s3_action as (
      select
        region,
        count(*) as action
      from
        aws_s3_bucket
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    s3_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_s3_bucket
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      v.region,
      v.no_action,
      n.action
    from
      s3_noaction as v
      full join s3_action n on v.region = n.region;
EOQ
}


##########################
### EC2 Instance Queries
##########################

query "ec2_instances" {
  sql = <<-EOQ
SELECT
  instance_id AS "Instance ID",
  region AS "Region",
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
  'EC2 w/ Actions' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_instance
WHERE
  tags ? 'cc_action';
EOQ
}

query "ec2_instances_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  region
FROM
  aws_ec2_instance
WHERE
  tags -> 'cc_action' is null
GROUP BY
  region;
EOQ
}

### Bar Chart ###

query "ec2_instances_bar" {
  sql = <<-EOQ
    with ec2_action as (
      select
        region,
        count(*) as action
      from
        aws_ec2_instance
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    ec2_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ec2_instance
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      v.region,
      v.no_action,
      n.action
    from
      ec2_noaction as v
      full join ec2_action n on v.region = n.region;

EOQ
}




##########################
### EBS Volume Queries
##########################
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
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ebs_volume
WHERE
  tags ? 'cc_action';
EOQ
}

query "ebs_volumes_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ebs_volume
WHERE
  tags -> 'cc_action' is null;
EOQ
}

##########################
### EBS Snapshot Queries
##########################

query "ebs_snapshots" {
  sql = <<-EOQ
SELECT
  snapshot_id AS "Snapshot ID",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ebs_snapshot
WHERE
  tags ? 'cc_action';
EOQ
}

query "ebs_snapshots_count" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ebs_snapshot
WHERE
  tags ? 'cc_action';
EOQ
}

query "ebs_snapshots_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ebs_snapshot
WHERE
  tags -> 'cc_action' is null;
EOQ
}

#################################
### Application Load Balancer
#################################

query "alb" {
  sql = <<-EOQ
SELECT
  arn AS "ALB ARN",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ec2_application_load_balancer
WHERE
  tags ? 'cc_action'
EOQ
}

query "alb_count" {
  sql = <<-EOQ
SELECT
  'ALB w/ Action' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_application_load_balancer
WHERE
  tags ? 'cc_action';
EOQ
}

query "alb_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_application_load_balancer
WHERE
  tags -> 'cc_action' is null;
EOQ
}

##########################
### Elastic IP Queries
##########################

query "eip" {
  sql = <<-EOQ
SELECT
  public_ip AS "IP",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_vpc_eip
WHERE
  tags ? 'cc_action'
EOQ
}

query "eip_count" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_vpc_eip
WHERE
  tags ? 'cc_action'
  and tags ->> 'cc_ignore' is null;
EOQ
}

query "eip_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_vpc_eip
WHERE
  tags ->> 'cc_action' is null;
EOQ
}
