-- name: 解锁永久会员
-- descript: 解锁永久会员(ver. 2.5.5)
-- package: com.gameley.ttjz
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.gameley.ttjz.bean.UserInfo",
     method="getNormalVipBoolean",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.ttjz.bean.UserInfo",
     method="getNormalVipForever",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.ttjz.bean.UserInfo",
     method="getAdVipBoolean",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.ttjz.bean.UserInfo",
     method="getAdVipForever",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.ttjz.bean.UserInfo",
     method="getVisitVipForever",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.ttjz.bean.UserInfo",
     method="getVisitVipBoolean",
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
