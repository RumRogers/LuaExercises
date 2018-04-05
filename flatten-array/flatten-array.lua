local concat = function(arr1, arr2)

    for i = 1, #arr2 do
        arr1[#arr1 + 1] = arr2[i];
    end

    return arr1;
end

local flatten; -- we first declare the variable so that the recursive call sees itself in the process
flatten = function(arr)

    local res = {};

    for _, v in ipairs(arr) do

        if(type(v) == "table") then
            local arr2 = flatten(v);
            res = concat(res, arr2);
        elseif(v ~= nil) then
            res[#res + 1] = v;
        end
    end

    return res;
end

return flatten;