-- name: 解锁内购
-- descript: 解锁内购(ver. 4.3.0)
-- package: com.joym.xiongdakuaipao
-- author: 怀天

hook {
  class = "com.joym.PaymentSdkV2.PayLogic$5$1$1",
  classloader = lpparam.classLoader,
  method = "onCallback",
  params = {"int","String","java.lang.Object"},
  before = function(it)
    it.args[0] = int(100)
  end,
  after = function(it)
    
    
  end,
}
