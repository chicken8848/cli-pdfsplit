#!/usr/bin/env zsh

while getopts "f:l:" opt; do
    case $opt in 
        f) first_page=$OPTARG ;;
        l) last_page=$OPTARG ;;
        \?) echo "Usage: $0 -f first_page -l last_page input.pdf output.pdf" >&2; exit 1 ;;
    esac
done

shift $((OPTIND - 1))

input_file=$1
output_file=$2

pdfseparate "$input_file" _out%d.pdf
pdfunite $(seq $first_page $last_page | xargs -I{} printf "_out%d.pdf " {}) "$output_file"
rm -f _out*.pdf
