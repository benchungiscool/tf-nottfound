variable "cluster_name" {
  type = string
  validation {
    condition = length(var.cluster_name) <= 40
  }
}

variable "resource_environment" {
  type = string
  description = "Denotes which environment these resources are being created for."
  validation {
    condition     = var.resource_category == "qa" | var.resource_category == "prod"
    error_message = "ERROR: var.resource_category must either be qa or prod."
  }
}

variable "create" {
  type        = bool
  description = "Set to true to create resources. By default set to false."
  default     = false
}

variable "node_count" [
  type        = integer
  default     = 2
  description = "Number of worker nodes to spin up."
]

variable "ssh_keys" {
  type        = list(string)
  description = "List of ssh pubkeys"
}

variable "master_size_override" {
  type        = string
  description = "The master size is cx11, use this variable to specify a different server size."
  default     = "UNSET"
}

variable "node_size_override" {
  type        = string
  description = "The default node size is cpx11, use this variable to specify a different server size."
  default     = "UNSET"
}
