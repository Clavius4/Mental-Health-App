import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JournalsScreen extends StatelessWidget {
  final List<Journal> journals = [
    Journal(
      title: "Adult Mental Health Disorders and Their Age at Onset",
      url: "https://www.cambridge.org/core/journals/the-british-journal-of-psychiatry/article/adult-mental-health-disorders-and-their-age-at-onset/13F1A156235E5FF0D904F2CE2FDC053F",
    ),
    Journal(
      title: "Student Mental Health from Evaluation of the California Mental Health Services Authority's Prevention and Early Intervention Initiatives: Progress and Preliminary Findings on JSTOR",
      url: "https://www.researchgate.net/publication/380399581_What_is_mental_health_and_disorder_Philosophical_implications_from_lay_judgments",
    ),
    Journal(
      title: "What is mental health and disorder? Philosophical implications from lay judgments",
      url: "https://www.researchgate.net/publication/380602751_Mental_Health?_sg=mXYe_ReFrMzoSAwdQ6RkaALC3kVw6wwTXhOzaGYelSN8gD6kC4q5kTLb9eYcem2fejIxlzKiH0FW29E&_tp=eyJjb250ZXh0Ijp7ImZpcnN0UGFnZSI6ImxvZ2luIiwicGFnZSI6Il9kaXJlY3QifX0",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journals'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: journals.length,
        itemBuilder: (context, index) {
          final journal = journals[index];
          return GestureDetector(
            onTap: () async {
              final uri = Uri.parse(journal.url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not launch ${journal.url}')),
                );
              }
            },
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.book, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        journal.title,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.blueAccent, size: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Journal {
  final String title;
  final String url;

  Journal({required this.title, required this.url});
}
