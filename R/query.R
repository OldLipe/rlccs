#' @title ...
#' @description ...
#'
#' @param base_url ...
#' @param params ...
#' @param subclass ...
#'
#' @return a class ...
#'
#' @export
RLCCSQuery <- function(base_url, params = list(), subclass) {

  structure(
    list(base_url = base_url,
         endpoint = NULL,
         params = params,
         verb = "GET",
         encode = NULL),
    class = c(subclass, "RLCCSQuery"))
}

#' @export
subclass.RLCCSQuery <- function(x) {

  class(x)[[1]]
}

#' @export
check_subclass.RLCCSQuery <- function(x, subclasses) {

  if (!subclass(x) %in% subclasses)
    .error("Expecting %s query.",
           paste0("`", subclasses, "`", collapse = " or "))
}


#' @export
endpoint.RLCCSQuery <- function(q) {

  .error("No endpoint was defined for the extension `%s`.", subclass(q))
}

#' @export
before_request.RLCCSQuery <- function(q) {

  check_query_verb(q, "")
}

#' @export
after_response.RLCCSQuery <- function(q, res) {

  check_query_verb(q, "")
}
