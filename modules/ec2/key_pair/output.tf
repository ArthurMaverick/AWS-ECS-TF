output "key_pair_arn" {
  value = aws_key_pair.deploy_public_key.arn
}

output "key_pair_id" {
  value = aws_key_pair.deploy_public_key.id
}

output "key_pair_name" {
  value = aws_key_pair.deploy_public_key.key_name
}