complete <- function(directory, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return a data frame of the form:
      ## id nobs
      ## 1  117
      ## 2  1041
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases
      
      
      if (exists("dataset")) {
            remove(dataset)
      }
      
      path <- paste(directory,'/',sep="")
      
      file_list <- list.files(path,pattern = ".csv")
      myfiles <- file_list[id]
      
      nobs <- NULL
      
      for (file in myfiles){
            
                  data <- read.table(paste(path,file,sep=""), header=TRUE, sep=",")
                  sum_complete <- sum(complete.cases(data))
                  nobs <- c(nobs,sum_complete) 
            
      }
      
      
      data.frame(id, nobs)
      
}