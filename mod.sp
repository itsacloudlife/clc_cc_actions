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
  tags ? 'cc_action'
  AND NOT tags ? 'cc_ignore';
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
  tags ? 'cc_action'
  AND NOT tags ? 'cc_ignore';
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
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      ec2_noaction as v
      full join ec2_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
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
  volume_type = 'gp2'
  AND tags ? 'cc_action'
  AND NOT tags ? 'cc_ignore';
EOQ
}

query "ebs_volumes_count" {
  sql = <<-EOQ
SELECT
  'EBS Volumes w/ Actions' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ebs_volume
WHERE
  tags ? 'cc_action'
  AND NOT tags ? 'cc_ignore';
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

query "ebs_volumes_bar" {
  sql = <<-EOQ
    with ebs_action as (
      select
        region,
        count(*) as action
      from
        aws_ebs_volume
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    ebs_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ebs_volume
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      ebs_noaction as v
      full join ebs_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
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
  tags ? 'cc_action'
  AND NOT tags ? 'cc_ignore';
EOQ
}

query "ebs_snapshots_count" {
  sql = <<-EOQ
SELECT
  'EBS Snapshots w/ Actions' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ebs_snapshot
WHERE
  tags ? 'cc_action'
  AND NOT tags ? 'cc_ignore';
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

### EBS Snapshot Bar Chart ###

query "ebs_snapshots_bar" {
  sql = <<-EOQ
    with ebs_snapshots_action as (
      select
        region,
        count(*) as action
      from
        aws_ebs_snapshot
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    ebs_snapshots_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ebs_snapshot
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      ebs_snapshots_noaction as v
      full join ebs_snapshots_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
EOQ
}

#################################
### EC2 AMI
#################################

query "ami" {
  sql = <<-EOQ
SELECT
  image_id AS "AMI ID",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ec2_ami
WHERE
  tags ? 'cc_action'
EOQ
}

query "ami_count" {
  sql = <<-EOQ
SELECT
  'AMI w/ Action' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_ami
WHERE
  tags ? 'cc_action';
EOQ
}

### EC2 AMI Bar Graph ###

query "ami_actions_bar" {
  sql = <<-EOQ
    with ami_action as (
      select
        region,
        count(*) as action
      from
        aws_ec2_ami
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    ami_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ec2_ami
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      ami_noaction as v
      full join ami_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
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

### Application Load Balancer Bar Graph ###

query "alb_actions_bar" {
  sql = <<-EOQ
    with alb_action as (
      select
        region,
        count(*) as action
      from
        aws_ec2_application_load_balancer
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    alb_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ec2_application_load_balancer
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      alb_noaction as v
      full join alb_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
EOQ
}

#################################
### Network Load Balancer
#################################

query "nlb" {
  sql = <<-EOQ
SELECT
  arn AS "NLB ARN",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ec2_network_load_balancer
WHERE
  tags ? 'cc_action'
EOQ
}

query "nlb_count" {
  sql = <<-EOQ
SELECT
  'NLB w/ Action' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_network_load_balancer
WHERE
  tags ? 'cc_action';
EOQ
}

query "nlb_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_network_load_balancer
WHERE
  tags -> 'cc_action' is null;
EOQ
}

### Network Load Balancer Bar Graph ###

query "nlb_actions_bar" {
  sql = <<-EOQ
    with nlb_action as (
      select
        region,
        count(*) as action
      from
        aws_ec2_network_load_balancer
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    nlb_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ec2_network_load_balancer
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      nlb_noaction as v
      full join nlb_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
EOQ
}

#################################
### Classic Load Balancer
#################################

query "clb" {
  sql = <<-EOQ
SELECT
  arn AS "CLB ARN",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_ec2_classic_load_balancer
WHERE
  tags ? 'cc_action';
EOQ
}

query "clb_count" {
  sql = <<-EOQ
SELECT
  'CLB w/ Action' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_ec2_classic_load_balancer
WHERE
  tags ? 'cc_action';
EOQ
}

### Classic Load Balancer Bar Graph ###

query "clb_actions_bar" {
  sql = <<-EOQ
    with clb_action as (
      select
        region,
        count(*) as action
      from
        aws_ec2_classic_load_balancer
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    clb_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_ec2_classic_load_balancer
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      clb_noaction as v
      full join clb_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
EOQ
}
#################################
### VPC Elastic IP Address
#################################

query "eip" {
  sql = <<-EOQ
SELECT
  public_ip AS "Public IP",
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
  'EIP w/ Action' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_vpc_eip
WHERE
  tags ? 'cc_action';
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
  tags -> 'cc_action' is null;
EOQ
}

### VPC Elastic IP Address Bar Graph ###

query "eip_actions_bar" {
  sql = <<-EOQ
    with eip_action as (
      select
        region,
        count(*) as action
      from
        aws_vpc_eip
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    eip_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_vpc_eip
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      eip_noaction as v
      full join eip_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
EOQ
}

#################################
### CloudWatch Log Groups
#################################

query "log_group" {
  sql = <<-EOQ
SELECT
  arn AS "Log Group ARN",
  region as "Region",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 1) AS "Action",
  split_part(  split_part(tags ->> 'cc_action', ':', 2)  , '@', 2) AS "Date",
  split_part(             tags ->> 'cc_action', ':', 1)            AS "Reason"
FROM
  aws_cloudwatch_log_group
WHERE
  tags ? 'cc_action'
EOQ
}

query "log_group_count" {
  sql = <<-EOQ
SELECT
  'Log Group w/ Action' as label,
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_cloudwatch_log_group
WHERE
  tags ? 'cc_action';
EOQ
}

query "log_group_count_nocc" {
  sql = <<-EOQ
SELECT
  count(*) as value,
  case
    when count(*) > 0 then 'alert'
    else 'ok'
  end as type
FROM
  aws_cloudwatch_log_group
WHERE
  tags -> 'cc_action' is null;
EOQ
}

### CloudWatch Log Group Bar Graph ###

query "log_group_actions_bar" {
  sql = <<-EOQ
    with log_group_action as (
      select
        region,
        count(*) as action
      from
        aws_cloudwatch_log_group
      where
        tags ? 'cc_action'
        AND NOT tags ? 'cc_ignore'
      group by
        region
    ),
    log_group_noaction as (
      select
        region,
        count(*) as no_action
      from
        aws_cloudwatch_log_group
      where
        tags -> 'cc_action' is null
      group by
        region
    )
    select
      coalesce(v.region, n.region) as region,
      v.no_action,
      n.action
    from
      log_group_noaction as v
      full join log_group_action n on v.region = n.region
    order by
      coalesce(v.region, n.region);
EOQ
}
