variable "region" {
  description = "Região aonde será provisionado os recursos"
  type        = string
  default     = "us-east-1"
}

variable "instance" {
  description = "Variáveis informações das instâncias"
  type        = map(any)
  default = {
    "settings" = {
      type           = "t2.micro"
      subnet_id      = "subnet-0afe58a21051df916"
      security_group = "sg-033bd72986d837288"
      count          = "2"
      ami            = "ami-007855ac798b5175e"
      key_pair       = "aws-key"
    }
  }
}
