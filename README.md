# Terraform Tutorial With GCP

구성
- Cloud Run 2개 ( For FE, BE Server)
- Storage 1개 ( For Static File Serving )


### TODO
- Load Balacner With HTTPS 
- workspace를 이용한 namespace 분리 가능
- SSL 인증서 provisioning using workspace ?
- google cloud build resource with webhook 찾아보기
- 단일 url map 이용해서 hostname/path base load balacing
### 사용법
1. variables.tf 내부에 변수 정의 필요
```
variable "project" {
  default = "loremipsum"
}
```