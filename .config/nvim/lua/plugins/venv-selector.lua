local ok, venv_selector = pcall(require, "venv-selector")

if not ok then
    return
end

venv_selector.setup()
