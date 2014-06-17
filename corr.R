corr <- function(directory, threshold = 0) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      
      path <- paste(directory,'/',sep="")
      
      file_list <- list.files(path,pattern = ".csv")
      
      no_files <- length(file_list)
      
      mydata <- data.frame()
      cor2 <- vector()
      
      idt <- NULL
      
      for (file in file_list) {
            data <- read.table(paste(path,file,sep=""), header=TRUE, sep=",")
            cor.data <- na.omit(data)
            count <- nrow(cor.data)
            
            if (count > threshold){
                  cor.val = cor(cor.data$sulfate,cor.data$nitrate)
                  cor2 = c(cor2,cor.val)
            }
            
      }
            
      
      cor2
}