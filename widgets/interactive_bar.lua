local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor

local bind = astal.bind

local M = {}

local function PowerButton()
    return Widget.Button({
        on_click_release = function(_, event)
            if event.button == "PRIMARY" then
            end
        end,
        Widget.Icon({
            icon = ""
        })
    })
end

local function BatteryLevel()
	local bat = Battery.get_default()

	return Widget.Box({
		class_name = "Battery",
		visible = bind(bat, "is-present"),
		Widget.Icon({
			icon = bind(bat, "battery-icon-name"),
		}),
		Widget.Label({
			label = bind(bat, "percentage"):as(
				function(p) return tostring(math.floor(p * 100)) .. " %" end
			),
		}),
	})
end

function M:init(monitor)
    return Widget.Window({
        monitor = monitor,
        anchor = Anchor.TOP + Anchor.RIGHT,
        exclusivity = "EXCLUSIVE",
        -- Here should come the widgets
        -- PowerButton(),
        BatteryLevel()
    })
end

return M
