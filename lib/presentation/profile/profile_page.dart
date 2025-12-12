import 'package:flutter/material.dart';
import '../../data/local/user/user_table.dart';
import '../../data/local/app_prefs.dart';
import '../auth/login_page.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            _buildProfileOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Text(
              user.name[0].toUpperCase(),
              style: TextStyle(
                fontSize: 48,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            user.email,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildOptionTile(
          context,
          icon: Icons.shopping_bag_outlined,
          title: 'My Orders',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Orders page coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.favorite_outline,
          title: 'Wishlist',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Wishlist coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.location_on_outlined,
          title: 'Delivery Address',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Address page coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.payment_outlined,
          title: 'Payment Methods',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Payment page coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Notifications page coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.settings_outlined,
          title: 'Settings',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings page coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.help_outline,
          title: 'Help & Support',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Help page coming soon')),
            );
          },
        ),
        _buildOptionTile(
          context,
          icon: Icons.info_outline,
          title: 'About',
          onTap: () {
            showAboutDialog(
              context: context,
              applicationName: 'Pharos',
              applicationVersion: '1.0.0',
              applicationIcon: Icon(
                Icons.shopping_bag,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        ),

        const Divider(height: 32),

        // 🔥 زر Logout
        _buildOptionTile(
          context,
          icon: Icons.logout,
          title: 'Logout',
          textColor: Colors.red,
          iconColor: Colors.red,
          onTap: () => _showLogoutDialog(context),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildOptionTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
        Color? textColor,
        Color? iconColor,
      }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);

              // 🔥 امسح اليوزر من التخزين
              await AppPrefs.logout();

              // ⛔ امنع الرجوع واعمل إعادة توجيه للّوجين
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
