# fileswiper
Script to make sending files via netcat faster and more convenient.

Description:

Client Script:
Will send all files on this machine that are in the loot list in the program.
Any additional files you want to select can also be entered.

Server Script:
Will open a listener on ports 443 and 80 for each file that the client script sends.


Usage:

Server script: `./server.sh`

Client script: `./client.sh RHOST [additional files or directories]`


Screenshots:

Server

  <img src="Images/server1.jpg" width = "300"> <img src="Images/image.png" width = "300">
  
Client

  <img src="Images/client.png" width = "300">
