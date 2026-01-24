-- name: 饥饿鲨：世界(4399)
-- descript: 4399版内购(ver. 6.5.10)
-- package: com.fgol.hsw.m4399
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
         if(it.args[1] == "Unity_purchaseFailed")
         then it.args[1] = "Unity_purchaseSucceeded"
         end
     end,
     after=function(it)
         
     end
   }
 end
}
