#### SETUP #####################################################################
cat("\014"); rm(list=ls())
setwd(here::here())
source("code/precisionData.R")

nm <- "zhu_comparison_2015"       ## Name of study (actually name of file)
df <- read.csv(paste0("data/raw_ageing/",nm,".csv"))
str(df) 


## !!! Copy the code below if more than one structure of comparisons

#### XXXXXX ####################################################################
species <- "Lake Whitefish"
atype <- "within"  # possibly change to "within"
strux <- "otoliths"         # Calcified strucure (e.g., scales, otolith, finray, spine)
strux2 <- "sagittae"        # More about scturcture (e.g., dorsal, pectoral)
proc <- "cut-and-burnt"          # Process info (e.g., sectioned, crackburn, whole)

df1 <- df %>%       # Process the data to prepare for analysis
  select(contains("Otolith")) %>%
  filterD(complete.cases(.))

ap1 <- agePrecision(~Otolith_R1+Otolith_R2+Otolith_R3,data=df1)   ## include the variable names here
pt1SD <- precisionData(ap1,studyID=nm,species=species,
                       structure=strux,structure2=strux2,process=proc,
                       type=atype,var="SD")
plot(pt1SD)
summary(pt1SD,what="tests")

pt1CV <- precisionData(ap1,studyID=nm,species=species,
                       structure=strux,structure2=strux2,process=proc,
                       type=atype,var="CV")
plot(pt1CV)
summary(pt1CV,what="tests")

res <- list(sum=pt1SD$sum,tests=rbind(pt1SD$tests,pt1CV$tests))
saveRDS(res,paste0("data/results_precision/",nm,"_",species,"_",strux,
                   ifelse(strux2=="","","_"),strux2,
                   ifelse(proc=="","","_"),proc,".rds"))

#### XXXXXX ####################################################################
species <- "Lake Whitefish"
atype <- "within"  # possibly change to "within"
strux <- "finrays"         # Calcified strucure (e.g., scales, otolith, finray, spine)
strux2 <- "pectoral"        # More about scturcture (e.g., dorsal, pectoral)
proc <- "sectioned"          # Process info (e.g., sectioned, crackburn, whole)

df1 <- df %>%       # Process the data to prepare for analysis
  select(contains("Fin")) %>%
  filterD(complete.cases(.))

ap1 <- agePrecision(~Fin_R1+Fin_R2+Fin_R3,data=df1)   ## include the variable names here
pt1SD <- precisionData(ap1,studyID=nm,species=species,
                       structure=strux,structure2=strux2,process=proc,
                       type=atype,var="SD")
plot(pt1SD)
summary(pt1SD,what="tests")

pt1CV <- precisionData(ap1,studyID=nm,species=species,
                       structure=strux,structure2=strux2,process=proc,
                       type=atype,var="CV")
plot(pt1CV)
summary(pt1CV,what="tests")

res <- list(sum=pt1SD$sum,tests=rbind(pt1SD$tests,pt1CV$tests))
saveRDS(res,paste0("data/results_precision/",nm,"_",species,"_",strux,
                   ifelse(strux2=="","","_"),strux2,
                   ifelse(proc=="","","_"),proc,".rds"))

#### XXXXXX ####################################################################
species <- "Lake Whitefish"
atype <- "within"  # possibly change to "within"
strux <- "scales"         # Calcified strucure (e.g., scales, otolith, finray, spine)
strux2 <- ""        # More about scturcture (e.g., dorsal, pectoral)
proc <- "pressed"          # Process info (e.g., sectioned, crackburn, whole)

df1 <- df %>%       # Process the data to prepare for analysis
  select(contains("Scale")) %>%
  filterD(complete.cases(.))

ap1 <- agePrecision(~Scale_R1+Scale_R2+Scale_R3,data=df1)   ## include the variable names here
pt1SD <- precisionData(ap1,studyID=nm,species=species,
                       structure=strux,structure2=strux2,process=proc,
                       type=atype,var="SD")
plot(pt1SD)
summary(pt1SD,what="tests")

pt1CV <- precisionData(ap1,studyID=nm,species=species,
                       structure=strux,structure2=strux2,process=proc,
                       type=atype,var="CV")
plot(pt1CV)
summary(pt1CV,what="tests")

res <- list(sum=pt1SD$sum,tests=rbind(pt1SD$tests,pt1CV$tests))
saveRDS(res,paste0("data/results_precision/",nm,"_",species,"_",strux,
                   ifelse(strux2=="","","_"),strux2,
                   ifelse(proc=="","","_"),proc,".rds"))