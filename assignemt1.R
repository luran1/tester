library(knitr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(keyringr)
library(redcapAPI)
library(REDCapR)
library(lubridate)

#Create path to and api link to RedCaps
# # https://cran.r-project.org/web/packages/keyringr/vignettes/Avoiding_plain_text_passwords_in_R_with_keyringr.html
credential_label <- "beach_api"
credential_path <- paste(Sys.getenv("USERPROFILE"),
  '\\DPAPI\\passwords\\', Sys.info()["nodename"], '\\',
  credential_label, '.txt', sep="")
uri <- "https://redcap.ctsi.ufl.edu/redcap/api/"
beach_token<-decrypt_dpapi_pw(credential_path)

# Create connections
rcon <- redcapConnection(url=uri, token=beach_token)

#names
consent.records.v1=c("BLS003A", "BLS011A")

#events
events_to_retain<-c("third_trimester_arm_1")

#fields
desired_fields<-c("mom3t_delivery_location","mom3t_prepreg_bmi","test_id", "redcap_event_name")

dat <- redcap_read(
  batch_size=300,
  records= consent.records.v1,
  redcap_uri = uri,
  token      = beach_token,
  fields     = desired_fields,
  events     = events_to_retain,
  )$data

print(dat)
