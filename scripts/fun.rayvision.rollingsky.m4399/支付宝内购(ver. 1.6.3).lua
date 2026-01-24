-- name: 滚动的天空(4399)
-- descript: 支付宝内购(ver. 1.6.3)
-- package: fun.rayvision.rollingsky.m4399
-- author: 怀天

hook {
  class = "com.alipay.sdk.m.j.c",
  classloader = lpparam.classLoader,
  method = "b",
  params = {"int"},
  before = function(it)
    it.args[0] = int(9000)
  end,
  after = function(it)

  end,
}
