-- name: 解锁终身会员
-- descript: 终身会员(ver. 5.2)
-- package: com.xueping.fishingweather
-- author: 怀天

hook {
  class="android.app.Application",
  method="attach",
  params={"android.content.Context",},
  after=function(it)
    local loader = invoke(it.thisObject, "getClassLoader")
    
    
    hook {
      class="com.xueping.fishingweather.helper.User",
      method="getIsvip",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }hook {
      class="com.xueping.fishingweather.helper.User",
      method="calculateISVip",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }hook {
      class="com.xueping.fishingweather.helper.User",
      method="getType",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = int(5)
      end
    }


  end
}
