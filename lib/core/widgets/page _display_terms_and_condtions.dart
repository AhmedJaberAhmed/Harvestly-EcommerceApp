import 'package:flutter/material.dart';
import 'package:ecommerece_fruites/core/utils/custom_colors.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  static const routeName = "TermsConditionsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "من نحن",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                _InfoCard(
                  content:
                  "Fruits HUB هي منصة إلكترونية متخصصة في تقديم أجود أنواع الفواكه والخضروات الطازجة، مباشرة من المزارع إلى باب منزلك. نحن نؤمن بأهمية الغذاء الصحي ونحرص على تقديم منتجات طبيعية 100% بأعلى جودة ممكنة.",
                ),
                _InfoCard(
                  content:
                  "تأسست منصتنا بهدف تسهيل تجربة التسوق الغذائي، وتوفير خيارات طازجة وسريعة التوصيل لكافة العملاء في مختلف المناطق. نعمل بشغف يوميًا لضمان رضا العميل وراحته.",
                ),
                _InfoCard(
                  content:
                  "فريقنا مكوّن من خبراء في الزراعة والتغذية والتقنية، ونعمل بشكل متكامل لتقديم خدمة موثوقة ومميزة. نحن نستخدم أحدث تقنيات التعبئة والتغليف لضمان وصول منتجاتنا إليك بأفضل حالة.",
                ),
                _InfoCard(
                  content:
                  "نلتزم بالشفافية والجودة في جميع تعاملاتنا، ونرحب دائمًا بملاحظاتكم واقتراحاتكم التي تساعدنا على التطور المستمر وتحقيق أعلى مستويات الخدمة.",
                ),
                _InfoCard(
                  content:
                  "شكرًا لاختياركم Fruits HUB – وجهتكم الأولى للفواكه الطازجة!",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String content;

  const _InfoCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16, height: 1.7),
      ),
    );
  }
}
