#### SETUP #####################################################################
cat("\014")
setwd(here::here())
source("code/precisionData.R")

nm <- "dembkowski_walleye_2017"       ## Name of study (actually name of file)
df <- read.csv(paste0("data/raw_ageing/",nm,".csv"))
str(df) 

#### XXXXXX ####################################################################
species <- "Walleye"
atype <- "between"
strux <- "otoliths"
strux2 <- "sagittae"
proc <- "sectioned"
extra_suffix <- ""

df1 <- df %>%
  select(contains("otoliths"))

ap1 <- agePrecision(~otoliths_R1+otoliths_R2,data=df1)
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
                   ifelse(proc=="","","_"),proc,
                   ifelse(extra_suffix=="","","_"),extra_suffix,".rds"))


#### XXXXXX ####################################################################
species <- "Walleye"
atype <- "between"
strux <- "spines"
strux2 <- "dorsal"
proc <- "sectioned"
extra_suffix <- ""

df1 <- df %>%
  select(contains("spines"))

ap1 <- agePrecision(~spines_R1+spines_R2,data=df1)
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
                   ifelse(proc=="","","_"),proc,
                   ifelse(extra_suffix=="","","_"),extra_suffix,".rds"))
