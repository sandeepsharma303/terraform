I have manually create s3 in aws console so i need to import the s3  inside the module
============================================================================================


 need to create the s3 resource inside the module 
 ====================================================
 
/root/terraform/modules/s3_bucket

resourec "aws_s3_bucket "test " {
bucket = "new-s3-bucket-iam"
 }


Apply in terrform 
====================
├── README.md
├── backend.tf
├── gitissue
├── main.tf
├── modules
│   ├── ec2_instance
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   └── variable.tf
│   └── s3_bucket
│       ├── main.tf
│       └── provider.tf
├── provider.tf
├── terraform-dev.tfvars
├── terraform-prod.tfvars
├── tfplan
└── variable.tf

in root ]  terraform import module.s3_bucket.aws_s3_bucket.test  new-s3-bucket-iam

          terraform apply 


