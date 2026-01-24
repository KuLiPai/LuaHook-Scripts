-- name: 简讯
-- descript: 解锁VIP(ver. 5.0.59)
-- package: com.tipsoon.android
-- author: 怀天

replace {
  class = "com.tipsoon.android.myview.MainTipsView",
  classloader = lpparam.classLoader,
  method = "b",
  params = {},
  replace = function(it)
    
    
    
  end,
}hook {
  class = "com.tipsoon.android.bean.ResultForJxCurentLoginUserInfos$DataUsrInfBean",
  classloader = lpparam.classLoader,
  method = "getVip_expire_time",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = "5555-55-55"
  end,
}hook {
  class = "com.tipsoon.android.bean.ResultForJxCurentLoginUserInfos$DataUsrInfBean",
  classloader = lpparam.classLoader,
  method = "isIs_vip",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
