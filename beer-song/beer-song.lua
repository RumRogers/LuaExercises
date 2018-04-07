local punct =
{
    space = " ",
    comma = ",",
    dot = ".",
    newline = "\n",
}
local songParts =
{
    subject_plural = "bottles",
    subject_singular = "bottle",
    subject_beer = "of beer",
    location = "on the wall",
    no_more = "No more",
    actions = { none_left = "Go to the store and buy some more", some_left = "Take one down and pass it around", one_left = "Take it down and pass it around" }
};

local verse;
verse = function(beersLeft)

    local res = "";
    local subject_1, subject_2, action;
    if(beersLeft > 0) then
        if(beersLeft > 1) then
            subject_1 = beersLeft .. punct.space .. songParts.subject_plural .. punct.space .. songParts.subject_beer;
            if(beersLeft - 1 > 1) then
                subject_2 = beersLeft - 1 .. punct.space .. songParts.subject_plural .. punct.space .. songParts.subject_beer;
            else
                subject_2 = beersLeft - 1 .. punct.space .. songParts.subject_singular .. punct.space .. songParts.subject_beer;
            end
            action = songParts.actions.some_left;
        else
            subject_1 = beersLeft .. punct.space .. songParts.subject_singular .. punct.space .. songParts.subject_beer;
            subject_2 = songParts.no_more .. punct.space .. songParts.subject_plural .. punct.space .. songParts.subject_beer;
            action = songParts.actions.one_left;
        end

    elseif(beersLeft == 0) then
        subject_1 = songParts.no_more .. punct.space .. songParts.subject_plural .. punct.space .. songParts.subject_beer;
        subject_2 = 99 .. punct.space .. songParts.subject_plural .. punct.space .. songParts.subject_beer;
        action = songParts.actions.none_left;
    else
        return res;
    end

    res = subject_1 .. punct.space .. songParts.location .. punct.comma .. punct.space .. subject_1:lower() .. punct.dot .. punct.newline
            .. action .. punct.comma .. punct.space .. subject_2:lower() .. punct.space .. songParts.location .. punct.dot .. punct.newline;

    return res;
end
local sing;
sing = function(beersLeftFrom, beersLeftTo)

    beersLeftTo = beersLeftTo or 0;

    local res = "";
    for i = beersLeftFrom, beersLeftTo, -1 do
        res = res .. verse(i);
        if(i > beersLeftTo) then res = res .. "\n"; end
    end

    return res;
end

return { verse = verse, sing = sing };
