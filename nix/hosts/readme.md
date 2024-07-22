# Hosts

## Naming Scheme
As to make every device unique, every device follows the following
config naming scheme.

Firstly, every device should start with a prefix denoting what type
of device it is. This is so that it is easy to know what device is
what 
| Type    | Prefix |
| ------- | ------ |
| Desktop | D |
| Laptop  | L |
| Server  | S |

Afterwards, comes with a random name. This name should be unique (in
the fact that even without the prefix, it is recognisable) and should
not have over 8 chars.

## Defaults
The defaults for all systems is defined in the ./default folder.\
When you are on a desktop, you may want to have some services, such
as bluetooth, which you may not wanna have on a server, and vice
versa.

| File    | Runs On |
| ------- | ------- |
| default | all |
| desktop | Both Desktop (D) and Laptop (L) |
| server  | Server (S) |

