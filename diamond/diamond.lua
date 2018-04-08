return function(seed)
    local m = string.byte(seed) - 64; -- 65 = 'A'
    local N = m * 2 - 1;
    local res = "";

    for i = 0, N / 2 do
        for j = 1, N do res = res .. ((j == m - i  or j == m + i) and string.char(65 + i) or " ") end
        res = res .. "\n";
    end
    for i = #res - 2 * N - 1, 1, -N - 1 do res = res .. res:sub(i, i + N); end
    return res;
end