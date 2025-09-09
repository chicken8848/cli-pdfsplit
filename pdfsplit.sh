#!/usr/bin/env zsh

expand_pages() {
    local pages=()
    for token in ${(s: :)1}; do
        if [[ $token == *-* ]]; then
            local start=${token%-*}
            local end=${token#*-}
            pages+=($(seq $start $end))
        else
            pages+=($token)
        fi
    done
    echo $pages
}

while getopts "p:" opt; do
    case $opt in 
        p) pages_string=$OPTARG ;;
        \?) echo "Usage: $0 -p '1-2 3 4 5-11' input.pdf output.pdf" >&2; exit 1 ;;
    esac
done

shift $((OPTIND - 1))

input_file=$1
output_file=$2
pages=($(expand_pages "$pages_string"))

pdfseparate "$input_file" _out%d.pdf
pdfunite $(for p in $pages; do printf "_out%d.pdf " $p; done) "$output_file"
rm -f _out*.pdf
