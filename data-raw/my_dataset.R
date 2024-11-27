## code to prepare `my_dataset` dataset goes here

library(dplyr)
library(tidyr)
library(rvest)
library(purrr)
library(stringr)
library(polite)

url <- "https://awealthofcommonsense.com"
session <- polite::bow(url)

html <- session %>% 
  polite::nod(path = "/podcast/") %>% 
  polite::scrape() %>% 
  rvest::html_elements("p") %>% 
  rvest::html_elements("a")

all_podcast_episodes <- data.frame(
  title = html %>% rvest::html_text(),
  link = html %>% rvest::html_attr("href")
)

animal_spirits_podcasts <- all_podcast_episodes %>% 
  dplyr::filter(stringr::str_detect(link, "https://awealthofcommonsense.com/\\d") == TRUE) %>% 
  dplyr::mutate(link = stringr::str_remove(link, url))

source_charts <- function(link) {
  tryCatch(
    {
      session %>% 
        polite::nod(path = link) %>% 
        polite::scrape() %>% 
        rvest::html_elements("img") %>% 
        rvest::html_attrs()
    }, error = function(msg){
      return(NA)
    })
}

all_podcast_charts <- animal_spirits_podcasts %>% 
  dplyr::mutate(foo = purrr::map(link, source_charts)) %>% 
  tidyr::unnest_longer(col = foo) %>% 
  tidyr::unnest_wider(col = foo) %>% 
  dplyr::select(title, link, src, width, height) %>% 
  dplyr::mutate(full_pod_link = paste0(url, link))

animal_spirits_charts <- all_podcast_charts %>% 
  dplyr::filter(!is.na(width)) %>% 
  dplyr::filter(stringr::str_detect(src, "theirrelevantinvestor.com") == FALSE) %>% 
  dplyr::mutate(width = as.numeric(width)) %>% 
  dplyr::mutate(height = as.numeric(height))

usethis::use_data(animal_spirits_charts, overwrite = TRUE)
