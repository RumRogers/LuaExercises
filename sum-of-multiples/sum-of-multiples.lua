return function(arr)

    return
    {
        to = function(bound)

            local sum = 0;
            for i = 1, bound - 1 do
                for _, v in ipairs(arr) do
                    if(i % v == 0) then sum = sum + i; break; end
                end
            end
            return sum;
        end
    }
end