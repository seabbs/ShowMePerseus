
## Start with the shiny docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

RUN export ADD=shiny && bash /etc/cont-init.d/add

RUN rm -r /srv/shiny-server/*

COPY . /srv/shiny-server/ShowMePerseus

EXPOSE 3838

ADD . /home/rstudio/ShowMePerseus

RUN Rscript -e 'install.packages("packrat")'

WORKDIR /home/rstudio/ShowMePerseus

RUN Rscript -e 'packrat::restore()'

