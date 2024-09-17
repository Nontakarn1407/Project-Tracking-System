import 'package:flutter/material.dart';
import 'personal_info_page.dart'; // นำเข้าหน้าข้อมูลผู้ใช้
import 'language_settings_page.dart'; // นำเข้าหน้าการตั้งค่าภาษา
import 'notifications_settings_page.dart'; // นำเข้าหน้าการตั้งค่าการแจ้งเตือน
import 'change_password_page.dart'; // นำเข้าหน้าการเปลี่ยนรหัสผ่าน

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // ปุ่มข้อมูลผู้ใช้
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Personal Information'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonalInfoPage()),
                );
              },
            ),
            // ปุ่มการตั้งค่าภาษา
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LanguageSettingsPage()),
                );
              },
            ),
            // ปุ่มการตั้งค่าการแจ้งเตือน
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationsSettingsPage()),
                );
              },
            ),
            // ปุ่มการเปลี่ยนรหัสผ่าน
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                );
              },
            ),
            const Spacer(), // เพิ่มพื้นที่ว่างเพื่อดันปุ่มออกจากระบบไปด้านล่าง
            // ปุ่มออกจากระบบ
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // ปิด dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // นำผู้ใช้ไปยังหน้า Welcome
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/welcome', // เส้นทางของหน้า Welcome
                              (route) => false, // ลบ stack ทั้งหมด
                            );
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
