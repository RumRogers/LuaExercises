local aliquot_sum = function(n)

    local sum = 0;
    for i = 1, n - 1 do
        if(n % i == 0) then sum = sum + i; end
    end

    return sum;
end

local classify = function(n)

    local al_sum = aliquot_sum(n);

    return al_sum > n and "abundant" or al_sum < n and "deficient" or "perfect";
end

return { aliquot_sum = aliquot_sum, classify = classify };