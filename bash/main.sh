DIR="$(dirname `realpath $0`)"
. "$DIR/../z/z.sh" "$DIR/*.sh":x
eval $(thefuck --alias)
