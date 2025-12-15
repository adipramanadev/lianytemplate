import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final String title;

  const AdminAppBar({
    super.key,
    this.onMenuPressed,
    this.title = 'Dashboard',
  });

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.appBarHeight,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          if (onMenuPressed != null)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onMenuPressed,
              color: AppColors.textPrimary,
            ),
          const SizedBox(width: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          _buildSearchBar(),
          const SizedBox(width: 16),
          _buildNotificationButton(),
          const SizedBox(width: 16),
          _buildProfileButton(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth > 600 ? 300 : 200,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search, size: 20),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
          color: AppColors.textPrimary,
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.error,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileButton() {
    return PopupMenuButton<int>(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      itemBuilder: (context) => <PopupMenuEntry<int>>[
        const PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.person_outline, size: 20),
              SizedBox(width: 12),
              Text('Profile'),
            ],
          ),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.settings_outlined, size: 20),
              SizedBox(width: 12),
              Text('Settings'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<int>(
          value: 3,
          child: Row(
            children: [
              Icon(Icons.logout, size: 20, color: AppColors.error),
              SizedBox(width: 12),
              Text('Logout', style: TextStyle(color: AppColors.error)),
            ],
          ),
        ),
      ],
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary,
            child: const Text(
              'AD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, size: 20),
        ],
      ),
    );
  }
}
