{ ... }:
{
  services.mosquitto = {
    enable = true;
    listeners = [
      {
        users.mqtt = {
          acl = [
            "readwrite #"
          ];
          hashedPassword = "$7$101$ZilhmE9JdekuyA68$54ExgbyAHmbcnJq0hZc2kwnDFcOolgJ/J6Qm2bmMe6/V8HwaXau6UaWcAxaK0VOVOjhnjoTKJDBav8XxPG191g==";
        };
      }
    ];

  };
}
