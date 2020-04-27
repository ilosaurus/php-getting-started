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