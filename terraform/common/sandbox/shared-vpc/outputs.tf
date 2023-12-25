output "project_id" {
  value       = module.shared_vpc.project_id
  description = "The ID of the shared vpc host project"
}

output "subnets" {
  value       = module.shared_vpc.subnets_ids
  description = "The list of subnets"
}