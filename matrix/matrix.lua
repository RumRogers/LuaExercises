local Matrix = function(str)

    local matrix, row, res = {}, 1, {};

    local function addNumber(n)

        matrix[row] = matrix[row] or {};
        matrix[row][#(matrix[row]) + 1] = tonumber(n);
    end
    local n = "";

    for i = 1, #str do

        local c = str:sub(i, i);

        if(c >= "0" and c <= "9") then
            n = n .. c;
            if(i == #str) then
                addNumber(n);
            end
        else
            if(c == " " or c == "\n") then
                addNumber(n);
            end
            if(c == "\n") then
                row = row + 1;
            end
            n = "";
        end
    end

    res.row = function(n)
        return matrix[n];
    end

    res.column = function(n)

        local col = {};
        for i = 1, #matrix do
            local row = res.row(i);
            col[#col + 1] = row[n];
        end
        return col;
    end

    return res;
end

return Matrix;
