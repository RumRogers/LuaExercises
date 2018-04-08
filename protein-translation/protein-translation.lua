local proteins = {
    Methionine = "Methionine",
    Phenylalanine = "Phenylalanine",
    Leucine = "Leucine",
    Serine = "Serine",
    Tyrosine = "Tyrosine",
    Cysteine = "Cysteine",
    Tryptophan = "Tryptophan",
    STOP = "STOP"
}
local codonsTable =
{
    AUG = proteins.Methionine, UUU = proteins.Phenylalanine, UUC = proteins.Phenylalanine, UUA = proteins.Leucine,
    UUG = proteins.Leucine, UCU = proteins.Serine, UCC = proteins.Serine, UCA = proteins.Serine, UCG = proteins.Serine,
    UAU = proteins.Tyrosine, UAC = proteins.Tyrosine, UGU = proteins.Cysteine, UGC = proteins.Cysteine,
    UGG = proteins.Tryptophan, UAA = proteins.STOP, UAG = proteins.STOP, UGA = proteins.STOP
}

local function codon(cdn) return codonsTable[cdn] or error(); end;
return
{
    codon = codon,
    rna_strand = function(rnaStrand)

        local res = {};
        for i = 1, #rnaStrand, 3 do
            local cdn = codon(rnaStrand:sub(i, i + 2));
            if(cdn ~= proteins.STOP) then res[#res + 1] = cdn; else break end
        end
        return res;
    end
}