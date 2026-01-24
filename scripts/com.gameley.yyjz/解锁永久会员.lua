-- name: 元元记账
-- descript: 解锁永久会员(ver. 1.2.7)
-- package: com.gameley.yyjz
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context"},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.gameley.aibookkeeping.bean.UserInfo",
     method="getAdVipForever",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.aibookkeeping.bean.UserInfo",
     method="getNormalVipForever",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.aibookkeeping.bean.UserInfo",
     method="getVisitVipForever",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.aibookkeeping.bean.UserInfo",
     method="getAdVipBoolean",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.aibookkeeping.bean.UserInfo",
     method="getNormalVipBoolean",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.gameley.aibookkeeping.bean.UserInfo",
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
