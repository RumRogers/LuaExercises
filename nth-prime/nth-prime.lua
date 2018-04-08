local function isPrime(n)
    for i = 2, math.sqrt(n) do
        if(n % i == 0) then return false; end
    end
    return true;
end

return function(n)

    assert(n > 0, "");
    local i, count = 2, 0;
    while count < n do
        if(isPrime(i)) then count = count + 1; end
        i = i + 1;
    end

    return i - 1;
end