-- name: 解锁PRO
-- descript: 
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
