# Notification with FCM

A new Flutter project.

## How it works

This project is an example for notifications with FCM.

Create firebase project then add your flutter app, send notifications with firebase cloud messaging.

There are 3 conditions when we receive notifications:

 1-When the app is closed.\n
 2-When the app is opened and the user is using it.\n
 3-When the app is not opened not it is completely closed. It is running in the background.

### TO handle the notifications in your flutter app

add dependencies :

firebase_core.

firebase_messaging:

  1-To handle messages while your application is in the foreground, listen to the onMessage stream:
     FirebaseMessaging.onMessage.listen((RemoteMessage message) { //logic to handle message here});
     
  2_To handle background messages by registering a onBackgroundMessage handler:
    Allowing you to handle messages even when your application is not running.It must be a top-level function
    
    @pragma('vm:entry-point')
    Future<void> backgroundHandler(RemoteMessage message) async {//logic to handle message here}
    
    //Then inside main:
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

 ### Note: To setup firebase to flutter app you need to use flutterfire_cli (manually is no longer supported)     

 ## To see other projects developed by me :

- [Portfolio](https://nadeemze.github.io/Portfolio/)
