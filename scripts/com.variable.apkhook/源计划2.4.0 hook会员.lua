-- name: 源计划2.4.0 hook会员
-- descript: 解锁源计划2.4.0的会员权限
-- package: com.variable.apkhook
-- author: huajiqaq
imports "java.lang.System"

local needtip=true

hook("android.app.Activity",
lpparam.classLoader,
"onCreate",
"android.os.Bundle",
function(it)
end,
function(it)
  local activity=it.thisObject
  local bmobUserClass = XposedHelpers.findClass("cn.bmob.v3.BmobUser", lpparam.classLoader);
  local islogin = XposedHelpers.callStaticMethod(bmobUserClass, "isLogin");

  if islogin==false then
    new("android.app.AlertDialog$Builder",activity)
    .setTitle("提示")
    .setMessage([[你当前没有登录 软件有注册验证 当注册时hook到期时间会被检测 因为注册时间到期时间应是默认时间 导致封号 hook将在登录后再次打开软件生效]])
    .setPositiveButton("确定", nil)
    .setCancelable(false)
    .show()
   else
    if needtip then

      local tipdia2= new("android.app.AlertDialog$Builder",activity)
      .setTitle("提示")
      .setMessage([[请自行打开hook lua文件 将needtip变量改为false hook将在下次启动app生效 生效后请手动退出登录 点击强制退出登录 随后再次登录让软件更新状态 否则可能无法使用会员功能]])
      .setPositiveButton("确定",nil)
      .setCancelable(false)

      new("android.app.AlertDialog$Builder",activity)
      .setTitle("提示")
      .setMessage([[在开启hook过后 在之后版本可能失效 也可能导致你的账号被封号 请谨慎更新版本 建议使用临时账号并且在hook前随机安卓id 不登录自己账号 不建议长期使用
封号后将无法再注册账号 会提示error
在开启请勿关闭 否则可能会因为信息不一致封号
在开启后如若想注册账号请退出登录后重启app刷新脚本hook状态 脚本只会在登录后hook 请勿在hook启动后注册 否则封号
在封号后 可手动更改软件安卓id 并且前往 /data/misc/ 搜索 com.variable.apkhook 删除
如果还不行 可自行下载其他机型隐藏模块 对该软件生效 不过一般只需更改安卓id重启系统即可
测试版本 2.4.0-通用版
如果你已阅读完整 请点击确认]])
      .setPositiveButton("确定", {onClick=function()
          tipdia2.show()
      end})
      .setCancelable(false)
      .show()

     else
      init()
    end
  end
end)

function init()
  hook("cn.bmob.v3.http.RequestUtils",
  lpparam.classLoader,
  "decryDataWithSecretKey",
  "java.lang.String",
  function(it)
  end,
  function(it)
    local result=it.result
    if result:find("username") and result:find("pass") and result:find("email") and result:find("CodeID") and result:find("OverdueAt") then
      local data = json.decode(result)
      local myresults = data.data
      if data.data.results then
        myresults=data.data.results[1]
      end
      myresults.CodeID = "天数：99999"
      myresults.OverdueAt="2999-01-01 00:00:00"
      myresults.ListJsonConfig =json.encode({myresults.JSONConfig})
      local encoded=json.encode(data)
      --System.out.println(encoded)
      it.result=encoded
     elseif result:find("count") and result:find("results") and not result:find("JSONConfig") then
      it.result='{"data":{"count":1,"results":[]},"result":{"code":200,"message":"ok"}}'
     else
      System.out.println(it.result)
    end
  end)

  -- 修改回原来值防止检测
  hook("cn.bmob.v3.util.EncryptUtils",
  lpparam.classLoader,
  "encrypt",
  "String","String","String",
  function(it)
    local arg = it.args[2]
    arg=arg:gsub("天数：99999","")
    arg=arg:gsub("2999%-01%-01 00:00:00","1970-01-01 08:00:00")
    arg=arg:gsub('"ListJsonConfig":%s*"%b[]"', '"ListJsonConfig":""')
    it.args[2] = arg
    --System.out.println(it.args[2])

  end,
  function(it)
  end)
end

-- 废弃的修改方法 适用于2.4.0-通用版 核心检测在com.variable.apkhook.fk0 不过混淆太复杂本人太菜不看了
--[[
第一种 修改时间 会触发封号
hook("cn.bmob.v3.BmobConfigInfo",
lpparam.classLoader,
"getOverdueAt",
function(it)
end,
function(it)
  it.result="2999-01-01 00:00:00"
end)

hook("cn.bmob.v3.AccountInfo",
lpparam.classLoader,
"getOverdueAt",
function(it)
end,
function(it)
  it.result="2999-01-01 00:00:00"
end)

hook("org.json.JSONObject",
lpparam.classLoader,
"optString",
"String","String",
function(it)
end,
function(it)
  local result=it.result
  result = result:gsub("1970%-01%-01 08:00:00","2999-01-01 00:00:00")
  if it.args[1]=="CodeID" then
    result = "天数：99999"
  end
  it.result = result
  System.out.println(it.result)
end)
]]

--[[
--无用的 2.4.0-通用版 检测日期 修改true可以vip 需要过检测 但是混淆了本人太菜了不会搞
hook("com.variable.apkhook.m72",
lpparam.classLoader,
"final",
"java.util.Date","java.util.Date",
function(it)

end,
function(it)
it.result=true
end)
]]

--[[
-- 另一种hook date的方法 需要过检测
hook("java.text.DateFormat",
lpparam.classLoader,
"parse",
"String",
function(it)
  local arg = it.args[0]
  if arg=="1970-01-01 08:00:00"
     it.args[0]="2315-01-01 08:00:00"
    end
  System.out.println(tostring(it.args[0]))

end,
function(it)

end)
]]

--[[
-- 第二种破解方法 但是软件有了很多检测 太复杂了不会搞
hook("cn.bmob.v3.BmobConfigInfo",
lpparam.classLoader,
"setOverdueAt",
"String",
function(it)
  it.args[0]="2999-01-01 00:00:00"
end,
function(it)
end)
]]

--[[
-- 无用的过检测方法
hook("org.json.JSONObject",
lpparam.classLoader,
"optString",
"String","String",
function(it)
end,
function(it)
  local result=it.result
  if result:find("1970%-01%-01 08:00:00")
    System.out.println(it.thisObject)
  end

end)

-- 调试方法
hook("kotlin.internal.d",
lpparam.classLoader,
"ad",
"java.lang.Object",
function(it)
end,
function(it)
  if it.result~=1
    System.out.println(it.args[0])
  end
end)

]]
