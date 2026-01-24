-- name: 保卫萝卜2
-- descript: 支付宝内购(ver. 5.2.6)
-- package: com.carrot.iceworld
-- author: 怀天

hook {
  class = "com.alipay.sdk.app.m",
  classloader = lpparam.classLoader,
  method = "b",
  params = {"int"},
  before = function(it)
      it.args[0] = int(9000)
  end,
  after = function(it)
    
  end,
}
