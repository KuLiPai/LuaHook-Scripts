-- name: 源计划2.4.1 hook会员
-- descript: 解锁源计划2.4.1的会员权限
-- package: com.variable.apkhook
-- author: huajiqaq
imports "java.lang.System"

imports "javax.crypto.spec.SecretKeySpec"
imports "javax.crypto.Cipher"
imports "android.util.Base64"
imports "java.lang.String"
imports "android.app.AlertDialog"

local needtip = true
local UUID_arg1,UUID_arg2,AndroidID

-- 设置随机种子
math.randomseed(os.time())

-- 生成任意范围的随机整数
function randomAnyInteger()
  -- 随机决定正负号
  local sign = math.random(0, 1) == 0 and -1 or 1
  -- 生成大范围的随机数
  return sign * math.random(1, 2^30)
end

-- 生成随机安卓ID（16字节十六进制）
function randomAndroidID()
  local androidId = ""
  local hexChars = "0123456789abcdef"
  -- 生成16字节（32个十六进制字符）
  for i = 1, 32 do
    local randomIndex = math.random(1, 16) -- 1-16的范围是安全的
    androidId = androidId .. hexChars:sub(randomIndex, randomIndex)
  end
  return androidId
end

hook("android.app.Activity",
lpparam.classLoader,
"onCreate",
"android.os.Bundle",
function(it)
end,
function(it)
  local activity=it.thisObject

  imports "android.R"
  imports "java.util.UUID"

  if not UUID_arg1 or not UUID_arg2 or not AndroidID then
    local UUID_arg1,UUID_arg2,AndroidID=randomAnyInteger(),randomAnyInteger(),randomAndroidID()
    AlertDialog.Builder(activity)
    .setTitle("提示")
    .setMessage("请先修改Hook Lua文件中的变量。注意：修改后务必手动清理软件数据，如需关闭脚本也请清除软件数据。\n可长按复制：\nlocal UUID_arg1,UUID_arg2,AndroidID="..UUID_arg1..","..UUID_arg2..",\""..AndroidID.."\"")
    .setPositiveButton("确定",nil)
    .setCancelable(false)
    .show()
    .findViewById(R.id.message).setTextIsSelectable(true)
    return
   else
    hookcotr("android.media.MediaDrm",
    lpparam.classLoader,
    "java.util.UUID",
    function(it)
      it.args[0]=UUID(UUID_arg1,UUID_arg2)
    end,
    function(it)
    end)
    hook("android.provider.Settings$System",
    lpparam.classLoader,
    "getString",
    "android.content.ContentResolver","String",
    function(it)
    end,
    function(it)
      if it.args[1]== "android_id" then
        it.result = AndroidID
      end
    end)
  end

  local bmobUserClass = XposedHelpers.findClass("cn.bmob.v3.BmobUser", lpparam.classLoader);
  local islogin = XposedHelpers.callStaticMethod(bmobUserClass, "isLogin");

  if islogin==false then
    AlertDialog.Builder(activity)
    .setTitle("提示")
    .setMessage([[你当前没有登录。软件有注册验证，注册账号时到期时间是默认状态，如果在注册时启用Hook将会导致封号。
Hook将在你登录并重启一次App后生效。请先登录再使用，不要在Hook生效时新注册账号。当前并未启动Hook。]])
    .setPositiveButton("确定", nil)
    .setCancelable(false)
    .show()
   else
    if needtip then

      local tipdia2 = AlertDialog.Builder(activity)
      .setTitle("提示")
      .setMessage([[请自行打开Hook Lua文件，将 needtip 变量修改为 false，修改后将在下次启动APP时生效。
若仍未生效，请手动退出登录（选择“强制退出登录”），然后重新登录，以便更新会员状态。否则可能无法正常使用会员功能。]])
      .setPositiveButton("确定",nil)
      .setCancelable(false)

      AlertDialog.Builder(activity)
      .setTitle("提示")
      .setMessage([[启用Hook后可能存在版本失效或封号风险，请谨慎使用。建议使用临时账号，勿登录主账号，避免长期使用。
一旦封号，可能出现无法操作、无限加载或报错等问题。若Hook已生效，请先退出登录并重启App后再注册账号，否则易导致封号。
封号后可尝试：
1. 修改Hook变量（local UUID_arg1,UUID_arg2,AndroidID）以重新触发随机生成；
2. 删除目录：/data/misc/com.variable.apkhook
支持版本：2.4.1-通用版
请确认已阅读以上内容。]])
      .setPositiveButton("确定", {onClick=function()
          tipdia2.show()
          .findViewById(R.id.message).setTextIsSelectable(true)

      end})
      .setCancelable(false)
      .show()
      .findViewById(R.id.message).setTextIsSelectable(true)

     else
      init()
    end
  end
end)



local ALGORITHM = "AES/ECB/PKCS5Padding"; -- 使用ECB模式和PKCS5填充

function encrypt(plainText, key)
  local secretKey = SecretKeySpec(String(key).getBytes(), "AES");

  local cipher = Cipher.getInstance(ALGORITHM);
  cipher.init(Cipher.ENCRYPT_MODE, secretKey);

  local encrypted = cipher.doFinal(String(plainText).getBytes())
  return Base64.encodeToString(encrypted, Base64.NO_CLOSE);
end

