local PhoneNumber = { number = "0000000000" }; -- default "static" value

function PhoneNumber:new(str)

    local o = {};
    self.__index = self;
    setmetatable(o, self);

    o.number = (function ()
        local cleanNumber = "";
        for i in string.gmatch(str, "%w+") do cleanNumber = cleanNumber .. i end;
        if(#cleanNumber > 11 or #cleanNumber < 10) then return nil end;
        if(#cleanNumber == 11) then
            if(cleanNumber:sub(1, 1) ~= '1') then return nil else cleanNumber = cleanNumber:sub(2); end
        end
        return cleanNumber;
    end)()

    return o;
end

function PhoneNumber:areaCode()
    return self.number:sub(1, 3);
end

function PhoneNumber:__tostring()
    return "(" .. self.number:sub(1, 3) .. ")" .. " " .. self.number:sub(4, 6) .. "-" .. self.number:sub(7, 10)
end

return PhoneNumber;