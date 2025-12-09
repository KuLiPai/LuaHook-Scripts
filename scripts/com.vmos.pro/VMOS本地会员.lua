-- name: VMOS本地会员
-- descript: 解锁VMOS本地会员
-- package: com.vmos.pro
-- author: KuLiPai

-- 测试版本3.0.7

hook {
    class = "com.vmos.pro.account.AccountHelper",
    method = "checkVip",
    params = { "i20", "android.view.View" },
    before = function(it)
        local instance = it.thisObject
        local value = getField(instance, "ˋ")
        setField(instance, "ˋ", 10000000000)
        local value = getField(instance, "ˋ")
    end
}


hook {
    class = "com.vmos.pro.activities.addvm.AddVmRomListAdapter$handleOnDownloadClicked$1",
    method = "onVipChecked",
    params = { "boolean", "boolean" },
    before = function(it)
        it.args[0] = true
        it.args[1] = true
    end
}
