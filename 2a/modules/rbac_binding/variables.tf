variable "namespace" {
  type        = string
  description = "namespaces"
  default     = "default"
}

variable "bindings" {
  type = map(list(string))
}
