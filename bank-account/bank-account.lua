local BankAccount = { availableMoney = 0, closed = false };

function BankAccount:new()

    local o = {};
    self.__index = self;
    setmetatable(o, self);
    return o;
end

function BankAccount:deposit(amount)

    assert(not self.closed, "Error: account is closed.")
    assert(amount > 0, "Error: deposits must be positive.")
    self.availableMoney = self.availableMoney + amount;
end

function BankAccount:withdraw(amount)

    assert(not self.closed, "Error: account is closed.")
    assert(amount > 0, "Error: withdraws must be positive.")
    assert(amount <= self.availableMoney, "Error: not enough money.")
    self.availableMoney = self.availableMoney - amount;
end

function BankAccount:close()

    self.closed = true;
end

function BankAccount:balance()

    return self.availableMoney;
end

return BankAccount;