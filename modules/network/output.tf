output "subnet_ids" {
    value = [aws_subnet.main_public_1.id, aws_subnet.main_public_2.id, aws_subnet.main_public_3.id]
}

output "cluster_sg_id" {
    value = aws_security_group.cluster_sg.id
}