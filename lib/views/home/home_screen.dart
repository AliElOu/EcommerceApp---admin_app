import 'package:admin_app/controllers/home/home_controller.dart';
import 'package:admin_app/core/push_notifications.dart';
import 'package:admin_app/views/home/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Messages'),
              onTap: () {
                Get.toNamed("/chats");
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Products'),
              onTap: () {
                Get.to(const MapPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Customers'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Reports'),
              onTap: () {
                // Navigate to Reports Page
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to Settings Page
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildStatCard('Total Sales', '\$20K', Colors.orange),
                _buildStatCard('Orders', '150', Colors.green),
                _buildStatCard('Customers', '1.2K', Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Recent Orders',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            _buildOrderRow(
                                '12345', 'John Doe', 'Completed', '\$100'),
                            _buildOrderRow(
                                '12346', 'Jane Smith', 'Pending', '\$50'),
                            _buildOrderRow(
                                '12347', 'Mike Johnson', 'Shipped', '\$75'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              SizedBox(height: 10),
              Text(
                count,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderRow(
      String orderId, String customerName, String status, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(orderId),
          Text(customerName),
          Text(status),
          Text(amount),
        ],
      ),
    );
  }
}
