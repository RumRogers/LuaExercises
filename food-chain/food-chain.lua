local verse = function(v)

    local animals = { "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse" };
    local actions = { spider = "that wriggled and jiggled and tickled inside her";}
    local second_sentence =
    {
        "I don't know why she swallowed the fly. Perhaps she'll die.", "It wriggled and jiggled and tickled inside her.",
        "How absurd to swallow a bird!",
        "Imagine that, to swallow a cat!", "What a hog, to swallow a dog!",
        "Just opened her throat and swallowed a goat!", "I don't know how she swallowed a cow!"
    }
    local res = "I know an old lady who swallowed a " .. animals[v] .. ".\n"
            .. (v == 8 and "She's dead, of course!\n" or "");

    if(v < 8) then
        for i = v, 1, -1 do
            res = res .. ((i == v or i == 1 and second_sentence[i] ~= nil) and second_sentence[i] .. "\n" or "")
            .. (i > 1 and ("She swallowed the " .. animals[i] .. " to catch the " .. animals[i - 1]
            .. (actions[animals[i - 1]] ~= nul and (" " .. actions[animals[i - 1]]) or "") .. ".\n") or "");
        end
    end

    return res;
end

local verses = function(from, to)

    local res = "";
    for i = from, to do res = res .. verse(i) .. "\n" end;
    return res;
end

local sing = function() return verses(1, 8) end

return { verse = verse, verses = verses, sing = sing };
