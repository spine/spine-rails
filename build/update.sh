FILES=( ajax list local manager relation route )
curl -s -o vendor/assets/javascripts/spine.coffee https://raw.githubusercontent.com/spine/spine/dev/src/spine.coffee

for i in "${FILES[@]}"
do
   curl -s  -o vendor/assets/javascripts/spine/$i.coffee https://raw.githubusercontent.com/spine/spine/dev/src/$i.coffee
done
