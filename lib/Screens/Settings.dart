import 'package:flutter/material.dart';

class TodoPreferenceTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const TodoPreferenceTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

class TodoNotificationSettingView extends StatefulWidget {
  const TodoNotificationSettingView({super.key});

  @override
  State<TodoNotificationSettingView> createState() =>
      _TodoNotificationSettingViewState();
}

class _TodoNotificationSettingViewState
    extends State<TodoNotificationSettingView> {
  bool isTaskReminderBadge = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 20,
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: Divider(height: 0, thickness: 0.3),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Customize your Settings for task reminders. ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
                children: const [
                   TextSpan(
                    text: 'Learn More',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
            TodoPreferenceTile(
              onTap: () {},
              title: 'Push notifications for tasks',
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            TodoPreferenceTile(
              onTap: () {},
              title: 'Email reminders',
              subtitle: 'Get email reminders for your tasks.',
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            TodoPreferenceTile(
              onTap: () {},
              title: 'In-app reminders',
              subtitle: 'Receive reminders inside the app.',
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            TodoPreferenceTile(
              onTap: () {},
              title: 'Notification sound for reminders',
              subtitle: 'Control the sound for task reminders.',
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            TodoPreferenceTile(
              onTap: () {},
              title: 'Vibration for reminders',
              subtitle: 'Enable or disable vibration for reminders.',
            ),
            const Divider(
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            TodoPreferenceTile(
              onTap: () {},
              title: 'Mute reminders during silent mode',
              subtitle: 'Mute task reminders when your phone is on silent.',
            ),
            const Divider(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
