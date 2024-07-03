
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Php Fpm

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [Process Limit](#process-limit) | True | 2  | `sum(last_15m):sum:php_fpm.processes.max_reached{tag:xxx} by {host,service}.as_count() > 1` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Process Limit

Query:
```terraform
sum(last_15m):sum:php_fpm.processes.max_reached{tag:xxx} by {host,service}.as_count() > 1
```

| variable                        | default  | required | description                      |
|---------------------------------|----------|----------|----------------------------------|
| process_limit_enabled           | True     | No       |                                  |
| process_limit_warning           | None     | No       |                                  |
| process_limit_critical          | 1        | No       |                                  |
| process_limit_evaluation_period | last_15m | No       |                                  |
| process_limit_note              | ""       | No       |                                  |
| process_limit_docs              | ""       | No       |                                  |
| process_limit_filter_override   | ""       | No       |                                  |
| process_limit_alerting_enabled  | True     | No       |                                  |
| process_limit_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Status Check

| variable                      | default  | required | description  |
|-------------------------------|----------|----------|--------------|
| status_check_enabled          | True     | No       |              |
| status_check_alerting_enabled | True     | No       |              |


## Module Variables

| variable             | default  | required | description                                                                             |
|----------------------|----------|----------|-----------------------------------------------------------------------------------------|
| filter_str           |          | Yes      |                                                                                         |
| env                  |          | Yes      |                                                                                         |
| service              |          | Yes      |                                                                                         |
| service_display_name | None     | No       |                                                                                         |
| notification_channel |          | Yes      |                                                                                         |
| additional_tags      | []       | No       |                                                                                         |
| name_prefix          | ""       | No       |                                                                                         |
| name_suffix          | ""       | No       |                                                                                         |
| restricted_roles     | []       | No       | A list of unique role identifiers to define which roles are allowed to edit the monitor |


