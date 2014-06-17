pollutantmean <- function(directory, pollutant, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
      
      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of the pollutant for which we will calculate the
      ## mean; either "sulfate" or "nitrate".
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return the mean of the pollutant across all monitors list
      ## in the 'id' vector (ignoring NA values)
      
      if (exists("dataset")) {
                  remove(dataset)
      }
      
      path <- paste(directory,'/',sep="")
      
      file_list <- list.files(path,pattern = ".csv")
      myfiles <- file_list[id]
      
      for (file in myfiles){
            
            # if the merged dataset does exist, append to it
            if (exists("dataset")){
                  temp_dataset <-read.table(paste(path,file,sep=""), header=TRUE, sep=",")
                  dataset<-rbind(dataset, temp_dataset)
                  rm(temp_dataset)
            }
            
            # if the merged dataset doesn't exist, create it
            if (!exists("dataset")){
                  dataset <- read.table(paste(path,file,sep=""), header=TRUE, sep=",")
            }
            
            
            
      }
      
      
      mean(dataset[,pollutant],na.rm=TRUE)
      
      
}
