-- name: 开练
-- descript: 解锁永久会员(ver. 7.0.4)
-- package: com.yuanlue.sportnote
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.yuanlue.sportnote.login.UserInfo$UserData",
     method="isVip",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.yuanlue.sportnote.login.UserInfo$UserData",
     method="isForeverVip",
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
