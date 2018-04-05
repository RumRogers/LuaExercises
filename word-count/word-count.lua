local WordCount =
{
    word_count = function(str)

        local function cleanString(str)

            local res = "";
            for i = 1, #str do
                local c = str:sub(i, i);
                if((c >= "a" and c <= "z") or (c >= "A" and c <= "Z") or (c >= "0" and c <= "9")) then res = res .. c; end
            end

            return res:lower();
        end

        local res = {};

        for i in string.gmatch(str, "%S+") do
            local word = cleanString(i);
            if(#word > 0) then
                if(res[word]) then res[word] = res[word] + 1 else res[word] = 1 end;
            end
        end

        return res;
    end
}

return WordCount;