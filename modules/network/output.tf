output "subnet_ids" {
    value = [aws_subnet.main_public_1.id, aws_subnet.main_public_2.id, aws_subnet.main_public_3.id]
}