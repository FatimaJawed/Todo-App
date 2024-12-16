import 'package:flutter/material.dart';

 class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Welcome to To-Do App!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Stay organized and achieve your goals with ease. Manage your tasks efficiently and never miss a deadline!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            _buildFeatureTile('• Create, edit, and delete tasks'),
            _buildFeatureTile('• Set deadlines and reminders'),
            _buildFeatureTile('• Mark tasks as complete'),
            _buildFeatureTile('• Organize tasks by categories'),
            _buildFeatureTile('• Sync across devices'),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Developed by Fatima Jawed',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Icons.mail_outline,
                  color: Colors.blueAccent,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Contact: fatimajawed535@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        feature,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }
}
