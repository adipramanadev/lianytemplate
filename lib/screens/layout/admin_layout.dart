import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/sidebar/admin_sidebar.dart';
import '../../widgets/appbar/admin_appbar.dart';
import '../dashboard/dashboard_screen.dart';
import '../users/users_screen.dart';
import '../settings/settings_screen.dart';
import '../products/products_screen.dart';
import '../orders/orders_screen.dart';
import '../analytics/analytics_screen.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  String _currentRoute = '/dashboard';
  bool _isSidebarCollapsed = false;

  final Map<String, Widget> _screens = {
    '/dashboard': const DashboardScreen(),
    '/users': const UsersScreen(),
    '/products': const ProductsScreen(),
    '/orders': const OrdersScreen(),
    '/analytics': const AnalyticsScreen(),
    '/settings': const SettingsScreen(),
  };

  final Map<String, String> _titles = {
    '/dashboard': 'Dashboard',
    '/users': 'Users',
    '/products': 'Products',
    '/orders': 'Orders',
    '/analytics': 'Analytics',
    '/settings': 'Settings',
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppConstants.mobileBreakpoint;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          if (!isMobile)
            AdminSidebar(
              currentRoute: _currentRoute,
              onMenuItemSelected: _onMenuItemSelected,
              isCollapsed: _isSidebarCollapsed,
            ),
          
          // Main Content
          Expanded(
            child: Column(
              children: [
                // AppBar
                AdminAppBar(
                  title: _titles[_currentRoute] ?? 'Dashboard',
                  onMenuPressed: isMobile ? _toggleSidebar : null,
                ),
                
                // Content
                Expanded(
                  child: _screens[_currentRoute] ?? const DashboardScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // Mobile Drawer
      drawer: isMobile
          ? Drawer(
              child: AdminSidebar(
                currentRoute: _currentRoute,
                onMenuItemSelected: (route) {
                  _onMenuItemSelected(route);
                  Navigator.pop(context);
                },
              ),
            )
          : null,
    );
  }

  void _onMenuItemSelected(String route) {
    setState(() {
      _currentRoute = route;
    });
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarCollapsed = !_isSidebarCollapsed;
    });
  }
}
