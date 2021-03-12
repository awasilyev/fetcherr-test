variable "namespaces" {
  type        = list(string)
  description = "namespaces"
  default     = []
}

variable "bindings" {
  type = map(list(string))
}
