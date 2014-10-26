complete <- function(directory, id = 1:332) {
    cwd <- getwd()
    setwd(directory)

    result <- data.frame(id = numeric(), nobs = numeric())

    for(i in 1:length(id)) {
        fName <- paste0(formatC(id[i], width = 3, flag = "0"), ".csv")
        fData <- read.csv(fName)
        compFlag <- complete.cases(fData)
        compData <- fData[compFlag, ]
        result[i, ] <- c(id[i], nrow(compData))
    }

    setwd(cwd)
    result
}
