-- name: AI美图师
-- descript: 解锁永久会员(ver. 2.9.1)
-- package: com.zhuoxiang.ai.meitu
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
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
     class="com.wm.common.user.UserInfoManager",
     method="isVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wm.common.user.info.FunctionBean",
     method="getUseNumber",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = int(999)
     end
   }hook {
     class="com.zx.ai.ps.tools.PayTool",
     method="isFunUsePoint",
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
