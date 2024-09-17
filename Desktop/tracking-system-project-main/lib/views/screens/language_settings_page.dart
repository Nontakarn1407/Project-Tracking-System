import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  bool _isEnglish = true; // เริ่มต้นด้วยภาษาอังกฤษ

  void _toggleLanguage(bool value) {
    setState(() {
      _isEnglish = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_isEnglish ? 'Language changed to English' : 'Language changed to Thai')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
        backgroundColor: Colors.grey[400], // สีของ AppBar
        elevation: 0, // ไม่ต้องการเงา
      ),
      body: Container(
        color: Colors.grey[100], // สีพื้นหลังของหน้าจอ
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Language Settings',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800], // สีของข้อความหัวข้อ
              ),
            ),
            const SizedBox(height: 24),
            // ตัวเลือกการเปิดปิดภาษา
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white, // สีพื้นหลังของตัวเลือกภาษา
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // การเบลอของเงา
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'English',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]), // สีข้อความ
                    ),
                    trailing: Switch(
                      value: _isEnglish,
                      onChanged: _toggleLanguage,
                      activeColor: Colors.grey[400], // สีสวิตช์ที่เปิด
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey[300]), // สีของตัวแบ่ง
                  ListTile(
                    title: Text(
                      'ไทย',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]), // สีข้อความ
                    ),
                    trailing: Switch(
                      value: !_isEnglish,
                      onChanged: (value) => _toggleLanguage(!value),
                      activeColor: Colors.grey[400], // สีสวิตช์ที่เปิด
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Language set to ${_isEnglish ? 'English' : 'Thai'}')),
                  );
                  Navigator.pop(context); // กลับไปยังหน้าหลัก
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400], // สีของปุ่ม
                  foregroundColor: Colors.white, // สีข้อความของปุ่ม
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
