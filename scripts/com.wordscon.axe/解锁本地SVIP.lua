-- name: 句子控
-- descript: 解锁本地SVIP(ver. 6.0.1)
-- package: com.wordscon.axe
-- author: 怀天

hook {
 class="android.app.Application",
 method="attach",
 params={"android.content.Context",},
 after=function(it)
   local loader = invoke(it.thisObject, "getClassLoader")
   
   
   hook {
     class="com.wordscon.axe.auth.AXUserManager$Companion",
     method="isMember",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wordscon.axe.auth.AXUserManager$Companion",
     method="isSuperMember",
     classloader=loader,
     params={},
     before=function(it)

     end,
     after=function(it)
         it.result = true
     end
   }hook {
     class="com.wordscon.axe.auth.AXUserManager$Companion",
     method="isPermanentMember",
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
