TAG=v1.3.0
FILES=( ajax list local manager relation route )
curl -s -o vendor/assets/javascripts/spine.coffee https://raw.github.com/spine/spine/$TAG/src/spine.coffee

for i in "${FILES[@]}"
do
   :
   curl -s -o vendor/assets/javascripts/spine/$i.coffee https://raw.github.com/spine/spine/$TAG/src/$i.coffee
done
