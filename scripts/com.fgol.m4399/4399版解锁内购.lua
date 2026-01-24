-- name: 饥饿鲨：进化(4399)
-- descript: 4399版解锁内购(ver. 9.15.80.0)
-- package: com.fgol.m4399
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.unity3d.player.UnityPlayer",
     method="UnitySendMessage",
     classloader=loader,
     params={"String","String","String"},
     before=function(it)
         if(it.args[1] == "PurchaseFailedCallback")
         then it.args[1] = "PurchaseSucceededCallback"
         end
     end,
     after=function(it)
         
     end
   }


 end
}
