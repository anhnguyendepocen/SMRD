library(smrdfortran)
library(SMRD)
test = 3
if(test == 1) {
  
data.rdu <- SMRD:::frame.to.rdu(r4490,
                                 time.column = 2,
                                 cost.count.column = 4,
                                 ID.column = 1,
                                 event.column = 3)
}

if(test == 2){
  
  data.rdu <- SMRD:::frame.to.rdu(computerlab,
                                ID.column = "computer",
                                time.column = "days",
                                event.column = "event")
  
}
if(test == 3){
  
  data.rdu.rdu <- SMRD:::frame.to.rdu(workstation,
                                ID.column = "station",
                                time.column = "days",
                                event.column = "event")
  
}
debug1 = F 
if(!exists("kdebug")) kdebug = 0
  event <- SMRD:::events(data.rdu)
  EndPoints <- is.element(casefold(event), c("end", "mend", 
                                   "removed"))
  StartPoints <- is.element(casefold(event), c("start", "mstart"))
  CriticalEvent <- !(EndPoints | StartPoints)
  Times <- SMRD:::times(data.rdu)
  UnitID <- as.factor(SMRD:::get.UnitID(data.rdu))
  WindowInfo <- attr(data.rdu, "WindowInfo")
  WindowPoint <- WindowInfo$WindowPoint
  WindowU <- WindowInfo$WindowU
  WindowL <- WindowInfo$WindowL
  EndPoints <- is.element(casefold(event), c("end", "mend"))
  StartPoints <- is.element(casefold(event), c("start", "mstart"))
  CriticalEvent <- !(EndPoints | StartPoints)
  RecurrTimes <- Times[CriticalEvent, ]
  
  RecurrUnitID <- UnitID[CriticalEvent]
#  RecurrUnitID <- as.numeric(attr(RecurrTimes, "names"))
  RecurrCosts <- SMRD:::get.Costs(data.rdu)[CriticalEvent]
  numRecurr <- length(RecurrTimes)

if(F){ 
old <-  .Fortran("xxmcf", numRecurr = as.integer(numRecurr),
        RecurrTimes = as.double(RecurrTimes), KRecurrID = as.integer(RecurrUnitID),
        dCost = as.double(RecurrCosts), muniqrecurr = integer(1),
        tuniq = double(numRecurr), Apoint = integer(numRecurr),
        LnumRecurr = integer(1), delta = integer(numRecurr),
        nunitsgroups = as.integer(length(WindowInfo$WindowPoint)),
        wpoint = as.integer(WindowInfo$WindowPoint), nwindows = as.integer(length(WindowInfo$WindowL)),
        twindowsl = as.double(WindowInfo$WindowL), twindowsu = as.double(WindowInfo$WindowU),
        wcounts = as.integer(WindowInfo$WindowCounts), inwindow = integer(length(WindowInfo$WindowPoint)),
        muhat = double(numRecurr), varhat = double(numRecurr),
        dbar = double(numRecurr), iordl = integer(length(WindowInfo$WindowL)),
        iordu = integer(length(WindowInfo$WindowL)), iorder = integer(numRecurr),
        iorder2 = integer(numRecurr))
}

new <- SMRD:::XXMCF(numrecurr = as.integer(numRecurr),
                       timeofrecurr = as.double(RecurrTimes), 
                       krecurrid = as.integer(RecurrUnitID), 
                       dcost = as.double(RecurrCosts), 
                       muniqrecurr = integer(1), 
                       tuniq = double(numRecurr), 
                       apoint = integer(numRecurr), 
                       lnumrecurr = integer(1), 
                       delta = integer(numRecurr), 
                       nunitsgroups = as.integer(length(WindowInfo$WindowPoint)), 
                       wpoint = as.integer(WindowInfo$WindowPoint), 
                       nwindows = as.integer(length(WindowInfo$WindowL)), 
                       twindowsl = as.double(WindowInfo$WindowL), 
                       twindowsu = as.double(WindowInfo$WindowU), 
                       wcounts = as.integer(WindowInfo$WindowCounts), 
                       inwindowj = integer(length(WindowInfo$WindowPoint)),
                       muhat = double(numRecurr), 
                       varhat = double(numRecurr), 
                       dbar = double(numRecurr), 
                       iordl = integer(length(WindowInfo$WindowL)), 
                       iordu = integer(length(WindowInfo$WindowL)), 
                       iorder = integer(numRecurr), 
                       iscrat = integer(numRecurr),
                     kdebug = as.integer(kdebug))
