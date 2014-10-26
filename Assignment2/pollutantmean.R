pollutantmean <- function(directory, pollutant, id = 1:332) {
    cwd <- getwd()
    setwd(directory)
    fileList = paste0(formatC(id, width = 3, flag = "0"), ".csv")
    data = lapply(fileList, read.csv)

    polList <- list()

    for(d in data) {
        polList <- append(polList, d[[pollutant]])
    }

    polVec <- as.numeric(polList)
    setwd(cwd)
    mean(polVec, na.rm = TRUE)
}
