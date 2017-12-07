get_lemmatized_greek_text <- function(urn) {
  if (!stringr::str_detect(urn, "-grc")) stop("Only lemmatized Greek texts available.", call. = FALSE)
  urn <- stringr::str_replace(urn, "urn:cts:greekLit:", "")
  url <- sprintf("https://raw.githubusercontent.com/daranzolin/LemmatizedAncientGreekXML/master/texts/%s.xml", urn)
  r <- xml2::read_xml(url)
  xml2::as_list(r)
}
