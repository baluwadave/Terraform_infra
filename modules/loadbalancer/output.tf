

# output "target_group_arns" {
#   value = {
#     for key, attachment in aws_lb_target_group_attachment.target_attachment : key => attachment.target_group_arn
#   }
# }
output "target_group_arn" {
  value = aws_lb_target_group.target_group.arn
  
}