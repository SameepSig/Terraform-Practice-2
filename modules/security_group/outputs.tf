output security_group_id {
    description = "The ID of the security group"
    value = "${aws_security_group.sameep_sg.id}"
}

output db_security_group_id {
    description = "The ID of the security group"
    value = "${aws_security_group.sameep_db_sg.id}"
}