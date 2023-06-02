dashboard "s3_buckets_dashboard" {
    title = "S3 Actions"
    text{
        value = "This dashboard contains S3 Buckets resources identified by the Cloud Covered platform"
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
}
