import 'package:flutter/material.dart';
import 'edit_personal_info_page.dart'; // ตรวจสอบให้แน่ใจว่าไฟล์นี้มีอยู่และถูกต้อง

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';
  String _phone = '+123 456 7890';
  String _employeeId = 'EMP12345';

  void _navigateToEditPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditPersonalInfoPage()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        _name = result['name'] ?? _name;
        _email = result['email'] ?? _email;
        _phone = result['phone'] ?? _phone;
        _employeeId = result['employeeId'] ?? _employeeId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        backgroundColor: Colors.grey[400], // สีของ AppBar
      ),
      body: Container(
        color: Colors.grey[100], // สีพื้นหลังของหน้าจอ
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800], // สีของข้อความหัวข้อ
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoTile(Icons.person, 'Name: $_name'),
            _buildInfoTile(Icons.email, 'Email: $_email'),
            _buildInfoTile(Icons.phone, 'Phone: $_phone'),
            _buildInfoTile(Icons.badge, 'Employee ID: $_employeeId'),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _navigateToEditPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400], // สีพื้นหลังของปุ่ม
                  foregroundColor: Colors.white, // สีของข้อความปุ่ม
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Edit Information'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // สีพื้นหลังของ ListTile
        borderRadius: BorderRadius.circular(12), // มุมโค้งของกล่อง
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2), // การเบลอของเงา
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Icon(icon, color: Colors.grey[800]),
        title: Text(text, style: TextStyle(color: Colors.grey[800])),
      ),
    );
  }
}
