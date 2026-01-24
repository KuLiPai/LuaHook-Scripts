-- name: 朝花夕拾
-- descript: 解锁永久高级版(ver. 1.3.4)
-- package: com.magicalstory.days
-- author: 怀天

hook {
  class = "bb.h",
  classloader = lpparam.classLoader,
  method = "d",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = "永久高级版"
  end,
}hook {
  class = "bb.h",
  classloader = lpparam.classLoader,
  method = "j",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
