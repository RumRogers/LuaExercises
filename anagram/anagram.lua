local Anagram = {};

function Anagram:new(str)

    assert(type(str) == "string", "Error: input is not a string.");

    local chars = {};

    for i = 1, #str do
        chars[#chars + 1] = str:sub(i, i):lower();
    end

    local instance = { chars = chars };

    self.__index = self;
    setmetatable(instance, self); -- class simulation
    return instance;
end

function Anagram.__tostring(anagram)

    return "{ " .. table.concat(anagram.str, ", ") .. " }";
end

function Anagram:match(candidates)

    local function initUsageTable(chars)

        local usageTable = {};

        for _, v in ipairs(chars) do
            usageTable[v] = (usageTable[v] and usageTable[v] + 1) or 1;
        end

        return usageTable;
    end

    local res = {};

    for _, v in ipairs(candidates) do

        if(#v == #self.chars) then

            local usageTable = initUsageTable(self.chars);

            local isAnagram = true;
            for i = 1, #v do

                local currChar = v:sub(i, i):lower();

                if(usageTable[currChar] and usageTable[currChar] > 0) then
                    usageTable[currChar] = usageTable[currChar] - 1;
                else
                    isAnagram = false;
                    break;
                end
            end
            if(isAnagram) then
                res[#res + 1] = v;
            end
        end
    end

    return res;
end

return Anagram;


