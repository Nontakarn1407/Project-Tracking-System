import 'package:flutter/material.dart';

class NotificationsSettingsPage extends StatefulWidget {
  const NotificationsSettingsPage({super.key});

  @override
  State<NotificationsSettingsPage> createState() => _NotificationsSettingsPageState();
}

class _NotificationsSettingsPageState extends State<NotificationsSettingsPage> {
  bool _enableNotifications = true;
  bool _receivePromotions = true;
  bool _receiveUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Settings'),
        backgroundColor: Colors.grey[400], // สีของ AppBar
        elevation: 0, // ลบเงาของ AppBar
      ),
      body: Container(
        color: Colors.grey[100], // สีพื้นหลังของหน้าจอ
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notifications Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800], // สีของข้อความหัวข้อ
              ),
            ),
            const SizedBox(height: 24),
            // ตัวเลือกการแจ้งเตือน
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // สีพื้นหลังของตัวเลือก
                borderRadius: BorderRadius.circular(12), // มุมโค้งของกล่อง
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // เงาเล็กน้อย
                  ),
                ],
              ),
              child: SwitchListTile(
                title: const Text('Enable Notifications'),
                value: _enableNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _enableNotifications = value;
                  });
                },
                activeColor: Colors.grey[400], // สีสวิตช์ที่เปิด
                contentPadding: EdgeInsets.zero, // ลบการเพิ่มพื้นที่ด้านใน
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Notification Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800], // สีของข้อความหัวข้อ
              ),
            ),
            const SizedBox(height: 16),
            // ตัวเลือกการตั้งค่าการแจ้งเตือน
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // สีพื้นหลังของตัวเลือก
                borderRadius: BorderRadius.circular(12), // มุมโค้งของกล่อง
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // เงาเล็กน้อย
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.notifications_active, color: Colors.blue),
                    title: const Text('Receive Promotions'),
                    trailing: Switch(
                      value: _receivePromotions,
                      onChanged: (bool value) {
                        setState(() {
                          _receivePromotions = value;
                        });
                      },
                      activeColor: Colors.grey[400], // สีสวิตช์ที่เปิด
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey[300]), // สีของตัวแบ่ง
                  ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.green),
                    title: const Text('Receive Updates'),
                    trailing: Switch(
                      value: _receiveUpdates,
                      onChanged: (bool value) {
                        setState(() {
                          _receiveUpdates = value;
                        });
                      },
                      activeColor: Colors.grey[400], // สีสวิตช์ที่เปิด
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
