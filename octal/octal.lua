local function Octal(input)

    local function isInputValid()

        for i = 1, #input do

            local c = input:sub(i, i);
            if(not (c >= "0" and c <= "7")) then
                return false;
            end
        end

        return true;
    end

    local res =
    {
        to_decimal = function()

            local res = 0;

            if(isInputValid()) then
                for i = #input, 1, -1 do

                    local n = tostring(input:sub(i, i));
                    local exp = #input - i;
                    res = res + 8 ^ exp * n;
                end
            end

            return res;
        end
    }

    return res;
end

return Octal;