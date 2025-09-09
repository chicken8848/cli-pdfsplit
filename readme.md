# CLI-PDFSplit
Simple script to extract pages from a pdf.

Requires `pdfseparate` and `pdfunite`, but most people already have those if they have some kind of latex setup

```sh
pdfsplit -p "1-5 6 7 9-10 2" input.pdf output.pdf
```
