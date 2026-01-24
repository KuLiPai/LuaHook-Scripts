-- name: 团纸日记
-- descript: 解锁永久PRO(ver. 3.5.1)
-- package: com.tuanzhiriji.ningguang
-- author: 怀天

hook {
  class = "com.tuanzhiriji.ningguang.app.activity.MyApplication",
  classloader = lpparam.classLoader,
  method = "getPermanentPro",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.tuanzhiriji.ningguang.app.base.BaseActivity",
  classloader = lpparam.classLoader,
  method = "isPro",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
