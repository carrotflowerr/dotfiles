#!/usr/bin/env bash
set -e
input="${1:-$HOME/.cache/wal/colors.json}"
outdir="${2:-$HOME/.emacs.d/themes}"
theme="${3:-wal-generated}"
mkdir -p "$outdir"
outfile="$outdir/${theme}-theme.el"

declare bg fg cursor
declare -A colors

if [[ "$input" == *.json ]]; then
  bg=$(jq -r .special.background "$input")
  fg=$(jq -r .special.foreground "$input")
  cursor=$(jq -r .special.cursor "$input")
  for i in {0..15}; do
    colors[$i]=$(jq -r .colors.color$i "$input")
  done
else
  while read -r name hex; do
    case "$name" in
      *.background:|background:)
        bg=$hex;;
      *.foreground:|foreground:)
        fg=$hex;;
      *.cursor:|cursor:)
        cursor=$hex;;
      *.color[0-9]*)
        idx=${name//[^0-9]/}
        colors[$idx]=$hex;;
    esac
  done < <(grep -Ei "foreground|background|cursor|color[0-9]" "$input")
fi

cat > "$outfile" <<EOF
(deftheme $theme)
(custom-theme-set-faces
 '$theme
 '(default ((t (:background "$bg" :foreground "$fg"))))
 '(cursor  ((t (:background "$cursor"))))
 '(font-lock-keyword-face ((t (:foreground "${colors[4]}"))))
 '(font-lock-comment-face ((t (:foreground "${colors[8]}"))))
 '(font-lock-string-face ((t (:foreground "${colors[2]}"))))
 '(region ((t (:background "${colors[5]}"))))
)
(provide-theme '$theme)
EOF
