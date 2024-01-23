terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

provider "github" {
  owner = "bestow-code"
}
resource "github_repository" "core_analysis" {
  name        = "core_analysis"
  description = "core_analysis for dart"

  visibility = "public"
}

#data "github_actions_public_key" "example_public_key" {
#  repository = "example_repository"
#}

resource "github_actions_secret" "onepub_token" {
  repository       = "${github_repository.core_analysis.name}"
  secret_name      = "onepub_token"
  plaintext_value  = var.onepub_token
}

variable "onepub_token" {}

resource "github_actions_secret" "example_secret" {
  repository       = "${github_repository.core_analysis.name}"
  secret_name      = "example_secret_name"
  plaintext_value  = var.some_secret_string
}

variable "some_secret_string" {}
