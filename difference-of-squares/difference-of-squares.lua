local diff = {};

diff.square_of_sums = function(n)
    local sums = 0;
    for i = 1, n do
        sums = sums + i;
    end
    return sums * sums;
end;

diff.sum_of_squares = function(n)
    local sums = 0;
    for i = 1, n do
        sums = sums + (i * i);
    end
    return sums;
end;

diff.difference_of_squares = function(n)
    return diff.square_of_sums(n) - diff.sum_of_squares(n);
end

return diff;