return {
  cmd = { "pyright", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    ".venv",
    "setup.py",
    "setup.cfg",
    "uv.lock",
  },
}
