-- name: 有道云笔记
-- descript: 解锁本地超级会员(ver. 7.5.691)
-- package: com.youdao.note
-- author: 怀天

hook {
  class = "com.youdao.note.seniorManager.VipStateManager",
  classloader = lpparam.classLoader,
  method = "checkIsSuperSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.seniorManager.VipStateManager",
  classloader = lpparam.classLoader,
  method = "checkIsSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.seniorManager.VipStateManager",
  classloader = lpparam.classLoader,
  method = "checkIsExpiredSenior",
  params = {findClass("com.youdao.note.data.UserMeta",lpparam.classLoader)},
  before = function(it)

  end,
  after = function(it)
    it.result = false
  end,
}hook {
  class = "com.youdao.note.data.UserMeta",
  classloader = lpparam.classLoader,
  method = "isSeniorAccount",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.data.UserMeta",
  classloader = lpparam.classLoader,
  method = "checkIsSuperSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.account.model.AccountModel",
  classloader = lpparam.classLoader,
  method = "isSeniorAccount",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.account.model.AccountModel",
  classloader = lpparam.classLoader,
  method = "checkIsSuperSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.account.model.AccountModel",
  classloader = lpparam.classLoader,
  method = "checkIsExpiredSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = false
  end,
}hook {
  class = "com.youdao.note.account.AccountManager",
  classloader = lpparam.classLoader,
  method = "checkIsSuperSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}hook {
  class = "com.youdao.note.account.AccountManager",
  classloader = lpparam.classLoader,
  method = "checkIsSenior",
  params = {},
  before = function(it)

  end,
  after = function(it)
    it.result = true
  end,
}
