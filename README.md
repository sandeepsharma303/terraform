
if some one in our team has perform terraform apply with in same time another person perform terraform apply 

state lock has been created.
===================================


root@ip-172-31-24-242:~/terraform# terraform apply
╷
│ Error: Error acquiring the state lock
│ 
│ Error message: operation error S3: PutObject, https response error StatusCode: 412, RequestID: 6PKZFVEYT3BW4P2Q, HostID:
│ 157DEE/eV1WrKZMe7c7k88FIAt0wfGB8k5qQcOPUF++2AwArL8eDMQeH4KJwLcI6elXDRDEZx34fRYT8+noUxByGG1ixIA4y, api error PreconditionFailed: At least one of the pre-conditions you
│ specified did not hold
│ Lock Info:
│   ID:        0c75e16a-f3f8-4161-65d0-7a53ef217a8b
│   Path:      test-string-new-listed-new/env:/dev/terraform.tfstate
│   Operation: OperationTypeApply
│   Who:       root@ip-172-31-24-242
│   Version:   1.15.6
│   Created:   2026-08-25 15:21:05.494036376 +0000 UTC
│   Info:      
│ 
│ 
│ Terraform acquires a state lock to protect the state from being written
│ by multiple users at the same time. Please resolve the issue above and try
│ again. For most commands, you can disable locking with the "-lock=false"
│ flag, but this is not recommended.



aws s3 nucket has file name :

terraform.tfstate.tflock

so need to unlcok the lock so update in team not performing action as lock has been created


terrfaorm forec-unlock   0c75e16a-f3f8-4161-65d0-7a53ef217a8b

