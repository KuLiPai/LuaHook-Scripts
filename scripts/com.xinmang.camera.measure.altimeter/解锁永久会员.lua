-- name: 解锁永久会员
-- descript: 解锁永久会员(ver. 2.5.79)
-- package: com.xinmang.camera.measure.altimeter
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context"},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.wm.common.user.UserManager",
     method="isPermanentVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wm.common.user.UserManager",
     method="isVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wm.common.user.info.UserInfoManager",
     method="isPermanentVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wm.common.user.info.UserInfoManager",
     method="isVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wm.common.ad.util.AdUtil",
     method="isVip",
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
