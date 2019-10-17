        #sending R markdown files by email
library(rmarkdown)
library(mailR)

        #render the markdown file 
knit("GitHub/BEACH-interview/report/")

send.mail(from = "luranmanfio0701@gmail.com",
          to = "luranmanfio0701@gmail.com",
          subject = "R markdown report - knitr test",
          html = T,
          inline = T,
          body = "example.html",
          smtp = list(host.name = "smtp.gmail.com", port=465, user.name = "me", passwd = "password", ssl = T),
          authenticate = T,
          send = T)

getwd()