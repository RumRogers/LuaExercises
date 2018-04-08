return function(dnaStrand)

    local rnaStrand, toRNA = "", { G = "C", C = "G", T = "A", A = "U" };

    for i = 1, #dnaStrand do rnaStrand = rnaStrand .. toRNA[dnaStrand:sub(i, i)]; end
    return rnaStrand;
end