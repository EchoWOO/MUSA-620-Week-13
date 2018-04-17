# MUSA-620-Week-13

### Shinyapps.io

Shinyapps is a service for hosting your shiny apps on the web.

First register for a free hosting plan.

In R Studio, install the rsconnect package and load it in your session.

```
library(rsconnect)
```

Using the information provided when you set up your account, run setAccountInfo().

```
setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")
```

Run deployApp() to deploy your app to the web.

```
deployApp()
```


See an example app here: [https://musa620.shinyapps.io/myshiny/](https://musa620.shinyapps.io/myshiny/)

[Full instructions](https://shiny.rstudio.com/articles/shinyapps.html)
