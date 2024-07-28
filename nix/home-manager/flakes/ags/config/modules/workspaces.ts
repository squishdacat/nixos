const hyprland = await Service.import("hyprland")

export function Workspaces() {
  const activeId = hyprland.active.workspace.bind("id");
  
  const workspaces = hyprland.bind("workspaces")
    .as(ws => ws
      .sort((a, b) => a.id - b.id)
      .map(({ id }) => Widget.Button({
        on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
        //child: Widget.Label(Intl.NumberFormat("ja-Jpan-JP-u-nu-hanidec").format(id)),
        child: Widget.Label(Intl.NumberFormat("ja-JP-u-nu-hanidec").format(id)),
        class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
      }))
    );


    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    });
}
