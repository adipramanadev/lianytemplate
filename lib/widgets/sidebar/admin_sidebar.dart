import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../models/menu_item.dart';

class AdminSidebar extends StatefulWidget {
  final String currentRoute;
  final Function(String) onMenuItemSelected;
  final bool isCollapsed;

  const AdminSidebar({
    super.key,
    required this.currentRoute,
    required this.onMenuItemSelected,
    this.isCollapsed = false,
  });

  @override
  State<AdminSidebar> createState() => _AdminSidebarState();
}

class _AdminSidebarState extends State<AdminSidebar> {
  final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Dashboard',
      icon: Icons.dashboard_rounded,
      route: '/dashboard',
    ),
    MenuItem(
      title: 'Users',
      icon: Icons.people_rounded,
      route: '/users',
    ),
    MenuItem(
      title: 'Products',
      icon: Icons.inventory_2_rounded,
      route: '/products',
    ),
    MenuItem(
      title: 'Orders',
      icon: Icons.shopping_cart_rounded,
      route: '/orders',
    ),
    MenuItem(
      title: 'Analytics',
      icon: Icons.analytics_rounded,
      route: '/analytics',
    ),
    MenuItem(
      title: 'Settings',
      icon: Icons.settings_rounded,
      route: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isCollapsed 
          ? AppConstants.sidebarCollapsedWidth 
          : AppConstants.sidebarWidth,
      decoration: const BoxDecoration(
        color: AppColors.sidebarBackground,
        border: Border(
          right: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      child: Column(
        children: [
          _buildLogo(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return _buildMenuItem(menuItems[index]);
              },
            ),
          ),
          _buildUserProfile(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: AppConstants.appBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.admin_panel_settings_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          if (!widget.isCollapsed) ...[
            const SizedBox(width: 12),
            const Text(
              'Liany Admin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    final isActive = widget.currentRoute == item.route;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onMenuItemSelected(item.route),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color: isActive ? Colors.white : AppColors.textLight,
                  size: 22,
                ),
                if (!widget.isCollapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: isActive ? Colors.white : AppColors.textLight,
                        fontSize: 15,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF374151)),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary,
            child: const Text(
              'AD',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (!widget.isCollapsed) ...[
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Admin User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'admin@liany.com',
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
