-- name: 去水印吧
-- descript: 支付宝内购+去广告(ver. 2.1.9)
-- package: company.szkj.watermark
-- author: 怀天

hook {
  class = "com.qq.e.ads.splash.SplashAD",
  classloader = lpparam.classLoader,
  method = "b",
  params = {findClass("android.view.ViewGroup",lpparam.classLoader),"boolean"},
  before = function(it)
    it.args[0] = nil
    it.args[1] = false
  end,
  after = function(it)
    
    
  end,
}hook {
  class = "com.alipay.sdk.m.j.c",
  classloader = lpparam.classLoader,
  method = "b",
  params = {"int"},
  before = function(it)
    it.args[0] = int(9000)
  end,
  after = function(it)

  end,
}
