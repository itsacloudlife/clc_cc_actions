dashboard "dashboard_gui" {
  title = "Dashboard GUI"

  text {
    value = "Welcome to Dashboard GUI"
  }

  text {
    value = "This is a basic Steampipe dashboard called Dashboard GUI. You can add more text and widgets to customize the dashboard according to your requirements."
  }

  container {
    title = "Sample Container with a Chart and Total Count"

    container {
      width = 6

      card {
        title = "Total S3 Buckets"
        sql = <<-EOQ
          select
              count(*) as "Total Buckets"
          from
              aws_s3_bucket
        EOQ
      }
    }

    container {
      width = 6

      chart {
        type  = "bar"
        title = "AWS S3 Buckets by Region"

        sql = <<-EOQ
          select
              region as Region,
              count(*) as Total
          from
              aws_s3_bucket
          group by
              region
          order by
              Total desc
        EOQ
      }
    }
  }
}
