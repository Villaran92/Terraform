locals {
  sufix = "${var.etiquetas.Project}-${var.etiquetas.env}" #recurso-cerberus-dev
}

resource "random_string" "sufijo_s3" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-sufix = "${var.etiquetas.Project}-${random_string.sufijo_s3.id}"
}
