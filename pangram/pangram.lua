local pangram = function(str)

    local alphabet = {};

    for i = 97, 122 do
        alphabet[string.char(i)] = false;
    end

    for i = 1, #str do
        local c = str:sub(i, i):lower();

        if(c >= "a" and c <= "z") then alphabet[c] = true; end;
    end

    for _, v in pairs(alphabet) do
        if(not v) then return false; end
    end

    return true;
end

return pangram;

