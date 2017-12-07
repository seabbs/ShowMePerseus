
Show Me Perseus
===============

A shiny app to remove potential friction for new R users when using the R perseus package.

Docker
======

This application has been built in a docker environment, based on the `tidyverse` docker image. Run the following in the ShowMePerseus directory on the command line (with a docker daemon running):

``` bash
docker pull seabbs/showmeperseus
docker run -d -p 8787:8787 -p 3838:3838 -p 54321:54321 -e USER=ShowMePerseus -e PASSWORD=ShowMePerseus --name  seabbs/showmeperseus
```

The Rstudio development enviroment can be found at :8787 at your local machines ip (or at `localhost:`). The shiny server can similarly be found on port :3838.
