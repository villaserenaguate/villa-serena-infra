locals {
  repositories = {
    web = {
      name        = "villa-serena-web"
      description = "Web application for Villa Serena"
    }

    movil = {
      name        = "villa-serena-movil"
      description = "Mobile application for Villa Serena"
    }

    api = {
      name        = "villa-serena-api"
      description = "Backend API for Villa Serena"
    }

    docs = {
      name        = "villa-serena-docs"
      description = "Documentation for Villa Serena"
    }

    infra = {
      name        = "villa-serena-infra"
      description = "Infrastructure as Code for Villa Serena"
    }
  }
}

resource "github_repository" "repositories" {
  for_each = local.repositories

  name        = each.value.name
  description = each.value.description

  visibility = "public"

  auto_init = false

  has_issues      = true
  has_wiki        = false
  has_projects    = false
  has_discussions = false

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true

  delete_branch_on_merge = true
}
