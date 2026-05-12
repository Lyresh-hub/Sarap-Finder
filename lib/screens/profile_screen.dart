import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'browse_screen.dart';
import 'orders_screen.dart';
import 'login_screen.dart';
import 'saved_addresses_screen.dart';
import 'payment_methods_screen.dart';
import 'food_preferences_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showPreferences = true;

  final List<String> _preferences = ['Budget-friendly', 'Spicy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      bottomNavigationBar: _buildBottomNav(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 14),
              _buildAppBar(),
              const SizedBox(height: 28),
              // Avatar
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF2D2D2D),
                  border: Border.all(
                      color: const Color(0xFF6B2D8B), width: 2),
                ),
                child: const Icon(Icons.person,
                    color: Colors.white54, size: 48),
              ),
              const SizedBox(height: 14),
              // Name
              const Text(
                'Taylor Swift',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              // Preferences card
              if (_showPreferences) _buildPreferencesCard(),
              if (_showPreferences) const SizedBox(height: 16),
              // Menu card
              _buildMenuCard(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        Image.asset(
          'assets/images/saraplogo.png',
          height: 28,
          errorBuilder: (_, _, _) => const Icon(
            Icons.location_on,
            color: Color(0xFF6B2D8B),
            size: 26,
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          'SarapFinder',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B2D8B),
          ),
        ),
        const Spacer(),
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF6B2D8B), width: 1.5),
            color: const Color(0xFFEDE9FF),
          ),
          child: const Icon(Icons.person_outline,
              color: Color(0xFF6B2D8B), size: 20),
        ),
      ],
    );
  }

  Widget _buildPreferencesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'My Food Preferences',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _showPreferences = false),
                child: const Icon(Icons.close,
                    size: 18, color: Colors.black38),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Update your cravings to get better recommendations.',
            style: TextStyle(fontSize: 12, color: Colors.black45),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: _preferences.map((pref) {
              final isSpicy = pref == 'Spicy';
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: isSpicy
                      ? const Color(0xFFFFEEEE)
                      : const Color(0xFFE8F8F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(isSpicy ? '🌶️' : '💰',
                        style: const TextStyle(fontSize: 13)),
                    const SizedBox(width: 5),
                    Text(
                      pref,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSpicy
                            ? const Color(0xFFE05C5C)
                            : const Color(0xFF00A884),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const FoodPreferencesScreen())),
              icon: const Icon(Icons.tune, size: 16),
              label: const Text('Edit Preferences',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D1B69),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _menuItem(
            icon: Icons.location_on_outlined,
            iconColor: const Color(0xFF6B2D8B),
            iconBg: const Color(0xFFEDE9FF),
            label: 'Saved Addresses',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SavedAddressesScreen())),
          ),
          const Divider(height: 1, indent: 56, color: Color(0xFFF0F0F0)),
          _menuItem(
            icon: Icons.credit_card_outlined,
            iconColor: const Color(0xFF6B2D8B),
            iconBg: const Color(0xFFEDE9FF),
            label: 'Payment Methods',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PaymentMethodsScreen())),
          ),
          const Divider(height: 1, indent: 56, color: Color(0xFFF0F0F0)),
          _menuItem(
            icon: Icons.help_outline_rounded,
            iconColor: const Color(0xFF6B2D8B),
            iconBg: const Color(0xFFEDE9FF),
            label: 'Terms & Conditions',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 56, color: Color(0xFFF0F0F0)),
          _menuItem(
            icon: Icons.logout_rounded,
            iconColor: const Color(0xFFE05C5C),
            iconBg: const Color(0xFFFFEEEE),
            label: 'Log Out',
            labelColor: const Color(0xFFE05C5C),
            showArrow: false,
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    Color? labelColor,
    bool showArrow = true,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: labelColor ?? Colors.black87,
                ),
              ),
            ),
            if (showArrow)
              const Icon(Icons.chevron_right,
                  color: Colors.black38, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_rounded, 'Home', onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()))),
            _navItem(Icons.search_rounded, 'Browse', onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const BrowseScreen()))),
            _navItem(Icons.receipt_long_outlined, 'Orders', onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const OrdersScreen()))),
            _navItem(Icons.person_outline_rounded, 'Profile', active: true),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label,
      {bool active = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: 24,
              color: active
                  ? const Color(0xFF6B2D8B)
                  : Colors.black38),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight:
                  active ? FontWeight.w600 : FontWeight.normal,
              color: active
                  ? const Color(0xFF6B2D8B)
                  : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
