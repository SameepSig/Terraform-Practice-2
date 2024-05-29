resource "aws_db_subnet_group" "sameep_db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [var.sameep_terraform_subnet_private_1,var.sameep_terraform_subnet_private_2]

  tags = {
    Name = "sameep DB subnet group"
    silo = "intern2"
    owner = "sameep.sigdel"
    terraform = "true"
    environment = "dev"
  }
}

resource "aws_db_instance" "sameep_private_db_1" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "root1234"
  skip_final_snapshot  = true
  multi_az = true
  db_subnet_group_name = aws_db_subnet_group.sameep_db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]

  tags = {
    Name = "sameep DB"
    silo = "intern2"
    owner = "sameep.sigdel"
    terraform = "true"
    environment = "dev"
  }
}

# I think this is for read replica
# resource "aws_db_instance" "sameep_private_db_standby_1" {
#   allocated_storage = 10
#   engine           = aws_db_instance.sameep_private_db_1.engine
#   engine_version   = aws_db_instance.sameep_private_db_1.engine_version
#   db_instance_class = aws_db_instance.sameep_private_db_1.db_instance_class

#   replication_source_identifier = aws_db_instance.sameep_private_db_1.id
#   vpc_security_group_ids = [var.db_security_group_id]

#   tags = {
#     Name = "sameep DB Standby"
#     silo = "intern2"
#     owner = "sameep.sigdel"
#     terraform = "true"
#     environment = "dev"
#   }

# }