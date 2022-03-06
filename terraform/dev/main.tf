#ローカル開発用
#動画保存用のs3バケットだけ作成する
terraform {
  backend "s3" {
    bucket = "remote-cam-dev-tf-backend"
    key    = "example/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}