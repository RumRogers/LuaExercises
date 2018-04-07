local DNA = {};

function DNA:new(sequence)

    local o = { sequence = sequence };
    self.__index = self;
    setmetatable(o, self);

    o.nucleotideCounts = o:nucleotide_count();

    return o;
end

function DNA:nucleotide_count()

    local res = { A = 0, T = 0, C = 0, G = 0 };
    for i = 1, #self.sequence do
        local n = self.sequence:sub(i, i);
        res[n] = res[n] + 1;
    end

    return res;
end

function DNA:count(c)

    assert(c == "A" or c == "T" or c == "C" or c == "G", "Invalid Nucleotide");
    return self:nucleotide_count()[c];
end

return DNA;