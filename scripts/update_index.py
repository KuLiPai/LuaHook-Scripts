
import os
import json
import re
from pathlib import Path

# 路径设置
ROOT_DIR = Path(__file__).resolve().parent.parent.parent
SCRIPTS_DIR = ROOT_DIR / "scripts"
APPS_JSON = ROOT_DIR / "apps.json"

# 提取脚本注释元信息
def parse_lua_metadata(file_path):
    metadata = {}
    with open(file_path, encoding="utf-8") as f:
        for _ in range(10):  # 只看前10行
            line = f.readline()
            if line.startswith("--"):
                match = re.match(r"--\s*(\w+):\s*(.+)", line)
                if match:
                    key, value = match.groups()
                    metadata[key.strip().lower()] = value.strip()
            else:
                break
    return metadata

# 安全读取 json
def load_json(path):
    if path.exists():
        try:
            with open(path, encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            return {}
    return {}

# 保存 json
def save_json(path, data):
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

# 主流程
def update_indexes():
    print("🔍 正在扫描 scripts 目录...")
    apps = load_json(APPS_JSON)
    if not isinstance(apps, list):
        apps = []

    updated_apps = set(apps)

    for app_dir in SCRIPTS_DIR.iterdir():
        if not app_dir.is_dir():
            continue

        package_name = app_dir.name
        index_file = app_dir / "index.json"
        index_data = load_json(index_file)
        if not isinstance(index_data, dict):
            index_data = {}

        changed = False

        for lua_file in app_dir.glob("*.lua"):
            meta = parse_lua_metadata(lua_file)
            if meta:
                file_id = lua_file.stem
                if index_data.get(file_id) != meta:
                    index_data[file_id] = meta
                    print(f"📄 更新元信息: {package_name}/{lua_file.name}")
                    changed = True

        if changed:
            save_json(index_file, index_data)
            print(f"✅ 已写入: {index_file}")

        if package_name not in updated_apps:
            print(f"➕ 新包名目录: {package_name}")
            updated_apps.add(package_name)

    if set(apps) != updated_apps:
        save_json(APPS_JSON, sorted(updated_apps))
        print("✅ apps.json 已更新")

if __name__ == "__main__":
    update_indexes()

