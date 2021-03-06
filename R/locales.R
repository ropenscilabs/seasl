#' List locally stored locales
#'
#' @export
#' @param locale (character) one locale name
#' @return If `locale=NULL`, a list of locales. If `locale` is 
#' not `NULL`, then a full path to the locale file is returned if the 
#' locale exists.
#' @examples
#' # setup
#' csl_cache$cache_path_set("seasl", type = "tempdir")
#' csl_cache$cache_path_get()
#' 
#' # List all locale files
#' csl_locales()
#' 
#' # cleanup
#' csl_cache$delete_all()
#' 
#' \dontrun{
#' # fetch data first
#' csl_fetch_locales()
#' 
#' # List all locale files
#' csl_locales()
#' 
#' # list files
#' csl_locales("et")
#' csl_locales("fr-FR")
#'
#' csl_locale_exists("et")
#' csl_locale_exists("cc")
#' csl_locale_exists("fr-FR")
#' }
csl_locales <- function(locale = NULL) {
  path <- file.path(csl_cache$cache_path_get(), "locales")
  ff <- getfilesloc(path)
  if (is.null(locale)) {
    return(ff)
  } else {
    assert_len(locale, 1)
    locs <- stats::setNames(lapply(ff, function(x){
      tmp <- strsplit(x, split = "-")[[1]][2:3]
      list(both = paste0(tmp, collapse = "-"), first = tmp[[1]], second = tmp[[2]])
    }), ff)

    if ( locale %in% pluck(locs, "first", "") ) {
      file.path(path, paste0(plmatch(locs, "first", locale), ".xml"))
    } else if ( locale %in% pluck(locs, "both") ) {
      file.path(path, paste0(plmatch(locs, "both", locale), ".xml"))
    } else {
      NULL
    }
  }
}

#' @export
#' @rdname csl_locales
csl_locale_exists <- function(locale){
  out <- csl_locales(locale)
  if (is.null(out)) FALSE else TRUE
}

getfilesloc <- function(x) gsub("\\.xml", "", list.files(x, pattern = ".xml"))

plmatch <- function(x, what, loc){
  tmp <- pluck(x, what, "")
  names(tmp[tmp %in% loc])
}
