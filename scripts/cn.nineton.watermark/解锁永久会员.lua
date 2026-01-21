-- name: 解锁永久会员
-- descript: 一键去水印永久会员(ver. 3.5.6)
-- package: cn.nineton.watermark
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="cn.nineton.watermark.data.net.UserInfo",
     method="isVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = int(1)
     end
   }hook {
     class="cn.nineton.watermark.data.net.UserInfo",
     method="getVipType",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = int(4)
     end
   }hook {
     class="cn.nineton.watermark.data.net.UserInfo",
     method="getToVipEndTime",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = "forever"
     end
   }


 end
}
