dashboard "ebs_volumes_snapshots_dashboard" {
    title = "EBS Volumes and Snapshots Actions"
    text{
        value = "This dashboard contains EBS Volumes and Snapshots resources identified by the Cloud Covered platform"
    }

    // EBS Volumes
    container {
        width = 12
        text {
            value = "# EBS Volumes"
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        card {
            sql = query.ebs_volumes_count.sql
            width = 2
        }

        table {
            width = 6
            sql = query.ebs_volumes.sql
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
            title = "EBS Volume Actions per Availability Zone"

            legend {
                display = "auto"
                position = "top"
            }

            series action {
                title = "EBS with actions"
                color = "red"
            }

            series no_action {
                title = "EBS w/o actions"
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
            sql = query.ebs_volumes_bar.sql
        }
    }

    // EBS Snapshots
    container {
        width = 12
        text {
            value = "# EBS Snapshots"
        }

        image {
            src = "https://static.wixstatic.com/media/a5e8fd_f41f85fbcbf8490db53862c1e7cb4eac~mv2.png"
            width = 2
        }

        card {
            sql = query.ebs_snapshots_count.sql
            width = 2
        }

        table {
            width = 6
            sql = query.ebs_snapshots.sql
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
            title = "EBS Snapshot Actions per Region"

            legend {
                display = "auto"
                position = "top"
            }

            series action {
                title = "EBS Snapshots with actions"
                color = "red"
            }

            series no_action {
                title = "EBS Snapshots w/o actions"
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
            sql = query.ebs_snapshots_bar.sql
        }
    }
}
