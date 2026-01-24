-- name: AiPPT生成
-- descript: 解锁会员(ver. 2.0.14)
-- package: com.zuoan.ai.pptsc
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.zuoan.ai.pptsc.newapibean.LoginResponse$UserrichBean",
     method="getIsvalidsvip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = "1"
     end
   }hook {
     class="com.zuoan.ai.pptsc.newapibean.LoginResponse$UserrichBean",
     method="getIsvalidvip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = "1"
     end
   }hook {
     class="com.zuoan.ai.pptsc.newapibean.LoginResponse$UserrichBean",
     method="getSviptype",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = "24"
     end
   }hook {
     class="com.zuoan.ai.pptsc.newapibean.LoginResponse$UserrichBean",
     method="getViptype",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = "4"
     end
   }


 end
}
