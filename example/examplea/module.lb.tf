module "lb" {
  source = "../../"
  subnet_ids=["subnet-03fdfb13a135366a7","subnet-08d97e381dbc80d40","subnet-05a6a6de2f4989d22"]
  lb_name = "exmpl"
}

