-- name: 解锁永久会员
-- descript: 解锁永久会员(ver. 2.2.0)
-- package: com.draft.infinitenote
-- author: 怀天

hook {
  class="android.app.Application",
  method="attach",
  params={"android.content.Context"},
  after=function(it)
    local loader = invoke(it.thisObject, "getClassLoader")
    
    
    hook {
      class="com.fenghuajueli.libbasecoreui.user.UserInfoUtils",
      method="isForeverVip",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }hook {
      class="com.fenghuajueli.libbasecoreui.data.entity.user.UserInfoEntity$UserInfoBean$VipInfoBean",
      method="getVip_type",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = int(1)
      end
    }hook {
      class="com.fenghuajueli.libbasecoreui.user.UserInfoUtils",
      method="isVip",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }hook {
      class="com.fenghuajueli.libbasecoreui.baseswitch.SwitchKeyUtils",
      method="getPayStatus",
      classloader=loader,
      params={},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }


  end
}