function decrypt(cipherText, key)
  local cipherText = Base64.decode(cipherText, Base64.NO_CLOSE);
  local secretKey = SecretKeySpec(String(key).getBytes(), "AES");

  local cipher = Cipher.getInstance(ALGORITHM);
  cipher.init(Cipher.DECRYPT_MODE, secretKey);

  local decrypted = cipher.doFinal(cipherText);
  return tostring(String(decrypted));
end



function decrypt_by_subtraction(offset, encrypted_text)
  if encrypted_text == nil or encrypted_text == "" then
    return ""
  end

  local charArray = String(encrypted_text).toCharArray();

  for i = 0, #charArray - 1 do
    --在androlua+需要添加char() 在luaj++不需要
    charArray[i] = charArray[i] - offset;
    --charArray[i] = char(charArray[i] - offset);
  end

  return tostring(String(charArray));
end

function split(str, delimiter)
  local result = luajava.astable(String(str).split(delimiter))
  return result
end

local key = "nmb9Zz2BhGcsMd=="
function makeDevDebug(data)
  if type(data) == "table" then
    local username, pass, isBanned = data.username, data.pass, data.isBanned
    local devDebug = username .. "渣男密码数据解析" .. pass .. "渣男密码数据解析" .. isBanned
    local str = decrypt_by_subtraction( - 16, devDebug)
    local str2 = encrypt(str, key)
    local result = decrypt_by_subtraction( - 16, str2)
    return result
   else
    local devDebug = data
    local str1 = decrypt_by_subtraction(16, devDebug)
    local str2 = decrypt(str1, key)
    local result = decrypt_by_subtraction(16, str2)
    return result
  end
end

function makeSource(data)
  if type(data) == "table" then
    local username, OverdueAt, AppMode, UnBindData, AndroidID = data.username, data.OverdueAt, data.AppMode, data.UnBindData, data.AndroidID
    local source = username .. "渣男密钥数据解析" .. OverdueAt .. "渣男密钥数据解析" .. AppMode .. "渣男密钥数据解析" .. UnBindData .. "渣男密钥数据解析" .. AndroidID .. "渣男密钥数据解析"
    local str = decrypt_by_subtraction( - 16, source)
    local str2 = encrypt(str, key)
    local result = decrypt_by_subtraction( - 16, str2)
    return result
   else
    local source = data
    local str1 = decrypt_by_subtraction(16, source)
    local str2 = decrypt(str1, key)
    local result = decrypt_by_subtraction(16, str2)
    return result
  end
end

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
      local o_devdebug = makeDevDebug(myresults.devDebug)
      System.out.println("dec_o_devdebug"..o_devdebug)
      local o_source = makeDevDebug(myresults.source)
      System.out.println("dec_o_source"..o_source)
      local o_souece_data = split(o_source,"渣男密钥数据解析")

      local build_table = {
        username = o_souece_data[1],
        OverdueAt = myresults.OverdueAt,
        AppMode = o_souece_data[3],
        UnBindData = o_souece_data[4],
        AndroidID = o_souece_data[5]
      }
      local n_source = makeSource(build_table)
      System.out.println("dec_n_source"..n_source)
      myresults.source = n_source

      local o_devdebug_data = split(o_devdebug,"渣男密码数据解析")
      local build_table = {
        username = o_devdebug_data[1],
        pass = o_devdebug_data[2],
        isBanned = o_devdebug_data[3]
      }

      local n_devdebug = makeDevDebug(build_table)
      System.out.println("dec_n_devdebug"..n_devdebug)

      local encoded=json.encode(data)

      System.out.println("dec_origin"..result)
      System.out.println("dec_finial"..encoded)
      it.result=encoded
     else
      --System.out.println(it.result)
    end
  end)


  -- 修改回原来值防止检测
  hook("cn.bmob.v3.util.EncryptUtils",
  lpparam.classLoader,
  "encrypt",
  "String","String","String",
  function(it)
    local result = it.args[2]
    if result:find("username") and result:find("pass") and result:find("email") and result:find("CodeID") and result:find("OverdueAt") then
      local data = json.decode(result)

      local myresults = data.data

      if data.data.where then
        myresults = data.data.where
      end

      local codeID = myresults.CodeID
      local overdueAt = myresults.OverdueAt
      local devDebug = myresults.devDebug
      local source = myresults.source

      myresults.CodeID = ""
      myresults.OverdueAt="1970-01-01 08:00:00"

      local o_devdebug = makeDevDebug(myresults.devDebug)
      System.out.println("enc_o_devdebug"..o_devdebug)
      local o_source = makeDevDebug(myresults.source)
      System.out.println("enc_o_source"..o_source)
      local o_souece_data = split(o_source,"渣男密钥数据解析")

      local build_table = {
        username = o_souece_data[1],
        OverdueAt = myresults.OverdueAt,
        AppMode = o_souece_data[3],
        UnBindData = o_souece_data[4],
        AndroidID = o_souece_data[5]
      }
      local n_source = makeSource(build_table)
      System.out.println("enc_n_source"..n_source)
      myresults.source = n_source

      local o_devdebug_data = split(o_devdebug,"渣男密码数据解析")
      local build_table = {
        username = o_devdebug_data[1],
        pass = o_devdebug_data[2],
        isBanned = o_devdebug_data[3]
      }

      local n_devdebug = makeDevDebug(build_table)
      System.out.println("enc_n_devdebug"..n_devdebug)

      local encoded=json.encode(data)

      System.out.println("enc_origin"..result)
      System.out.println("enc_finial"..encoded)

      it.args[2]=encoded
     else
      --System.out.println(it.result)
    end
  end,
  function(it)
  end)
end