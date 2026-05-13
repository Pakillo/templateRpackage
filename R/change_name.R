#' Change R package name
#'
#' @description
#' Change R package name from 'templateRpackage' to the chosen new name, by replacing
#' all mentions to 'templateRpackage' within files and file names.
#' Note this function is potentially dangerous, as it changes file names and contents,
#' and deleted the entire 'man' folder.
#' Only run this function just after creating the new repository from the template.
#'
#' @param new.name character. New name of the package.
#' @param gh.user character. GitHub user or organisation name where the new repository
#' is hosted.
#'
#' @returns Modified file names and contents.
#' @details Inspired on the [changer](https://cran.r-project.org/package=changer)
#' package by Jouni Helske.
#' @export
#'

change_name <- function(new.name = NULL, gh.user = NULL) {

  stopifnot(is.character(new.name))
  stopifnot(is.character(gh.user))

  stopifnot(file.exists("DESCRIPTION"))
  stopifnot(file.exists("./templateRpackage.Rproj"))

  message("Deleting 'man' folder. Run devtools::document() afterwards to regenerate it.")
  unlink("man")


  files <- list.files(all.files = TRUE, full.names = TRUE, recursive = TRUE)
  files <- files[!grepl("git/", files)]
  files <- files[!grepl("/.Rproj.user/", files)]

  for (f in files) {
    old <- readLines(f)
    new <- gsub("templateRpackage", new.name, old)
    new <- gsub("Pakillo", gh.user, new)
    cat(new, file = f, sep = "\n")
  }

  file.rename(from = "./templateRpackage.Rproj", to = paste0("./", new.name, ".Rproj"))
  file.rename(from = "./R/templateRpackage-package.R", to = paste0("./R/", new.name, "-package.R"))

}
