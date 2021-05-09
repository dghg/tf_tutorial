# Terraform Tutorial With GCP

구성
- Cloud Run 2개 ( For FE, BE Server)
- Storage 1개 ( For Static File Serving )


### TODO
- Load Balacner With HTTPS 

### 사용법
1. variables.tf 내부에 변수 정의 필요
```
variable "project" {
  default = "loremipsum"
}
```