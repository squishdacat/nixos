import { Bar } from "./windows/bar.ts";
import { NotificationPopups } from "./windows/notification.ts";
import { DesktopApplet } from "./windows/applet.ts";
import style from "./style.css";

// Change the notification timeout
const notifications = await Service.import("notifications");
notifications.popupTimeout = 60000; // in ms (30 sec)


App.config({
  css: style,
  instanceName: "bar",
  main: () => App.get_monitors().map(Bar),
});
App.config({
  css: style,
  instanceName: "notifications",
  main: () => App.get_monitors().map(NotificationPopups),
});
App.config({
  css: style,
  instanceName: "applets",
  main: () => App.get_monitors().map(DesktopApplet),
});


export { }
