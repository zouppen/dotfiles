# Requires sano and say aliases

# TODO take language as a parameter?

kiroile_vitusti () {
    curl https://raw.githubusercontent.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/fi |\
        perl -MList::Util -e 'print List::Util::shuffle <>' |\
        tr '\n' ' ' | sano
}

curse_a_lot () {
    curl https://raw.githubusercontent.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/en | \
        perl -MList::Util -e 'print List::Util::shuffle <>' |\
        tr '\n' ' ' | say
}
