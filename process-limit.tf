locals {
  process_limit_filter = coalesce(
    var.process_limit_filter_override,
    var.filter_str
  )
}

module "process_limit" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name             = "PHP-FPM - Process limit"
  query            = "sum(${var.process_limit_evaluation_period}):sum:php_fpm.processes.max_reached{${local.process_limit_filter}} by {host,service}.as_count() > ${var.process_limit_critical}"
  alert_message    = "Process limit has been reached on node {{host.name}}"
  recovery_message = "Process limit has recovered on node {{host.name}}"

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.process_limit_enabled
  alerting_enabled   = var.process_limit_alerting_enabled
  warning_threshold  = var.process_limit_warning
  critical_threshold = var.process_limit_critical
  priority           = var.process_limit_priority
  docs               = var.process_limit_docs
  note               = var.process_limit_note
}
