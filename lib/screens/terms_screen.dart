import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: CustomScrollView(
        slivers: [
          // ── App bar ──────────────────────────────────────────────────────
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            expandedHeight: 0,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEDE9FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: Color(0xFF6B2D8B), size: 18),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(height: 1, color: const Color(0xFFF0F0F0)),
            ),
          ),

          // ── Content ──────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 24, 18, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6B2D8B), Color(0xFF9B4DC8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '📋  SarapFinder',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Last updated: May 2026',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const _Intro(
                    text:
                        'Welcome to SarapFinder. By accessing or using our application, you agree to be bound by these Terms and Conditions. Please read them carefully before using the service.',
                  ),
                  const SizedBox(height: 20),

                  const _Section(
                    number: '1',
                    title: 'Acceptance of Terms',
                    body:
                        'By downloading, installing, or using SarapFinder, you confirm that you are at least 13 years of age and have the legal capacity to enter into a binding agreement. If you are using the app on behalf of an organization, you represent that you have the authority to bind that organization to these terms.\n\nContinued use of the application after any changes to these terms constitutes your acceptance of the revised terms.',
                  ),

                  const _Section(
                    number: '2',
                    title: 'Use of the Service',
                    body:
                        'SarapFinder provides a platform for discovering and ordering food from local stalls and eateries in Olongapo City and surrounding areas. You agree to use the service only for lawful purposes and in a manner that does not infringe the rights of others.\n\nYou must not:\n• Use the service to transmit any unsolicited or unauthorized advertising\n• Attempt to gain unauthorized access to any part of the service\n• Use automated tools to scrape, crawl, or extract data from the platform\n• Impersonate any person or entity or misrepresent your affiliation',
                  ),

                  const _Section(
                    number: '3',
                    title: 'Account Registration',
                    body:
                        'To access certain features, you may be required to create an account. You are responsible for maintaining the confidentiality of your login credentials and for all activities that occur under your account.\n\nYou agree to provide accurate, current, and complete information during registration and to update such information to keep it accurate. SarapFinder reserves the right to suspend or terminate accounts that contain false or misleading information.',
                  ),

                  const _Section(
                    number: '4',
                    title: 'Orders and Payments',
                    body:
                        'When you place an order through SarapFinder, you are entering into a transaction directly with the food stall or vendor. SarapFinder acts as an intermediary platform and is not a party to the transaction between you and the vendor.\n\nAll prices displayed are in Philippine Peso (₱) and are inclusive of applicable taxes unless stated otherwise. Payment must be completed at the time of order. SarapFinder is not responsible for pricing errors made by vendors.',
                  ),

                  const _Section(
                    number: '5',
                    title: 'Cancellations and Refunds',
                    body:
                        'Orders may be cancelled within 5 minutes of placement, provided the vendor has not yet begun preparing the order. Once preparation has started, cancellations are subject to the individual vendor\'s policy.\n\nRefunds for valid cancellations or order errors will be processed within 3–5 business days to the original payment method. SarapFinder reserves the right to deny refund requests that do not meet the eligibility criteria.',
                  ),

                  const _Section(
                    number: '6',
                    title: 'Privacy and Data',
                    body:
                        'Your use of SarapFinder is also governed by our Privacy Policy, which is incorporated into these Terms by reference. We collect and process personal data such as your name, contact information, location, and order history to provide and improve the service.\n\nWe do not sell your personal data to third parties. Data may be shared with vendors solely for the purpose of fulfilling your orders.',
                  ),

                  const _Section(
                    number: '7',
                    title: 'Intellectual Property',
                    body:
                        'All content on SarapFinder — including but not limited to logos, graphics, text, and software — is the property of SarapFinder or its licensors and is protected by applicable intellectual property laws.\n\nYou may not reproduce, distribute, modify, or create derivative works from any content on the platform without prior written consent from SarapFinder.',
                  ),

                  const _Section(
                    number: '8',
                    title: 'Limitation of Liability',
                    body:
                        'SarapFinder is provided on an "as is" and "as available" basis. We make no warranties, express or implied, regarding the reliability, accuracy, or availability of the service.\n\nTo the fullest extent permitted by law, SarapFinder shall not be liable for any indirect, incidental, special, or consequential damages arising from your use of or inability to use the service, including but not limited to food quality issues, delivery delays, or vendor conduct.',
                  ),

                  const _Section(
                    number: '9',
                    title: 'Changes to Terms',
                    body:
                        'SarapFinder reserves the right to modify these Terms and Conditions at any time. We will notify users of significant changes through the application or via email. Your continued use of the service after such notification constitutes acceptance of the updated terms.',
                  ),

                  const _Section(
                    number: '10',
                    title: 'Governing Law',
                    body:
                        'These Terms and Conditions shall be governed by and construed in accordance with the laws of the Republic of the Philippines. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of the courts of Olongapo City.',
                  ),

                  const _Section(
                    number: '11',
                    title: 'Contact Us',
                    body:
                        'If you have any questions or concerns about these Terms and Conditions, please contact us at:\n\n📧  support@sarapfinder.ph\n📍  Olongapo City, Zambales, Philippines',
                  ),

                  const SizedBox(height: 8),

                  // Footer
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE9FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'By using SarapFinder, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B2D8B),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Helper widgets ──────────────────────────────────────────────────────────

class _Intro extends StatelessWidget {
  final String text;
  const _Intro({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        color: Colors.black54,
        height: 1.7,
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String number, title, body;
  const _Section({
    required this.number,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF6B2D8B),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              body,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
