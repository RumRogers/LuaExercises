local function find(array, n)

    local L, R = 1, #array;

    while(true) do
        if(L > R) then return -1 end;

        local m = math.floor((L + R) / 2);

        if(array[m] == n) then return m; end;
        if(array[m] < n) then L = m + 1; end;
        if(array[m] > n) then R = m - 1; end;
    end
end

return find;