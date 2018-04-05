local brackets =
{
    valid = function(str)

        local isOpenBracket = function(c)

            return c == "{" or c == "[" or c == "(";
        end

        local isClosedBracket = function(c)

            return  c == "}" or c == "]" or c == ")";
        end

        local isBalanced = function(prev, curr)

            return (prev == "{" and curr == "}") or (prev == "[" and curr == "]") or (prev == "(" and curr == ")");
        end

        local stack = {};

        for i = 1, #str do

            local c = str:sub(i, i);
            if(isOpenBracket(c)) then
                stack[#stack + 1] = c;
            elseif(isClosedBracket(c)) then
                local popped = stack[#stack]; -- peek the stack top

                if(isBalanced(popped, c)) then
                    stack[#stack] = nil; -- actually pop from stack
                else
                    return false;
                end
            end
        end

        if(#stack == 0) then return true end;
        return false;
    end
};

return brackets;