rankHospital <- function(state, outcome, num = "best") {
    
    setwd("C:\\Users\\Gemma\\Documents\\R\\Projects\\chapter4\\rprog_data_ProgAssignment3-data")
    
    hospitalData <<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    states <<- unique( hospitalData$State)
    
    if ((state %in% states) == 0) {
        stop("invalid state")
    }
    
    stateRows <<- data.frame(Hosptial=character(), State=character (), stringsAsFactors = FALSE )
    
    pickedStateRows <- data.frame()
    

    if (outcome == "heart attack") {
        
        pickedStateRows <- hospitalData[hospitalData$State == state, c(2, 7, 11)]
        
        message("heart attack data")
        
    }
    
    if (outcome == "heart failure") {
        
        pickedStateRows <- hospitalData[hospitalData$State == state, c(2, 7, 17)]
        
        message("heart attack data")
        
    }
    
    if (outcome == "pneumonia") {
        
        pickedStateRows <- hospitalData[hospitalData$State == state, c(2, 7, 23)]
        
        message("heart attack data")
        
    }
    
    
    colnames(pickedStateRows) <- c("Name","State", "Type")
    
    #    pickedStateRows <- pickedStateRows[!is.na(as.numeric(as.character(pickedStateRows$Type)))]
    
    #pickedStateRows <- pickedStateRows[order(pickedStateRows$Type,pickedStateRows$Name, na.last = NA),]
    
    pickedStateRows[,"Type"] <- as.numeric(pickedStateRows[,"Type"])
    
    pickedStateRows <- pickedStateRows[!is.na(as.numeric(as.character(pickedStateRows$Type))), ]
    
    pickedStateRows <- pickedStateRows[order(pickedStateRows$Type,pickedStateRows$Name), ]
    
    if (num == "best") {
        location = 1
        
    }
    
    else if (num == "worst") {
        location = nrow(pickedStateRows)
    }
    
    else {
        location = num
    }
    
    sp <<- pickedStateRows
    
    pickedStateRows[location ,]
    
    #thisHosp <- pickedStateRows[location ,]
    
    #print (thisHosp)
    
    #print (pickedStateRows[location , ])
    print (pickedStateRows[location , 1])
    
    picked <<- pickedStateRows[location , ]
    
    #rbind(stateRows,list( pickedStateRows[location , 1]))
    
    #print(picked$Name)
    
    #print(stateRows)
}