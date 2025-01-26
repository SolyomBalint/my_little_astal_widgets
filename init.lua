local App = require("astal.gtk3.app")
-- Bar requires
local interactive_bar = require("widgets.interactive_bar")

App:start({
    instance_name = "desktop_widgets",
    main = function()
        for _, monitor in pairs(App.monitors) do
            -- Call every window init here
            interactive_bar.init(monitor)
        end
    end,
})
