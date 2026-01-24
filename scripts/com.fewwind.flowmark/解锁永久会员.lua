-- name: FlowMark
-- descript: 解锁永久会员(ver. 2.6.6)
-- package: com.fewwind.flowmark
-- author: 怀天

hook {
  class = "com.fewwind.flowmark.data.user.UserInfo",
  classloader = lpparam.classLoader,
  method = "getOrderId",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = "isVip"
  end,
}hook {
  class = "com.fewwind.flowmark.util.r$a",
  classloader = lpparam.classLoader,
  method = "a",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = "pro2"
  end,
}hook {
  class = "com.fewwind.flowmark.data.user.UserInfo",
  classloader = lpparam.classLoader,
  method = "getProType",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = "pro2"
  end,
}
