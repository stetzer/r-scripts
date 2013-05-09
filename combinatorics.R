birthday <- function(m, n){1-prod(1 - (0:m-1)/n)}

harmonic <- function(n){sum(1/1:n)}
coupon <- function(n){n*harmonic(n)}