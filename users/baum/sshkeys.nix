{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  users.users.baum.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/qoPNI/uXMBRUVb4wOqhtH5zgIRNYHyz8hIZdLgMwH baum"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVCjeZtuKVz0jr9S2Gv9f0Hjyl5XtMB6ZJ8V+x1qbX4 baum"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJs0s6xFsfabfZIcwgsjyXM/upc2lT1373tBxYHTWEzJ baum"
  ];
}
