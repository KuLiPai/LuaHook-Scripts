-- name: 永不言弃
-- descript: 解锁支付宝内购(ver. 5.1.3)
-- package: com.invictus.impossiball
-- author: 怀天

hook {
  class = "com.east2west.sdk.AliPay.PayResult",
  classloader = lpparam.classLoader,
  method = "getResultStatus",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = "9000"
  end,
}
