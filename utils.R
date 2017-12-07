get_lemmatized_greek_text <- function(urn) {
  if (!stringr::str_detect(urn, "-grc")) stop("Only lemmatized Greek texts available.", call. = FALSE)
  urn <- stringr::str_replace(urn, "urn:cts:greekLit:", "")
  url <- sprintf("https://raw.githubusercontent.com/daranzolin/LemmatizedAncientGreekXML/master/texts/%s.xml", urn)
  r <- xml2::read_xml(url)
  xml2::as_list(r)
}

filter_list <- function(text_list, excerpt) {
  if (grepl("-", excerpt)) {
    p <- strsplit(excerpt, "-")[[1]]
    p <- strsplit(p, "\\.")
    p1_c <- p[[1]][1]
    p1_v <- as.numeric(p[[1]][2])
    p2_c <- p[[2]][1]
    p2_v <- as.numeric(p[[2]][2])
    if (identical(p1_c, p2_c)) {
      vv <- paste0(p1_c, ".", p1_v:p2_v)
    } else {
      vv <- purrr::map(p1_c:p2_c, paste0, ".", 1:99) %>%
        purrr::flatten_chr()
    }
  } else {
    vv <- excerpt
  }
  purrr::flatten(text_list) %>%
    purrr::keep(~attr(.x, "p") %in% vv)
}