# Deploy simple php to heroku with Terraform

A barebones PHP app that makes use of the [Silex](http://silex.sensiolabs.org/) web framework, which can easily be deployed to Heroku.

This application supports the [Getting Started with PHP on Heroku](https://devcenter.heroku.com/articles/getting-started-with-php) article - check it out.

## Deploying to Heroku with terraform

```
git clone https://github.com/ilosaurus/php-getting-started.git
```

```
cd php-getting-started
cd terraform
cat main.tf
```
```
cat provider.tf
```
```
provider "heroku" {
  email   = "EMAIL_ADDRESS"
  api_key = "API_KEY_HEROKU"
}
```
```
cat main.tf
```

```
# random apps name = example_php_apps_ilosaurus 
resource "heroku_app" "example_php_apps_ilosaurus" {
  name = "example_php_apps_ilosaurus"
  region = "us"
}

resource "heroku_build" "example_php_apps_ilosaurus" {
  app = heroku_app.example_php_apps_ilosaurus.name
  buildpacks = ["https://github.com/heroku/heroku-buildpack-php"]

  source = {
    url = "https://github.com/ilosaurus/php-getting-started/archive/1.1.2.tar.gz"
    version = "1.1.2"
  }
}

```

```
cat output.tf
```
```
output "ilhamtesting771_app_url" {
  value = "https://${heroku_app.example_php_apps_ilosaurus.name}.herokuapp.com"
}
```

```
terraform init
terraform validate
terraform plan
terraform apply
```


## Reference
https://www.terraform.io/docs/providers/heroku/index.html