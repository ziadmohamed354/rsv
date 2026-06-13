import 'package:flutter/material.dart';

class TabletHomePage extends StatefulWidget {
  const TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // الخلفية البيضاء الأساسية
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0), // مسافة أكبر تناسب التابلت
          children: [
            // ==================== 1. شريط البحث العلوي (مقسم لـ 3 أجزاء) ====================
            Row(
              children: [
                // اللوجو أو الاسم على الشمال
                Text(
                  'Wandr',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),

                // شريط البحث في النص
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red.shade100),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.red.shade700),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.black87),
                            decoration: InputDecoration(
                              hintText: 'Search destinations, cities, exp...',
                              hintStyle: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),

                // أيقونة اليوزر على اليمين
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade100),
                  ),
                  child: Icon(Icons.person, color: Colors.red.shade700),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ==================== 2. قسم الكروت العلوية (الكبير والـ 2 الصغيرين جنب بعض) ====================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الكارت الكبير (واخد مساحة أكبر Expanded مع flex: 2)
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 240, // ارتفاع أكبر يناسب التابلت
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD32F2F), Color(0xFFFF5252)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Santorini, Greece',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cliffside villages, deep blue domes & golden sunsets.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16), // مسافة بين الكبير والصغيرين
                // الكارتين الصغيرين على اليمين فوق بعض (flex: 1)
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 240, // نفس ارتفاع الكارت الكبير بالظبط
                    child: Column(
                      children: [
                        Expanded(child: _buildSideCard('Kyoto')),
                        const SizedBox(height: 12),
                        Expanded(child: _buildSideCard('Maldives')),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ==================== 3. عنوان Popular Destinations ====================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Destinations',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ==================== 4. الـ 6 كروت بتصميمك الخاص (3 جنب بعض فوق، و 3 تحتهم) ====================
            // الصف الأول
            Row(
              children: [
                Expanded(child: _buildMyCustomCard('Bali')),
                const SizedBox(width: 16),
                Expanded(child: _buildMyCustomCard('Paris')),
                const SizedBox(width: 16),
                Expanded(child: _buildMyCustomCard('Machu Picchu')),
              ],
            ),

            const SizedBox(height: 16), // مسافة بين الصفين
            // Row الصف الثاني
            Row(
              children: [
                Expanded(child: _buildMyCustomCard('Amalfi Coast')),
                const SizedBox(width: 16),
                Expanded(child: _buildMyCustomCard('Iceland')),
                const SizedBox(width: 16),
                Expanded(child: _buildMyCustomCard('Maldives')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ==================== الـ Widget المساعد للكارت بتصميمك الخاص بالألوان الجديدة ====================
  Widget _buildMyCustomCard(String title) {
    return Container(
      height: 160, // تكبير الارتفاع قليلاً ليناسب شاشة التابلت
      decoration: BoxDecoration(
        color: const Color(0xFFB71C1C), // الأحمر الغامق تحت
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // الجزء الفاتح اللي فوق
          Container(
            height: 100, // مساحة أكبر للصورة مستقبلاً
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          // الجزء الغامق تحت
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== الـ Widget المساعد للكروت الجانبية الصغيرة ====================
  Widget _buildSideCard(String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFB71C1C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
