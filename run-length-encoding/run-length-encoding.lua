return {
    encode = function(str)

        local res = ""; local head = 1; local tail; local c;
        while(head <= #str) do
            c = str:sub(head, head);
            tail = head + 1;
            while(str:sub(tail, tail) == c) do tail = tail + 1; end
            if(tail == head + 1)
                then res = res .. c;
            else
                res = res .. (tail - head) .. c;
            end
            head = tail; tail = head + 1;
        end

        return res;
    end,

    decode = function(str)

        local res, num, c = "", "";
        for i = 1, #str do
            c = str:sub(i, i);
            if(c >= "0" and c <= "9") then
                num = num .. c;
            else
                num = tonumber(num) or 1;
                for j = 1, num do res = res .. c; end
                num = "";
            end
        end

        return res;
    end
}