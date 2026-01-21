-- name: 解锁PRO
-- descript: Fotor 本地会员(ver.7.4.4.1136)
-- package: com.everimaging.photoeffectstudio
-- author: 怀天

hook {
  class = "com.everimaging.fotorsdk.paid.subscribe.e",
  classloader = lpparam.classLoader,
  method = "B",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
