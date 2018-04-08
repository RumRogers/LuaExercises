local School = {};

function School:new()

    local o = { _roster = {} };
    self.__index = self;
    setmetatable(o, self);
    return o;
end

function School:roster() return self._roster end
function School:add(student, grade)

    self._roster[grade] = self._roster[grade] or {};
    self._roster[grade][#self._roster[grade] + 1] = student;
    table.sort(self._roster[grade]);
end
function School:grade(g) return self._roster[g] or {}; end

return School;