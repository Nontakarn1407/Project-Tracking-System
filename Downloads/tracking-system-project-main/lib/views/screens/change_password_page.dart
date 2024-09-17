import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: Colors.grey[500], // สีของ AppBar
      ),
      body: Container(
        color: Colors.grey[100], // สีพื้นหลังของหน้าจอ
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400), // จำกัดความกว้างสูงสุด
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // จัดตำแหน่งแนวตั้งที่ด้านบน
              crossAxisAlignment: CrossAxisAlignment.stretch, // ให้ฟอร์มเต็มความกว้าง
              children: <Widget>[
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700], // สีของข้อความหัวข้อ
                  ),
                  textAlign: TextAlign.center, // จัดตำแหน่งข้อความในแนวนอน
                ),
                const SizedBox(height: 24),
                // ฟอร์มเปลี่ยนรหัสผ่าน
                _buildTextFormField(
                  controller: _currentPasswordController,
                  label: 'Current Password',
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _newPasswordController,
                  label: 'New Password',
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _confirmPasswordController,
                  label: 'Confirm New Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                // ปุ่มบันทึก
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // ทำการเปลี่ยนรหัสผ่าน
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Changing Password')),
                      );
                      Navigator.popUntil(context, ModalRoute.withName('/')); // กลับไปยังหน้าหลัก
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey[500], // สีของข้อความในปุ่ม
                    minimumSize: const Size(double.infinity, 50), // ขนาดปุ่มเต็มความกว้างและความสูง 50
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
