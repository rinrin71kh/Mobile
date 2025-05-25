import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:worktency/widgets/button.dart';
import 'package:worktency/widgets/button_nav.dart';
import 'package:worktency/widgets/card_course.dart';
import 'package:worktency/widgets/card_teacher.dart';
import 'package:worktency/widgets/horizontal_category.dart';
import 'package:worktency/widgets/information.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _courseController = PageController(viewportFraction: 0.85);
  final PageController _infoController = PageController();
  int _selectedCategoryIndex = 0;
  int _selectedIndex = 0;

  final List<String> categories = [
    'Artificial Intelligent',
    'Machine Learning',
    'Self Development',
    'Web Development',
  ];

  final Map<String, List<CardCourse>> _coursesByCategory = {
    'Artificial Intelligent': [CardCourse(), CardCourse(), CardCourse()],
    'Machine Learning': [CardCourse(), CardCourse()],
    'Self Development': [CardCourse()],
    'Web Development': [CardCourse(), CardCourse()],
  };

  final List<Map<String, dynamic>> informationList = [
    {
      'title': "“Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”",
      'image': const AssetImage('assets/images/info.png'),
      'name': "Dr. VALY Dona",
      'position': "Professor @ITC, Cofounder @ Worktency",
      'iconOne': Icons.memory,
      'iconTwo': Icons.smart_toy,
      'hashtagOne': "Machine learning",
      'hashtagTwo': "Artificial Intelligent",
    },
    // ...other items (same as before)
  ];

  final List<Map<String, dynamic>> teachers = [
    {
      'name': "Dr. VALY Dona",
      'image': const AssetImage('assets/images/dona.jpg'),
      'position': "Researcher, AI Specialist",
    },
    {
      'name': "HOK Tin",
      'image': const AssetImage('assets/images/tin.jpg'),
      'position': "Web Developer",
    },
    {
      'name': "HENG Rathpisey",
      'image': const AssetImage('assets/images/sey.jpg'),
      'position': "Lecturer at ITC",
    },
    // Add more for demo effect
  ];

  final List<ImageProvider> imageList = [
    const AssetImage('assets/images/facebook.png'),
    const AssetImage('assets/images/linkedin.png'),
    const AssetImage('assets/images/youtube.png'),
  ];

  // For navigation
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void dispose() {
    _courseController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featuredCourses = _coursesByCategory[categories[_selectedCategoryIndex]] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain, width: 120),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Color(0xFF164F89)), onPressed: () {}),
          IconButton(icon: Icon(Icons.person, color: Color(0xFF164F89)), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        children: [
          // --- HERO SECTION ---
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF164F89), Color(0xFF4CA1AF)],
                begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Unlock Your Potential\n',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, fontFamily: 'inriaSans', color: Colors.white),
                    children: [
                      TextSpan(
                        text: 'with ',
                        style: TextStyle(fontSize: 28, color: Colors.white70),
                      ),
                      TextSpan(
                        text: 'Worktency',
                        style: TextStyle(fontSize: 28, color: Color(0xFFEE6019), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Discover industry-leading courses designed to equip you with real-world skills.',
                  style: TextStyle(fontSize: 16, color: Colors.white70, fontFamily: 'inriaSans'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: "Explore Courses",
                      onPressed: () {},
                      width: 150, height: 40, borderRadius: 20,
                      leftIcon: Icons.book, iconSize: 18,
                      textColor: Color(0xFF164F89),
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    Button(
                      text: "Get Started",
                      onPressed: () {},
                      width: 150, height: 40, borderRadius: 20,
                      leftIcon: Icons.arrow_forward, iconSize: 18,
                      textColor: Colors.white,
                      fontSize: 15,
                      color: Color(0xFFFF7A00),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset('assets/images/logo-landing.png', height: 80),
              ],
            ),
          ),
          // --- WHY CHOOSE SECTION ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                  'Why Choose Worktency?',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'inriaSans', color: Color(0xFF2F2F2F)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _featureCard(title: 'Expert Instructors', image: 'assets/images/instructor.png'),
                    _featureCard(title: 'Flexible Learning', image: 'assets/images/learning.png'),
                    _featureCard(title: 'Hands-On Learning', image: 'assets/images/handson.png'),
                  ],
                ),
              ],
            ),
          ),
          // --- FEATURED COURSES SECTION ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Text('Featured Course', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2F2F2F))),
                const SizedBox(height: 24),
                HorizontalCategory(
                  categories: categories,
                  selectedIndex: _selectedCategoryIndex,
                  onCategoryTap: (index) => setState(() => _selectedCategoryIndex = index),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 270,
                  child: PageView.builder(
                    controller: _courseController,
                    itemCount: featuredCourses.length,
                    itemBuilder: (context, i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.12), blurRadius: 20, offset: Offset(0, 6))],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: featuredCourses[i],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SmoothPageIndicator(
                  controller: _courseController,
                  count: featuredCourses.length,
                  effect: WormEffect(dotHeight: 8, dotWidth: 8, activeDotColor: Color(0xFF164F89)),
                ),
              ],
            ),
          ),
          // --- MEET OUR TEACHERS SECTION ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Meet Our Teachers', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2F2F2F))),
                const SizedBox(height: 24),
                SizedBox(
                  height: 210,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: teachers.length,
                    separatorBuilder: (_, __) => SizedBox(width: 16),
                    itemBuilder: (context, i) {
                      final t = teachers[i];
                      return CardTeacher(
                        name: t['name'],
                        image: t['image'],
                        position: t['position'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // --- INSPIRATION SECTION ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Color(0xFFFF7A00)),
                    Transform.translate(
                      offset: const Offset(-18, 0),
                      child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Color(0xFFFF7A00)),
                    ),
                    Transform.translate(
                      offset: const Offset(-36, 0),
                      child: Icon(Icons.arrow_forward_ios_rounded, size: 40, color: Color(0xFFFF7A00)),
                    ),
                    Transform.translate(
                      offset: const Offset(-46, 0),
                      child: RichText(
                        text: TextSpan(
                          text: 'To reach our only One goal,\n',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'inriaSans'),
                          children: [TextSpan(text: 'what we can share with you today')],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Info Quotes Carousel
                SizedBox(
                  height: 170,
                  child: PageView.builder(
                    controller: _infoController,
                    itemCount: informationList.length,
                    itemBuilder: (context, i) {
                      final info = informationList[i];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Information(
                          title: info['title'],
                          image: info['image'],
                          name: info['name'],
                          position: info['position'],
                          iconOne: info['iconOne'],
                          iconTwo: info['iconTwo'],
                          hashtagOne: info['hashtagOne'],
                          hashtagTwo: info['hashtagTwo'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                SmoothPageIndicator(
                  controller: _infoController,
                  count: informationList.length,
                  effect: WormEffect(dotHeight: 6, dotWidth: 6, activeDotColor: Color(0xFF164F89)),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("See More", style: TextStyle(fontFamily: 'inriaSans', fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF164F89))),
                        SizedBox(height: 4),
                        Container(height: 2, width: 50, color: Color(0xFF164F89)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // --- FOOTER SECTION ---
          _footer(context),
        ],
      ),
      bottomNavigationBar: ButtonNavigate(currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }

  // --- Helper widget for features ---
  Widget _featureCard({required String title, required String image}) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.10), blurRadius: 12)],
      ),
      child: Column(
        children: [
          Image.asset(image, height: 50),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'inriaSans', color: Colors.black87)),
        ],
      ),
    );
  }

  // --- Footer Widget ---
  Widget _footer(BuildContext context) {
    final somethingLeft = [
      'About Us', 'Contact Us', 'FaQs', 'Community Forum',
      'Term of Service', 'Careers', 'Leadership', 'Blog'
    ];
    final somethingRight = [
      'Social Impact', 'Cookies Setting', 'Terms', 'Accessibility Statement',
      'Investors', 'GO Pro Course', 'Affiliate'
    ];
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 140, height: 36,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: somethingLeft.map((item) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(item, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: 'inriaSans')),
                  ),
                ).toList(),
              ),
              // Right Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: somethingRight.map((item) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(item, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: 'inriaSans')),
                  ),
                ).toList(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Image.asset('assets/images/itc_logo.png', width: 110, height: 110),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.map((img) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Image(image: img, width: 34, height: 34),
            )).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            'Copyright © 2025 Worktency, Inc. All rights reserved.',
            style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'inriaSans'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
