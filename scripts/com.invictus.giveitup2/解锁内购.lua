-- name: 解锁内购
-- descript: 解锁支付宝内购(ver. 1.9.7)
-- package: com.invictus.giveitup2
-- author: 怀天

hook {
  class="android.app.Application",
  method="attach",
  params={"android.content.Context"},
  after=function(it)
    local loader = invoke(it.thisObject, "getClassLoader")
    
    
    hook {
      class="com.unity3d.player.UnityPlayer",
      method="UnitySendMessage",
      classloader=loader,
      params={"String","String","String"},
      before=function(it)
          if(it.args[1] == "purchaseFail")
          then it.args[1] = "BuySuccess"
          end
      end,
      after=function(it)
          
      end
    }


  end
}
