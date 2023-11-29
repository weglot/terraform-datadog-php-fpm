variable "process_limit_enabled" {
  type    = bool
  default = true
}

variable "process_limit_warning" {
  type    = number
  default = null
}

variable "process_limit_critical" {
  type    = number
  default = 1
}

variable "process_limit_evaluation_period" {
  type    = string
  default = "last_15m"
}

variable "process_limit_note" {
  type    = string
  default = ""
}

variable "process_limit_docs" {
  type    = string
  default = ""
}

variable "process_limit_filter_override" {
  type    = string
  default = ""
}

variable "process_limit_alerting_enabled" {
  type    = bool
  default = true
}

variable "process_limit_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}
