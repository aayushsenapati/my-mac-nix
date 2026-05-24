{ config, pkgs, ... }:

{
  # Define the user
  users.users."aayush.senapati" = {
    name = "aayush.senapati";
    home = "/Users/aayush.senapati";
  };

  system.primaryUser = "aayush.senapati";
} 