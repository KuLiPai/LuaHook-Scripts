-- name: 元气骑士
-- descript: 满级存档(ver. 7.9.0)
-- package: com.ChillyRoom.DungeonShooter
-- author: 怀天

hook {
  class = "com.chillyroomsdk.sdkbridge.BasePlayerActivity",
  classloader = lpparam.classLoader,
  method = "onCreate",
  params = {findClass("android.os.Bundle", lpparam.classLoader)},
  before = function(it)
    imports "android.widget.Toast"
    local activity = it.thisObject
    Toast.makeText(activity,"账号: guurgc@163.com",Toast.LENGTH_LONG).show()
    Toast.makeText(activity,"密码: xtkvqs",Toast.LENGTH_LONG).show()
    Toast.makeText(activity,"云端下载到本地即可体验",Toast.LENGTH_LONG).show()
  end,
  after = function(it)
      
  end,
}
