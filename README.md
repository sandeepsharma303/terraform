terraform apply
       │
       ▼
Read Configuration (.tf files)
       │
       ▼
Initialize Providers & Modules
       │
       ▼
Read Terraform State
       │
       ▼
Build Dependency Graph (DAG)
       │
       ├── Detect Implicit Dependencies
       ├── Detect Explicit Dependencies
       └── Check for Circular Dependencies
       │
       ▼
Refresh Infrastructure State
       │
       ▼
Create Execution Plan
       │
       ▼
Execute Resources
       │
       ├── Independent Resources → Parallel
       └── Dependent Resources → Sequential
       │
       ▼
Update terraform.tfstate
