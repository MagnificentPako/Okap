# Okap
An Osu! skin completely generated using Haskell.

# Building the skin
clone the repo and install the dependencies with cabal. You'll also need a file called `font.ttf` in the project root which I didn't include because
I wasn't sure about the licensing stuff. I used [Hack](https://sourcefoundry.org/hack/) for this, which I suggest you use too because the elements using
the font, like numbers might look weird or get cut off otherwise (unless you fix `Elements.Numbers`). Before building you also have to create a folder
called `Okap` in which it will build all the images.

Hitsounds are not included either. Go steal them from some other skin 😜.