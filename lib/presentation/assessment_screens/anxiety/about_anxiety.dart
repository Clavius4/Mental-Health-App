import 'package:flutter/material.dart';

class AboutAnxiety extends StatefulWidget {
  const AboutAnxiety({Key? key}) : super(key: key);

  @override
  State<AboutAnxiety> createState() => _AboutAnxietyState();
}

class _AboutAnxietyState extends State<AboutAnxiety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "About Anxiety",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Anxiety",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Anxiety is the feeling you get when you’re worried or scared about something. It is a natural, human feeling of fear or panic. Afterwards, we usually calm down and feel better.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Small amounts of worry and fear can help keep us safe and even protect us from danger. But sometimes anxiety can make us feel like things are worse than they actually are and can feel overwhelming. Constant worry can lead to prolonged anxiety.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "What causes anxiety?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "It can be hard to pinpoint the exact causes of anxiety. When we face stressful situations, alarm bells go off in our brain telling us something isn’t right and that we need to deal with it. To make the difficult situation go away, our brain makes us more alert, stops us from thinking about other things and even pumps more blood to our legs to help us run away.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Living with Anxiety Disorder",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Living with anxiety disorder can be challenging, but it’s important to know that recovery is possible. Some lifestyle changes that can help manage anxiety disorder include:",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "• Regular exercise\n• Healthy diet\n• Adequate sleep\n• Stress reduction techniques",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Therapy options for anxiety disorder include:",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "• Cognitive-behavioral therapy (CBT)\n• Exposure therapy\n• Mindfulness-based therapy",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "In some cases, medication may also be prescribed to manage anxiety disorder.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Conclusion",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Anxiety disorder is a prevalent mental health condition that affects many individuals worldwide. Recognizing the symptoms and seeking help is crucial. With the proper treatment and support, individuals with anxiety disorder can manage their symptoms and live a fulfilling life. Remember, taking care of your mental health is just as important as your physical health.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
