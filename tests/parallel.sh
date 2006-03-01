source common.sh

drvPath=$($nixinstantiate parallel.nix)

echo "derivation is $drvPath"

outPath=$($nixstore -qfvv -j10000 "$drvPath")

echo "output path is $outPath"

text=$(cat "$outPath")
if test "$text" != "abacade"; then exit 1; fi

if test "$(cat $SHARED.cur)" != 0; then exit 1; fi
if test "$(cat $SHARED.max)" != 3; then exit 1; fi
