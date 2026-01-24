-- name: 扫描Pro
-- descript: 终身会员(ver. 2.2.8)
-- package: com.qxwl.scanimg.scanassist
-- author: 怀天

hook {
  class="android.app.Application",
  method="attach",
  params={"android.content.Context",},
  after=function(it)
    local loader = invoke(it.thisObject, "getClassLoader")
    
    
    hook {
      class="com.jk.fufeicommon.utils.FufeiCommonDataUtil",
      method="getUserVIPEndDate",
      classloader=loader,
      params={findClass("android.content.Context",lpparam.classLoader)},
      before=function(it)

      end,
      after=function(it)
          it.result = "forever"
      end
    }hook {
      class="com.jk.fufeicommon.utils.FufeiCommonDataUtil",
      method="isVip",
      classloader=loader,
      params={findClass("android.content.Context",lpparam.classLoader)},
      before=function(it)

      end,
      after=function(it)
          it.result = true
      end
    }


  end
}
