-- name: 解锁本地会员
-- descript: 解锁本地会员(ver 2.1.9.16)
-- package: com.wujie.osconnect
-- author: 怀天

hook {
  class = "x9.d",
  classloader = lpparam.classLoader,
  method = "e",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = false
  end,
}hook {
  class = "xa.a",
  classloader = lpparam.classLoader,
  method = "p",
  params = {findClass("com.ld.projectcore.entity.UserInfo",lpparam.classLoader)},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
