import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int? _selectedIndex;

  final List<_FoodCategory> _categories = const [
    _FoodCategory(
      emoji: '🍚',
      title: 'Filipino Classics',
      subtitle: 'Silogs, Sinigang, BBQ',
    ),
    _FoodCategory(
      emoji: '🍔',
      title: 'Western Bites',
      subtitle: 'Burgers, Pizza, Fries',
    ),
    _FoodCategory(
      emoji: '🍜',
      title: 'Asian Cravings',
      subtitle: 'Milktea, Ramen, Sushi',
    ),
    _FoodCategory(
      emoji: '🥗',
      title: 'Fresh & Light',
      subtitle: 'Salads, Wraps, Vegan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Title
              const Text(
                "What's Your\nUltimate\nComfort Food?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                  height: 1.25,
                ),
              ),
              const Spacer(flex: 2),
              // Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.1,
                children: List.generate(_categories.length, (index) {
                  final selected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF6B2D8B)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: selected
                                ? const Color(0xFF6B2D8B).withValues(alpha: 0.35)
                                : Colors.black.withValues(alpha: 0.07),
                            blurRadius: selected ? 16 : 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _categories[index].emoji,
                            style: const TextStyle(fontSize: 44),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _categories[index].title,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: selected
                                  ? Colors.white
                                  : const Color(0xFF1A1A2E),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _categories[index].subtitle,
                            style: TextStyle(
                              fontSize: 11,
                              color: selected
                                  ? Colors.white70
                                  : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(flex: 2),
              // Next button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _selectedIndex != null ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C9A7),
                    disabledBackgroundColor:
                        const Color(0xFF00C9A7).withValues(alpha: 0.45),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _FoodCategory {
  final String emoji;
  final String title;
  final String subtitle;
  const _FoodCategory({
    required this.emoji,
    required this.title,
    required this.subtitle,
  });
}
