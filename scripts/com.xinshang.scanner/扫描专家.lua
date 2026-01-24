-- name: 扫描专家
-- descript: 解锁终身会员(ver. 1.6.1)
-- package: com.xinshang.scanner
-- author: 怀天

hook {
  class = "com.xinshang.scanner.module.ucenter.objects.ScannerUserVIPInfo",
  classloader = lpparam.classLoader,
  method = "h",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.xinshang.scanner.module.ucenter.objects.ScannerUserVIPInfo",
  classloader = lpparam.classLoader,
  method = "x",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = false
  end,
}hook {
  class = "com.xinshang.scanner.module.ucenter.objects.ScannerUserVIPInfo",
  classloader = lpparam.classLoader,
  method = "q",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
