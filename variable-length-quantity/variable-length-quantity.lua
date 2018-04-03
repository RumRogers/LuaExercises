math.round = function(n)
    return math.floor(n + 0.75);
end

local isSequenceComplete = function(bin)

    print(bin:sub(#bin - 7, #bin - 7));
    return bin:sub(#bin - 7, #bin - 7) == "0";
end

local decToBin = function(dec)

    if(dec == 0) then
        return "0";
    end

    local bin = "";
    while(dec > 0) do
        bin = (dec % 2) .. bin;
        dec = math.floor(dec / 2);
    end

    return bin;
end

local binToDec = function(bin)

    local dec = 0;
    local exp = 0;

    for i = #bin, 1, -1 do
        dec = dec + (tonumber(bin:sub(i, i) * 2 ^ exp));
        exp = exp + 1;
    end

    return dec;
end

local addPadding = function(bits)

    local padding = 0;

    if(#bits % 8 > 0) then
        padding = 8 - #bits % 8;
    end

    for i = 1, padding do
        bits = "0" .. bits;
    end

    return bits;
end

local getWholeBinary = function(arr)

    local str = "";
    for i = 1, #arr do
        str = str .. (addPadding(decToBin(arr[i])));
    end

    return str;
    --print(str);
end

local splitBinary = function(bin)

    local numbers = {};
    local buf = "";

    if(not isSequenceComplete(bin)) then
        return nil;
    end

    for i = 1, #bin, 8 do
        buf = buf .. bin:sub(i, i + 7);
        if(bin:sub(i, i) == "0") then
            numbers[#numbers + 1] = buf;
            buf = "";
        end
    end

    return numbers;
end

local encode = function(inBytes)

    local outBytes = {};

    for i = #inBytes, 1, -1 do

        local bin = addPadding(decToBin(inBytes[i]));

        local idx, byteCount = #bin - 6, 0;

        while(idx > 0) do
            local byte = bin:sub(idx, idx + 6);
            if(byteCount == 0) then
                byte = "0" .. byte;
            else
                byte = "1" .. byte;
            end
            table.insert(outBytes, 1, binToDec(byte));

            if(idx - 7 > 0) then
                idx = idx - 7;
            else
                byte = bin:sub(1, idx - 1);
                if(string.match(byte, "1")) then
                    byte = bin:sub(1, idx - 1);
                    byte = addPadding(byte);
                    byte = "1" .. byte:sub(2, #byte);
                    table.insert(outBytes, 1, binToDec(byte));
                end
                idx = 0;
            end

            byteCount = byteCount + 1;
        end
    end

    return outBytes;
end

local decode = function(inBytes)

    local numbers = splitBinary(getWholeBinary(inBytes));
    if(numbers == nil) then
        error("incomplete byte sequence");
    end

    local outBytes = {};

    for j = #numbers, 1, -1 do

        local bin = numbers[j];

        local idx = #bin - 7;
        local tmp = "";

        while(idx > 0) do
            tmp = bin:sub(idx + 1, idx + 7) .. tmp;
            idx = idx - 8;
        end

        table.insert(outBytes, 1, binToDec(tmp));
    end

    return outBytes;
end

local vlq =
{
    encode = encode,
    decode = decode,
}

return vlq;