locals {
  collaborators = [
    "alexanderCanon",
    "Kym-22",
    "Reyes209c",
    "Josssueee",
    "ppalaciosm-cyber"
  ]

  repository_collaborators = {
    for pair in setproduct(
      keys(local.repositories),
      local.collaborators
    ) :
    "${pair[0]}-${pair[1]}" => {
      repository_key = pair[0]
      username       = pair[1]
    }
  }
}

resource "github_repository_collaborator" "collaborators" {
  for_each = local.repository_collaborators

  repository = github_repository.repositories[each.value.repository_key].name
  username   = each.value.username
  permission = "push"
}
