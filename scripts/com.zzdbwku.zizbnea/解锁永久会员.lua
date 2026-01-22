-- name: 解锁永久会员
-- descript: 解锁永久会员(ver. 2.1.0)
-- package: com.zzdbwku.zizbnea
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context"},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.common.theone.utils.UserConfigUtils",
     method="vip",
     classloader=loader,
     params={},
     before=function(it)
         
     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.easy.login.entity.UserInfo",
     method="getMemberExpireDay",
     classloader=loader,
     params={},
     before=function(it)
         
     end,
     after=function(it)
         it.result = "9999-99-99"
     end
   }


 end
}
