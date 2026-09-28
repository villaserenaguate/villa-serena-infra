resource "github_repository_ruleset" "main" {
  for_each = github_repository.repositories

  name        = "protect-main"
  repository  = each.value.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    pull_request {
      required_approving_review_count = 1

      dismiss_stale_reviews_on_push     = true
      require_last_push_approval        = true
      required_review_thread_resolution = true

      allowed_merge_methods = [
        "squash"
      ]
    }
  }
}
