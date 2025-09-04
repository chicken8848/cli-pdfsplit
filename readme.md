# CLI-PDFSplit
Requires `pdfseparate` and `pdfunite`, but most people already have those if they have some kind of latex setup

```sh
pdfsplit -f 2 -l 10 input.pdf output.pdf
```

Only accepts a range for now, I will probably add in support for singular pages if I have the need to take out singular pages from my pdfs

