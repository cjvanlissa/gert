#' GIt Tag
#'
#' Create and list tags.
#'
#' @export
#' @rdname git_tag
#' @param match pattern to filter tags (use `*` for wildcard)
#' @useDynLib gert R_git_tag_list
git_tag_list <- function(match = "*", repo = '.'){
  if(is.character(repo))
    repo <- git_open(repo)
  match <- as.character(match)
  .Call(R_git_tag_list, repo, match)
}

#' @rdname git_tag
#' @export
#' @param name tag name
#' @param message tag message
#' @param ref target reference to tag
#' @useDynLib gert R_git_tag_create
git_tag_create <- function(name, message, ref = "HEAD", repo = '.'){
  if(is.character(repo))
    repo <- git_open(repo)
  name <- as.character(name)
  message <- as.character(message)
  .Call(R_git_tag_create, repo, name, message, ref)
}

#' @export
#' @rdname git_tag
#' @useDynLib gert R_git_tag_delete
git_tag_delete <- function(name, repo = '.'){
  if(is.character(repo))
    repo <- git_open(repo)
  name <- as.character(name)
  .Call(R_git_tag_delete, repo, name)
}