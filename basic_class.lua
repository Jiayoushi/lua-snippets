Resize = {
  a = 0,
  b = 0,

  new = function(self, params)
    object = {
      a = params["a"],
      b = params["b"],
    }
    setmetatable(object, self)
    self.__index = self
    return object
  end,

  validate = function(self)
    print("Resize validate " .. self.a .. " " .. self.b)
  end,

  execute = function(self)
    print("Resize execute " .. self.a .. " " .. self.b)
  end
}

Rotate = {
  a = 0,
  b = 0,
  c = 0,

  new = function(self, params)
    object = {
      a = params["a"],
      b = params["b"],
      c = params["c"],
    }
    setmetatable(object, self)
    self.__index = self
    return object
  end,

  validate = function(self)
    print("Rotate validate " .. self.a .. " " .. self.b .. " " .. self.c)
  end,

  execute = function(self)
    print("Rotate execute " .. self.a .. " " .. self.b .. " " .. self.c)
  end
}

function create_operator(action, params)
  FactoryTable = {
    resize = Resize,
    rotate = Rotate,
  }
  return FactoryTable[action]:new(params)
end

op1 = create_operator("resize", {a = 1, b = 2})
op2 = create_operator("resize", {a = 4, b = 5})
op3 = create_operator("rotate", {a = 1, b = 2, c = 3})
op4 = create_operator("rotate", {a = 7, b = 8, c = 9})

array = {op1, op2, op3, op4}

for _,v in ipairs(array) do
  v:validate()
  v:execute()
end
