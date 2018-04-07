local isChar = function(c)
    return (c >= "a" and c <= "z") or (c >= "A" and c <= "Z");
end
return function(str)


    local letters = {};
    for i = 1, #str do
        local c = str:sub(i, i):lower();
        if(isChar(c)) then if(letters[c]) then return false; else letters[c] = c; end end
    end

    return true;
end