Terraform Refresh and Drift Detection Workflow
Infrastructure Refresh

To check what changes have been made directly in the infrastructure, use Terraform refresh commands.

terraform plan -refresh-only

Checks the current infrastructure and compares it with the Terraform state.

Reads the real infrastructure.
Refreshes the Terraform state in memory.
Does not update the state file.
Does not modify the infrastructure.
terraform plan -refresh-only
terraform apply -refresh-only

Updates the Terraform state to match the real infrastructure without making any changes to the infrastructure itself.

terraform apply -refresh-only

Example

If someone manually changes an AWS resource, running terraform apply -refresh-only updates the Terraform state to reflect those manual changes. The infrastructure remains unchanged.

Initialize Terraform

Initialize Terraform with the backend configuration.

terraform init -backend-config="backend/dev.hcl"

Note

Run this command when setting up the project for the first time on your local machine.
If the backend is already configured, Terraform automatically uses the existing remote state.
Select Workspace

Select the required workspace. If it doesn't exist, create it.

terraform workspace select ${ENV} || terraform workspace new ${ENV}
Validate Configuration

Validate the Terraform configuration before planning.

terraform validate
Drift Detection

Check whether the infrastructure has drifted from the Terraform state.

terraform plan -refresh-only -detailed-exitcode
Exit Codes
Exit Code	Description
0	No drift detected
1	Terraform execution failed
2	Infrastructure drift detected

Example script logic:

terraform plan -refresh-only -detailed-exitcode

case $? in
    0)
        echo "No drift detected"
        ;;
    1)
        echo "Terraform execution failed"
        exit 1
        ;;
    2)
        echo "Infrastructure drift detected"
        ;;
esac
Apply Infrastructure Changes

If someone manually changes AWS resources and those changes are not reflected in your Terraform configuration, Terraform considers them infrastructure drift.

Running the following commands:

terraform plan -out=tfplan
terraform apply tfplan

will:

Compare the Terraform configuration with the actual infrastructure.
Generate an execution plan.
Revert any manual changes made outside Terraform.
Restore the infrastructure to the desired state defined in the Terraform configuration.

Example

Terraform configuration:

instance_type = "t3.micro"

Someone manually changes the EC2 instance in AWS to:

t3.medium

Running:

terraform plan -out=tfplan
terraform apply tfplan

will change the EC2 instance back to t3.micro, because Terraform always treats the configuration files (.tf) as the desired state.











======================================================




so what every changes has been in infra level refresh done the change 


terraform plan -refresh-only means:  check the dersied  the Terraform state to match the real infrastructure

terraform apply -refresh-only means:

Update the Terraform state to match the real infrastructure, without making any changes to the infrastructure itself.



now 


terraform init -backend-config="backend/dev.hcl"   -> use if there si no remote file setup on local 
if state in remote automatically pick



terraform workspace select ${ENV} || terraform workspace new ${ENV}

terraform validate

terraform plan -refresh-only -detailed-exitcode   -- check the drift is yes or not )in command So, yes, if someone manually changed AWS and you did not update your Terraform code, then:

in scruipts  can create the logic 

            ok = 0
            error = 1
	    drift detction = 2




So, yes, if someone manually changed AWS and you did not update your Terraform code, then:
will revert those manual changes and restore the infrastructure to the state defined in your Terraform configuration.


terraform plan -out=tfplan


terraform apply tfplan

