# terraform


terraform get - this command will first load all the modules

Modules - in Terraform are used to group multiple resource

Map Variables --Map is a lookuptable, where you specify multiple keys with different values.
You can then pick the value depending on the key.

terraform destroy

We have successfully create EC2 instance and destroy it completely.

Terraform plan — this command shows you what applying do by checking the template, state file, and actual state of the resource. It is recommended to use this before running apply command to ensure accidental deletion of any resources

terraform validate — to check the syntax of the file

terraform fmt- to do the formatting of the file

“terraform init”.--

Reason: Could not satisfy plugin requirements.

Plugins are external binaries that Terraform uses to access and manipulate
resources. The configuration provided requires plugins which can’t be located,
don’t satisfy the version constraints, or are otherwise incompatib
