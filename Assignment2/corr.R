corr <- function(directory, threshold = 0) {
    cwd <- getwd()
    setwd(directory)
    
    result <- numeric()
    ir <- 1
    
    for(i in 1:332) {
        fName <- paste0(formatC(i, width = 3, flag = "0"), ".csv")
        fData <- read.csv(fName)
        compFlag <- complete.cases(fData)
        compData <- fData[compFlag, ]
        
        if(nrow(compData) > threshold) {
            sul <- compData[, "sulfate"]
            nit <- compData[, "nitrate"]
            result[ir] <- cor(sul, nit)
            ir <- ir + 1
        }
    }
    
    setwd(cwd)
    result
}
