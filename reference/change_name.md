# Change R package name

Change R package name from 'templateRpackage' to the chosen new name, by
replacing all mentions to 'templateRpackage' within files and file
names. Note this function is potentially dangerous, as it changes file
names and contents, and deleted the entire 'man' folder. Only run this
function just after creating the new repository from the template.

## Usage

``` r
change_name(new.name = NULL, gh.user = NULL)
```

## Arguments

- new.name:

  character. New name of the package.

- gh.user:

  character. GitHub user or organisation name where the new repository
  is hosted.

## Value

Modified file names and contents.

## Details

Inspired on the [changer](https://cran.r-project.org/package=changer)
package by Jouni Helske.
