import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'All';
  
  final List<Map<String, dynamic>> users = [
    {
      'name': 'John Doe',
      'email': 'john@example.com',
      'role': 'Admin',
      'status': 'Active',
      'joinDate': 'Jan 15, 2024',
      'avatar': 'JD',
    },
    {
      'name': 'Jane Smith',
      'email': 'jane@example.com',
      'role': 'User',
      'status': 'Active',
      'joinDate': 'Feb 20, 2024',
      'avatar': 'JS',
    },
    {
      'name': 'Mike Johnson',
      'email': 'mike@example.com',
      'role': 'User',
      'status': 'Inactive',
      'joinDate': 'Mar 10, 2024',
      'avatar': 'MJ',
    },
    {
      'name': 'Sarah Williams',
      'email': 'sarah@example.com',
      'role': 'Moderator',
      'status': 'Active',
      'joinDate': 'Apr 05, 2024',
      'avatar': 'SW',
    },
    {
      'name': 'Tom Brown',
      'email': 'tom@example.com',
      'role': 'User',
      'status': 'Active',
      'joinDate': 'May 12, 2024',
      'avatar': 'TB',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredUsers {
    if (_selectedFilter == 'All') return users;
    if (_selectedFilter == 'Active') {
      return users.where((u) => u['status'] == 'Active').toList();
    }
    if (_selectedFilter == 'Inactive') {
      return users.where((u) => u['status'] == 'Inactive').toList();
    }
    return users.where((u) => u['role'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildStatsCards(),
          const SizedBox(height: 24),
          _buildUsersTable(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Management',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Manage your users and their account permissions',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_download_outlined, size: 18),
              label: const Text('Export'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add User'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Total Users',
            '${users.length}',
            Icons.people_outline,
            AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            'Active',
            '${users.where((u) => u['status'] == 'Active').length}',
            Icons.check_circle_outline,
            AppColors.success,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            'Admins',
            '${users.where((u) => u['role'] == 'Admin').length}',
            Icons.admin_panel_settings_outlined,
            AppColors.error,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            'Moderators',
            '${users.where((u) => u['role'] == 'Moderator').length}',
            Icons.verified_user_outlined,
            AppColors.warning,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUsersTable() {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by name or email...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      filled: true,
                      fillColor: AppColors.background,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      _selectedFilter = value;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.filter_list, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          _selectedFilter,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_drop_down, size: 20),
                      ],
                    ),
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'All', child: Text('All Users')),
                    const PopupMenuItem(value: 'Active', child: Text('Active Only')),
                    const PopupMenuItem(value: 'Inactive', child: Text('Inactive Only')),
                    const PopupMenuDivider(),
                    const PopupMenuItem(value: 'Admin', child: Text('Admins')),
                    const PopupMenuItem(value: 'Moderator', child: Text('Moderators')),
                    const PopupMenuItem(value: 'User', child: Text('Users')),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(AppColors.background.withOpacity(0.5)),
              dataRowMinHeight: 64,
              dataRowMaxHeight: 64,
              columnSpacing: 40,
              horizontalMargin: 24,
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
              columns: const [
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('USER'),
                  ),
                ),
                DataColumn(label: Text('EMAIL')),
                DataColumn(label: Text('ROLE')),
                DataColumn(label: Text('STATUS')),
                DataColumn(label: Text('JOIN DATE')),
                DataColumn(label: Text('ACTIONS')),
              ],
              rows: _filteredUsers.map((user) {
                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  _getAvatarColor(user['avatar']),
                                  _getAvatarColor(user['avatar']).withOpacity(0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                user['avatar'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            user['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Text(
                        user['email'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getRoleColor(user['role']).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: _getRoleColor(user['role']).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          user['role'],
                          style: TextStyle(
                            color: _getRoleColor(user['role']),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: user['status'] == 'Active'
                              ? AppColors.success.withOpacity(0.1)
                              : AppColors.textLight.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: user['status'] == 'Active'
                                    ? AppColors.success
                                    : AppColors.textLight,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              user['status'],
                              style: TextStyle(
                                color: user['status'] == 'Active'
                                    ? AppColors.success
                                    : AppColors.textLight,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        user['joinDate'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    DataCell(
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildActionButton(
                            Icons.visibility_outlined,
                            'View',
                            AppColors.info,
                            () {},
                          ),
                          const SizedBox(width: 4),
                          _buildActionButton(
                            Icons.edit_outlined,
                            'Edit',
                            AppColors.primary,
                            () {},
                          ),
                          const SizedBox(width: 4),
                          _buildActionButton(
                            Icons.delete_outline,
                            'Delete',
                            AppColors.error,
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Showing ${_filteredUsers.length} of ${users.length} users',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                      tooltip: 'Previous',
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                      tooltip: 'Next',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String tooltip,
    Color color,
    VoidCallback onPressed,
  ) {
    return IconButton(
      icon: Icon(icon, size: 18),
      onPressed: onPressed,
      tooltip: tooltip,
      color: color,
      style: IconButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(32, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'Admin':
        return AppColors.error;
      case 'Moderator':
        return AppColors.warning;
      default:
        return AppColors.info;
    }
  }

  Color _getAvatarColor(String avatar) {
    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      AppColors.info,
      AppColors.error,
    ];
    return colors[avatar.hashCode % colors.length];
  }
}
