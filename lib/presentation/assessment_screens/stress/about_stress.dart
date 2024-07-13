import 'package:flutter/material.dart';

class AboutStress extends StatefulWidget {
  const AboutStress({Key? key}) : super(key: key);

  @override
  State<AboutStress> createState() => _AboutStressState();
}

class _AboutStressState extends State<AboutStress> {
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
          "About Stress",
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
              "About Stress",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Stress can be defined as a state of worry or mental tension caused by a difficult situation. Stress is a natural human response that prompts us to address challenges and threats in our lives. Everyone experiences stress to some degree. The way we respond to stress, however, makes a big difference to our overall well-being.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "How does stress affect us?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Stress affects both the mind and the body. A little bit of stress is good and can help us perform daily activities. Too much stress can cause physical and mental health problems. Learning how to cope with stress can help us feel less overwhelmed and support our mental and physical well-being.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Should we expect to be stressed in difficult situations?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Yes, it is natural to feel stressed in challenging situations such as job interviews, school exams, unrealistic workloads, an insecure job, or conflict with family, friends or colleagues. For many people stress reduces over time as the situation improves or as they learn to cope emotionally with the situation. Stress tends to be widespread during events such as major economic crises, disease outbreaks, natural disasters, war, and community violence.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Learn Stress Management",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "WHO’s stress management guide – Doing what matters in times of stress – aims to equip people with practical skills to cope with stress. A few minutes each day are enough to practise the guide’s self-help techniques. The guide can be used alone or with its accompanying audio exercises.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Keep a Daily Routine",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Having a daily schedule can help us use our time efficiently and feel more in control. Set time for regular meals, time with family members, exercise, daily chores and other recreational activities.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Get Plenty of Sleep",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Getting enough sleep is important for both body and mind. Sleep repairs, relaxes and rejuvenates our body and can help reverse the effect of stress.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Good sleep habits (also known as sleep hygiene) include:",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "• Be consistent. Go to bed at the same time each night and get up at the same time each morning, including on the weekends.\n"
                  "• If possible, make your sleeping area quiet, dark, relaxing and at a comfortable temperature.\n"
                  "• Limit your use of electronic devices, such as TVs, computers and smartphones, before sleeping.\n"
                  "• Avoid large meals, caffeine and alcohol before bedtime.\n"
                  "• Get some exercise. Being physically active during the day can help you fall asleep more easily at night.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Connect with Others",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Keep in touch with family and friends and share your concerns and feelings with people you trust. Connecting with others can lift our mood and help us feel less stressed.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Eat Healthy",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "What we eat and drink can affect our health. Try to eat a balanced diet and to eat at regular intervals. Drink enough fluids. Eat lots of fresh fruits and vegetables if you can.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Exercise Regularly",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Regular daily exercise can help to reduce stress. This can include walking, as well as more intensive exercise.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Limit Time Following News",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Spending too much time following news on television and social media can increase stress. Limit the time you spend following the news if it increases your stress.",
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
