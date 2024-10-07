variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "zone_name" {
    default = "expense.fun"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "frontend"
    }
}

variable "app_version" {
    
}