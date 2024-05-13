variable "aws_region" {
  description = "região da aws"
  type        = string
  nullable    = false
}


variable "vpc_name" {
  description = "região da aws"
  type        = string
  nullable    = false
}


variable "vpc_cidr" {
  description = "Informar cidr da vpc"
  type        = string
  nullable    = false
}

variable "vpc_azs" {
  description = "informar zonas de disponibilidade do cluster"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_private_subnets" {
  description = "informar subnets privadas"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_public_subnets" {
  description = "informar subnets publicas"
  type        = set(string)
  nullable    = false
}

variable "aws_project_tags" {
  description = "Informar tags do projeto"
  type        = map(any)
  nullable    = false
}

variable "aws_instance_type" {
  description = "tipo da instancia"
  type        = string
  nullable    = false
}

variable "aws_key_name" {
  description = "chave instancia"
  type        = string
  nullable    = false
}

variable "aws_ami" {
  description = "imagem instancia"
  type        = string
  nullable    = false
}