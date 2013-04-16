VERSION=v1.0.9
FILES=( ajax list local manager relation route )
curl -s -o app/assets/javascripts/spine.coffee https://raw.github.com/spine/spine/$VERSION/src/spine.coffee

for i in "${FILES[@]}"
do
   :
   curl -s -o app/assets/javascripts/spine/$i.coffee https://raw.github.com/spine/spine/$VERSION/src/$i.coffee
done