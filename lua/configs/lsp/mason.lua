local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

-- set options here if required ,inside the setup function
-- all default config loaded
mason.setup()
