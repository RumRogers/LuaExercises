local hamming = {};

function hamming.compute(strand1, strand2)
    if(#strand1 ~= #strand2) then
        return -1;
    end

    local hammingDistance = 0;
    for i = 1, #strand1, 1
        do
            if(strand1:sub(i, i) ~= strand2:sub(i, i)) then
                hammingDistance = hammingDistance + 1;
            end
    end

    return hammingDistance;
end

return hamming;