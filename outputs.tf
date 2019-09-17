locals {
  this_id                           = compact(coalescelist(aws_instance.this.*.id, [""]))
  #this_id                           = "${compact(concat(coalescelist(aws_instance.this.*.id, list("")))}"}
  #this_id                           = "${compact(concat(coalescelist(aws_instance.this.*.id, aws_instance.this_t2.*.id), list("")))}"}
}

output "id" {
  description = "List of IDs of instances"
  value       = local.this_id
}
