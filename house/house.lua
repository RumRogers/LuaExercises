local house = {};

local sentences =
{
    intro = "This is",
    tie = "that",
    article = "the",
    space = " ",
    newline = "\n",
    fullstop = ".",
    subjects =
    {
        "house",
        "malt",
        "rat",
        "cat",
        "dog",
        "cow with the crumpled horn",
        "maiden all forlorn",
        "man all tattered and torn",
        "priest all shaven and shorn",
        "rooster that crowed in the morn",
        "farmer sowing his corn",
        "horse and the hound and the horn"
    },
    verbs =
    {
        "Jack built",
        "lay in",
        "ate",
        "killed",
        "worried",
        "tossed",
        "milked",
        "kissed",
        "married",
        "woke",
        "kept",
        "belonged to"
    }
};

function house.verse(idx)
    verse = sentences.intro .. sentences.space;

    for i = idx, 1, -1 do
        verse = verse ..
                sentences.article ..
                sentences.space ..
                sentences.subjects[i] ..
                ( i > 1 and sentences.newline or sentences.space) ..
                sentences.tie ..
                sentences.space ..
                sentences.verbs[i] ..
                ( i > 1 and sentences.space or "");
    end

    return verse .. sentences.fullstop;
end

function house.recite()
    res = {}
    for i = 1, #sentences.subjects, 1 do
        res[i] = house.verse(i);
    end
    return table.concat(res, "\n");
end

print(house.recite());
return house;