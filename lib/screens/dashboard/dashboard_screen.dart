import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/app_colors.dart';
import '../../models/stat_card_model.dart';
import '../../widgets/cards/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1024;
        
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsSection(context),
              const SizedBox(height: 24),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildRevenueChart(),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildRecentActivities(),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildRevenueChart(),
                    const SizedBox(height: 24),
                    _buildRecentActivities(),
                  ],
                ),
              const SizedBox(height: 24),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildTopProducts(),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildUsersByCountry(),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildTopProducts(),
                    const SizedBox(height: 24),
                    _buildUsersByCountry(),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    final stats = [
      StatCardModel(
        title: 'Total Revenue',
        value: '\$54,239',
        icon: Icons.attach_money_rounded,
        color: AppColors.success,
        percentage: '12.5%',
        isIncrease: true,
      ),
      StatCardModel(
        title: 'Total Orders',
        value: '1,245',
        icon: Icons.shopping_cart_rounded,
        color: AppColors.info,
        percentage: '8.2%',
        isIncrease: true,
      ),
      StatCardModel(
        title: 'New Users',
        value: '842',
        icon: Icons.people_rounded,
        color: AppColors.primary,
        percentage: '3.1%',
        isIncrease: false,
      ),
      StatCardModel(
        title: 'Active Users',
        value: '2,156',
        icon: Icons.trending_up_rounded,
        color: AppColors.warning,
        percentage: '15.3%',
        isIncrease: true,
      ),
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1200 ? 4 : (screenWidth > 768 ? 2 : 1);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: crossAxisCount == 1 ? 2.5 : 1.5,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) => StatCard(stat: stats[index]),
    );
  }

  Widget _buildRevenueChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Revenue Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Last 7 Days',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 18),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 10,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                        color: AppColors.border,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          if (value.toInt() >= 0 && value.toInt() < days.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                days[value.toInt()],
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '\$${value.toInt()}k',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 20),
                        FlSpot(1, 35),
                        FlSpot(2, 30),
                        FlSpot(3, 45),
                        FlSpot(4, 40),
                        FlSpot(5, 55),
                        FlSpot(6, 50),
                      ],
                      isCurved: true,
                      color: AppColors.primary,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.primary.withOpacity(0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            '\$${spot.y.toInt()}k',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    final activities = [
      {'icon': Icons.shopping_bag, 'title': 'New order #1234', 'time': '2 min ago', 'color': AppColors.success},
      {'icon': Icons.person_add, 'title': 'New user registered', 'time': '5 min ago', 'color': AppColors.info},
      {'icon': Icons.payment, 'title': 'Payment received', 'time': '10 min ago', 'color': AppColors.primary},
      {'icon': Icons.inventory, 'title': 'Product updated', 'time': '15 min ago', 'color': AppColors.warning},
      {'icon': Icons.cancel, 'title': 'Order cancelled', 'time': '20 min ago', 'color': AppColors.error},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            ...activities.map((activity) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: (activity['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      activity['icon'] as IconData,
                      color: activity['color'] as Color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity['title'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          activity['time'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildTopProducts() {
    final products = [
      {'name': 'iPhone 14 Pro', 'sales': '234', 'revenue': '\$234,000'},
      {'name': 'MacBook Pro M2', 'sales': '189', 'revenue': '\$378,000'},
      {'name': 'AirPods Pro', 'sales': '456', 'revenue': '\$113,400'},
      {'name': 'iPad Air', 'sales': '178', 'revenue': '\$106,800'},
      {'name': 'Apple Watch', 'sales': '289', 'revenue': '\$115,600'},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    _buildTableHeader('Product'),
                    _buildTableHeader('Sales'),
                    _buildTableHeader('Revenue'),
                  ],
                ),
                ...products.map((product) => TableRow(
                  children: [
                    _buildTableCell(product['name']!),
                    _buildTableCell(product['sales']!),
                    _buildTableCell(product['revenue']!),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildUsersByCountry() {
    final countries = [
      {'name': 'United States', 'users': '1,234', 'percentage': 45.0},
      {'name': 'Indonesia', 'users': '856', 'percentage': 31.0},
      {'name': 'United Kingdom', 'users': '423', 'percentage': 15.0},
      {'name': 'Germany', 'users': '289', 'percentage': 10.0},
      {'name': 'Others', 'users': '198', 'percentage': 7.0},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Users by Country',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            ...countries.map((country) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        country['name'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        country['users'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (country['percentage'] as double) / 100,
                      backgroundColor: AppColors.border,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
