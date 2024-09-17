import 'package:flutter/material.dart';

class EditPersonalInfoPage extends StatefulWidget {
  const EditPersonalInfoPage({super.key});

  @override
  State<EditPersonalInfoPage> createState() => _EditPersonalInfoPageState();
}

class _EditPersonalInfoPageState extends State<EditPersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(text: 'John Doe');
  final TextEditingController _emailController = TextEditingController(text: 'john.doe@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+123 456 7890');
  final TextEditingController _employeeIdController = TextEditingController(text: 'EMP12345');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Personal Information'),
        backgroundColor: Colors.grey[400], // สีของ AppBar
      ),
      body: Container(
        color: Colors.grey[100], // สีพื้นหลังของหน้าจอ
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600), // Limit the maximum width
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align the content to the start
                  crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure the form fields stretch to full width
                  children: <Widget>[
                    Text(
                      'Edit Personal Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500], // สีของข้อความหัวข้อ
                      ),
                      textAlign: TextAlign.center, // Center the title horizontally
                    ),
                    const SizedBox(height: 24),
                    _buildTextFormField(_nameController, 'Name'),
                    const SizedBox(height: 16),
                    _buildTextFormField(_emailController, 'Email'),
                    const SizedBox(height: 16),
                    _buildTextFormField(_phoneController, 'Phone'),
                    const SizedBox(height: 16),
                    _buildTextFormField(_employeeIdController, 'Employee ID'),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // ส่งข้อมูลที่แก้ไขแล้วกลับไปยังหน้า PersonalInfoPage
                          Navigator.pop(context, {
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'phone': _phoneController.text,
                            'employeeId': _employeeIdController.text,
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[400], // สีของปุ่ม
                        minimumSize: const Size(double.infinity, 50), // Full width and height of 50
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
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
