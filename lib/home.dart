import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:local_notification/widgets/dynamic_dialog.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    //FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    // To initialise the msg
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("Initial Message ${message.toString()}");
    });

    // To initialise when the user is using the app(foreground)
    FirebaseMessaging.onMessage.listen((message) {
      print("Notification in foreground mode ${message.toString()}");
      if (message.notification != null) {
        showDialog(
            context: context,
            builder: ((BuildContext context) {
              return DynamicDialog(
                  title: message.notification!.title!,
                  body: message.notification!.body!
              );
            }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Notifications'),
      ),
      body: Center(
        child: Text(
              'Notifications\nwith FCM ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
        ),
    );
  }
}
