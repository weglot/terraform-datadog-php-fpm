module "status-check" {
  source  = "kabisa/service-check-monitor/datadog"
  version = "2.0.0"

  name        = "PHP-FPM - Status check"
  metric_name = "php_fpm.can_ping"
  by_tags     = ["host"]

  include_tags = ["env:${var.env}", "service:${var.service}"]

  alert_message    = "PHP-FPM is not running on ${var.service} node {{host.name}}."
  recovery_message = "PHP-FPM is back up-and-running on ${var.service} node {{host.name}}."

  require_full_window = false
  no_data_timeframe   = 2
  notify_no_data      = false

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.status_check_enabled
  alerting_enabled   = var.status_check_alerting_enabled
  critical_threshold = 1
  ok_threshold       = 1
  priority           = 2
  docs               = "This monitor raises alerts when the agent is unable to get a pong from the PHP-FPM ping URL."
}
