import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'menu_page.dart'; // นำเข้า MenuPage
import 'map_page.dart'; // นำเข้า MapPage

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.7650836, 100.5379664),
    zoom: 14.4746,
  );

  // ฟังก์ชันสำหรับการแสดง dialog ยืนยันการออกจากระบบ
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            ),
            TextButton(
              child: const Text('Log Out'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logging out...')),
                );
                Navigator.of(context).pop(); // ปิด dialog
                // เพิ่มฟังก์ชันออกจากระบบที่นี่ หรือเปลี่ยนเส้นทางไปยังหน้า Login
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.grey[400], // สีของ AppBar
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // เปิด Drawer
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[400], // สีของ DrawerHeader
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[500]), // สีของไอคอน
              title: Text('Home', style: TextStyle(color: Colors.grey[500])), // สีของข้อความ
              onTap: () {
                Navigator.pop(context); // ปิด Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.map, color: Colors.grey[500]), // สีของไอคอน
              title: Text('Map', style: TextStyle(color: Colors.grey[500])), // สีของข้อความ
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapPage()), // เปลี่ยนไปยังหน้า MapPage
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[500]), // สีของไอคอน
              title: Text('Settings', style: TextStyle(color: Colors.grey[500])), // สีของข้อความ
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()), // เปลี่ยนไปยังหน้า MenuPage
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.grey[500]), // สีของไอคอน
              title: Text('Logout', style: TextStyle(color: Colors.grey[500])), // สีของข้อความ
              onTap: () {
                Navigator.pop(context); // ปิด Drawer
                _showLogoutDialog(); // แสดง dialog ยืนยันการออกจากระบบ
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
