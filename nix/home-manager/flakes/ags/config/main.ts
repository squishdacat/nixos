import { Bar } from "./windows/bar.ts";
import { NotificationPopups } from "./windows/notification.ts";
import { DesktopApplet } from "./windows/applet.ts";

// Change the notification timeout
const notifications = await Service.import("notifications");
notifications.popupTimeout = 60000; // in ms (30 sec)


App.config({
  // TODO: Styling
  style: "./style.css",

  windows: [
    Bar(),
    // Bar(0),
    // Bar(1),

    NotificationPopups(),

    DesktopApplet(),
  ],
});


export { }
