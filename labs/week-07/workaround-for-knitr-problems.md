#### Geog 315 T2 2020
# Workaround for **Knit** problems on lab machines
If you encounter problems 'knitting' _RMarkdown_ documents on the lab machines (or even on your own _Windows_ machine), then this limited workaround may be of use. This should work whether you are working on a local or a network drive.

Make sure the `knitr` package is installed and load it.

```{r}
library(knitr)
```

Make sure the working directory is set the folder of the _RMarkdown_ file you want to process. In the examples below I'm assuming the file is called `my-file.Rmd`, change this name as needed.

Now use one of the following commands, to compile the _Rmarkdown_ to desired output formats.

## Compile to Word document
To compile to a word document do this:

```{r}
knit2pandoc("my-file.Rmd", to = "docx")
```

## Compile to HTML (i.e. web page)
To compile to a web page do this:

```{r}
knit2html("my-file.Rmd")
```

Note that this will _not_ work for embedded active web content such as web maps produced when `tmap` has been set to `"view"` mode after issuing `tmap_mode("view")`. It can only embed static content. For our purposes this is not too much of a limitation since any submitted documents are likely to be in static formats anyway.

## Compile to PDF
To compile to a PDF document do this:

```{r}
knit2pandoc("my-file.Rmd", to = "pdf")
```

This will almost certainly not work on _Windows_ machines unless you happen to have installed _LaTeX_ tools (if you have no idea what that means, don't worry about it).

## Where will my output be?
Your output file will be in the working directory. You may also notice a new file `my-file.md` and folder `figure` that wasn't there before. These are intermediate outputs which you can safely ignore.
