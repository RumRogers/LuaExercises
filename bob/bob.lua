local SIMPLE_QUESTION, SIMPLE_YELL, YELLED_QUESTION, EMPTY, OTHER = 1, 2, 3, 4, 5; -- simulate enum
local SMALL, CAPITAL, SYMBOL = 0, 1, 2;
local answers =
{
    "Sure",
    "Whoa, chill out!",
    "Calm down, I know what I'm doing!",
    "Fine, be that way.",
    "Whatever"
};

local getCharType = function(char)
    if(char >= "a" and char <= "z") then
        return SMALL;
    end
    if(char >= "A" and char <= "Z") then
        return CAPITAL;
    end
    return SYMBOL;
end

local parseString = function(str)
    local isYelling = function()
        local foundCapital, foundSmall = false, false;

        for i = 1, #str do
            local currChar = str:sub(i, i);
            local typeOfChar = getCharType(currChar);
            if(typeOfChar == SMALL) then
                foundSmall = true;
            elseif(typeOfChar == CAPITAL) then
                foundCapital = true;
            end
        end

        return (foundCapital and not foundSmall);
    end

    if(#str == 0) then
        return EMPTY;
    end

    local lastChar = str:sub(#str, #str);
    if(lastChar ~= "!" and lastChar ~= "?") then
        return OTHER;
    end

    local yelling = isYelling();
    if(not yelling) then
        if(lastChar == "?") then
            return SIMPLE_QUESTION;
        end
        return OTHER;
    end
    if(lastChar == "?") then
        return YELLED_QUESTION;
    end
    if(lastChar == "!") then
        return SIMPLE_YELL;
    end
end

local bob =
{
    hey = function(str)
        return answers[parseString(str)];
    end
};

return bob;