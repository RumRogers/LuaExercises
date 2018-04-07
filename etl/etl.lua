return {
    transform = function(dataset)

        local res = {};
        for i, v in pairs(dataset) do
            for _, w in pairs(v) do
                res[w:lower()] = i;
            end
        end

        return res;
    end
}