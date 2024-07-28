

export function DesktopApplet(monitor = 0) {
  return Widget.Window({
    name: `applet-${monitor}`, // name has to be unique
    class_name: "applet",
    monitor,
    anchor: ["bottom", "right"],
    layer: "bottom",
    exclusivity: "ignore",
    child: Widget.Label("UwU, you're cute :3"),
  });
}
