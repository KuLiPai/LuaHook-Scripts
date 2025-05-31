
import os
import re
from pathlib import Path
import sys

REQUIRED_FIELDS = {"name", "descript", "package", "author"}

def parse_lua_headers(path):
    found = {}
    with open(path, encoding="utf-8") as f:
        for _ in range(10):  # 只检查前 10 行
            line = f.readline()
            if line.startswith("--"):
                match = re.match(r"--\s*(\w+):\s*(.+)", line)
                if match:
                    key, value = match.groups()
                    found[key.strip().lower()] = value.strip()
            elif line.strip() != "":
                break  # 提前结束：注释之后出现非空行，说明头注释结束
    return found

def main():
    root = Path(__file__).resolve().parent.parent.parent / "scripts"
    failed_files = []

    for lua_path in root.rglob("*.lua"):
        headers = parse_lua_headers(lua_path)
        missing = REQUIRED_FIELDS - headers.keys()
        if missing:
            failed_files.append((lua_path.relative_to(root), missing))

    if failed_files:
        print("❌ 以下 Lua 文件缺少必要注释字段：")
        for path, missing in failed_files:
            print(f" - {path}: 缺少 {', '.join(missing)}")
        sys.exit(1)  # 非零退出表示校验失败
    else:
        print("✅ 所有 Lua 文件注释格式合法！")

if __name__ == "__main__":
    main()
