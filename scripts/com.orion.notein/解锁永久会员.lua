-- name: 解锁永久会员
-- descript: 永久会员(ver. 1.3.70.0)
-- package: com.orion.notein
-- author: 怀天

hook {
  class="android.app.Application",
  method="attach",
  params={"android.content.Context",},
  after=function(it)
    local loader = invoke(it.thisObject, "getClassLoader")
    
    
    hook {
      class="com.orion.notein.domain.models.User",
      method="isVip",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }hook {
      class="com.orion.notein.domain.models.User",
      method="isForeverVip",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }hook {
      class="com.orion.notein.domain.models.User",
      method="getMembership",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = int(1)
      end
    }


  end
}
