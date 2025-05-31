-- name: 微信发图片文本消息提交步数
-- descript: 主动调用微信的方法，发送消息
-- package: com.tencent.mm
-- author: 帕帝
imports "android.widget.Toast"
imports "java.lang.Long"
imports "android.content.Context"
imports "java.lang.String"
imports "java.lang.reflect.Array"
imports "java.util.ArrayList"
imports "top.sacz.xphelper.dexkit.FieldFinder"
imports "java.lang.reflect.Modifier"
imports "top.sacz.xphelper.dexkit.bean.MethodInfo"
imports "top.sacz.xphelper.dexkit.bean.ClassInfo"
imports "java.lang.reflect.Modifier"
imports "java.lang.Integer"

hook("android.app.Application",
  lpparam.classLoader,
  "attach",
  "android.content.Context",
  function(it) end,
  function(it)
    local application = it.thisObject
    local loader = invoke(it.thisObject, "getClassLoader")
    XpHelper.initContext(it.thisObject)
    XpHelper.injectResourcesToContext(it.thisObject)
    DexFinder = DexFinder.INSTANCE
    DexFinder.create(lpparam.appInfo.sourceDir)
    local ctorInfo = new(MethodInfo)
    ctorInfo.setParamCount(1)
    ctorInfo.setUsedString({
      "MicroMsg.NetSceneSendMsg",
      "markMsgFailed for id:%d"
    })
    local cotrClass = ctorInfo.generate().firstOrNull().getDeclaringClass()
    local returnTypeInfo = new(MethodInfo)
    returnTypeInfo.setParamCount(4)
    returnTypeInfo.setUsedString({ "MicroMsg.Mvvm.NetSceneObserverOwner" })
    local returnTypeClass = returnTypeInfo.generate().firstOrNull().getDeclaringClass()
    local mInfo = new(MethodInfo)
    mInfo.setParamCount(0)
    mInfo.setReturnType(returnTypeClass)
    local method = mInfo.generate().firstOrNull()

    local postInfo = new(MethodInfo)
    postInfo.setSearchPackages({ "com.tencent.mm.modelbase" })
    postInfo.setUsingNumbers({ 0 })
    local classInfo = new(MethodInfo)
    classInfo.setParamCount(2)
    classInfo.setUsedString({
      "worker thread has not been se",
      "MicroMsg.NetSceneQueue",
    })
    local class = classInfo.generate().firstOrNull().getDeclaringClass()
    postInfo.setDeclaredClass(class)
    local param = new(MethodInfo)
    param.setParamCount(3)
    param.setUsedString({ "scene security verification not passed, type=" })
    local paramType = param.generate().firstOrNull().getDeclaringClass()
    postInfo.setParameters({
      paramType
    })
    postInfo.setReturnType(findClass("java.lang.Boolean", loader).TYPE)
    local postMethod = postInfo.generate().firstOrNull()
    local sendMsgCotr = getConstructor(cotrClass, "java.lang.String", "java.lang.String", "int", "int",
      "java.lang.Object")

    local sportClass = MethodInfo() {
      searchPackages = { "com.tencent.mm.plugin.sport.model" },
      usingNumbers = { 10, 12 },
      useString = {
        "MicroMsg.Sport.NetSceneUploadDeviceStep",
        "NetSceneUploadDeviceStep end: errType: %d, errCode: %d, errMsg: %s",
      }
    }.generate().firstOrNull().getDeclaringClass()

    sendTextMsg = function(talker, sendContent)
      local sendMsgObj = callMethod(method)
      local messageObj = newInstance(sendMsgCotr, talker, sendContent, 1, 0, nil)
      invoke(sendMsgObj, invoke(postMethod, "getName"), messageObj)
    end

    local classInfo = new(MethodInfo)
    classInfo.setSearchPackages({ "com.tencent.mm.modelimage" })
    classInfo.setParamCount(3)
    classInfo.setUsedString({
      "task_NetSceneUploadMsgImg",
      "field_sendmsg_viacdn",
    })
    local imageClass = classInfo.generate().firstOrNull().getDeclaringClass()
    local param = new(MethodInfo)
    param.setSearchPackages({ "com.tencent.mm.modelbase" })
    param.setParamCount(3)
    local m = new(MethodInfo)
    m.setParamCount(6)
    m.setMethodName("onGYNetEnd")
    m.setUsedString({
      "MicroMsg.NetSceneDownloadAppAttach",
      "data buffer is incorrect datalen:",
    })

    param.setCallMethods({
      m.generate().firstOrNull()
    })
    local paramClass = param.generate().firstOrNull().getDeclaringClass()
    sendImageMsg = function(talker, sendPath)
      local selfWxid = application.getSharedPreferences("com.tencent.mm_preferences", 0).getString(
        "login_weixin_username", "")
      local sendMsgObj = callMethod(method)
      local messageObj = imageClass(4, selfWxid, talker,
        sendPath, 1, nil, 0, nil, "", true, 0)
      invoke(sendMsgObj, invoke(postMethod, "getName"), messageObj)
    end

    hookcotr(invoke(sportClass, "getName"),
      loader,
      "java.lang.String", "java.lang.String", "int",
      "int", "int", "java.lang.String", "int",
      function(it)
        it.args[4] = Integer(66666)
      end,
      function(it)
        local sendMsgObj = callMethod(method)
        invoke(sendMsgObj, invoke(postMethod, "getName"), it.thisObject)
      end)

    hook("android.app.Activity",
      loader,
      "onKeyDown",
      "int",
      "android.view.KeyEvent",
      function(it)
      end,
      function(it)
        local context = it.thisObject
        local keyCode = it.args[0]
        if keyCode == 24 then
          sendImageMsg("wxid",
            "/storage/emulated/0/新建文件夹/图片/烧鸡.png")

          http.get("https://v1.hitokoto.cn/", function(code, str)
            if code == 200 then
              local data = json.decode(str)
              local text = data.hitokoto
              sendTextMsg("wxid", text)
            end
          end)
        end
        if keyCode == 25 then
        end
      end)
  end)
