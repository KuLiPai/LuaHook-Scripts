-- name: 最后一卷胶片
-- descript: 解锁PRO(ver. 2.17)
-- package: com.pixelorange.filmroll
-- author: 怀天

hook {
  class = "com.pixelorange.filmroll.utils.UserDefaultUtils",
  classloader = lpparam.classLoader,
  method = "getProState",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
