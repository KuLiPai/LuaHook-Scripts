-- name: 小宇宙
-- descript: 解锁本地PLUS(ver. 2.101.0)
-- package: app.podcast.cosmos
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="io.iftech.android.podcast.remote.model.vip.VipEntranceDataKt",
     method="isVip",
     classloader=loader,
     params={findClass("io.iftech.android.podcast.remote.model.vip.VipEntranceData",loader)},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="io.iftech.android.podcast.remote.model.vip.VipEntranceData",
     method="getMemberType",
     classloader=loader,
     params={},
     before=function(it)
         
     end,
     after=function(it)
         it.result = getField("io.iftech.android.podcast.remote.model.vip.VipType","PLATFORM_L1")
     end
   }


 end
}
