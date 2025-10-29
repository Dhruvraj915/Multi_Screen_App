import 'package:flutter/material.dart';
import '../models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final User? user;

  const DetailScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: user == null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.person_off,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'No user selected',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please select a user from the Home screen',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Hero(
                    tag: 'avatar_${user!.id}',
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(user!.avatar),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user!.fullName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.person,
                    title: 'First Name',
                    value: user!.firstName,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.person_outline,
                    title: 'Last Name',
                    value: user!.lastName,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.email,
                    title: 'Email',
                    value: user!.email,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.badge,
                    title: 'User ID',
                    value: user!.id.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}