library(twitteR)
library(tidytext)
library(dplyr)
library(tidyr)
library(stringr)
library(RCurl)
library(rlist)

#' Import text relating to Donald Trump
#'
#' @return Data frame of relevant information regarding tweets about Donald Trump
#' @export
tweets <- function(inputdate, filter_word = "") {
  # configuration
  consumer_key <- "ul0zL1WmoQ9tKWgv0f5AZhiDn"
  consumer_secret <- "TJ3i0v6wNFx91nqfNNbVFSYyDC9vXp1QuOYo0gZ8HdiSTnDmcF"
  access_token <- "76037206-OCx8lq0rB3hiHz8WQfw9QRBv0S6ViEcZB8v9gUHcW"
  access_secret <- "OvTdlW1GHZ9MhBBypUq70gnSgfB5Pah13Bg7d5yh3wFmH"


  # getting tweets using twitteR API
  twitteR::setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

  tw = twitteR::searchTwitter(paste0("Trump ", "+ ", filter_word), n = 1000,
                              since = as.character(inputdate - 1), until = as.character(inputdate),
                              lang = 'en', retryOnRateLimit = 1e3)
  d = twitteR::twListToDF(tw)
  d
}
