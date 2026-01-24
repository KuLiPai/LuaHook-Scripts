-- name: YOYO日常
-- descript: 解锁本地会员(ver. 3.6.0)
-- package: cn.nineton.dailycheck
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   hook {
     class="cn.nineton.dailycheck.utils.LoginUtil",
     method="isSuperVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="cn.nineton.dailycheck.data.net.MineBean$UserBean",
     method="getSvipStatus",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = int(2)
     end
   }hook {
     class="cn.nineton.dailycheck.data.CacheManager",
     method="getSVipBuyTips",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = "forever"
     end
   }hook {
     class="cn.nineton.dailycheck.utils.LoginUtil",
     method="isVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="cn.nineton.dailycheck.utils.LoginUtil",
     method="isVipExpired",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = false
     end
   }hook {
     class="cn.nineton.dailycheck.utils.LoginUtil",
     method="isSuperForeverVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="cn.nineton.dailycheck.data.net.MineBean$UserBean",
     method="isSuperVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="cn.nineton.dailycheck.utils.LoginUtil",
     method="isForeverVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="cn.nineton.dailycheck.data.net.MineBean$UserBean",
     method="isIs_vip",
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
