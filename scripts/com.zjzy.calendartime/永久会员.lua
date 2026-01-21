-- name: 永久会员
-- descript: 解锁永久会员(ver. 8.8.3)
-- package: com.zjzy.calendartime
-- author: 怀天

hook {
  class = "com.app.modelintegral.data.bean.UserInfoBean",
  classloader = lpparam.classLoader,
  method = "getVIP",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = int(2)
  end,
}
