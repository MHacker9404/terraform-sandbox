data "aws_ssm_parameter" "mysql_admin_password" {
  name = "/tuar/mysql_admin_password"
  with_decryption = true
}
