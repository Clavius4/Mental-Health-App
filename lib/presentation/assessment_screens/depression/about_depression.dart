import 'package:flutter/material.dart';

class AboutDepression extends StatefulWidget {
  const AboutDepression({Key? key}) : super(key: key);

  @override
  State<AboutDepression> createState() => _AboutDepressionState();
}

class _AboutDepressionState extends State<AboutDepression> {
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
          "About Depression",
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
              "About Depression",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Depressive disorder (also known as depression) is a common mental disorder. It involves a depressed mood or loss of pleasure or interest in activities for long periods of time.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Depression is different from regular mood changes and feelings about everyday life. It can affect all aspects of life, including relationships with family, friends, and community. It can result from or lead to problems at school and at work.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Depression can happen to anyone. People who have lived through abuse, severe losses, or other stressful events are more likely to develop depression. Women are more likely to have depression than men.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "An estimated 3.8% of the population experience depression, including 5% of adults (4% among men and 6% among women), and 5.7% of adults older than 60 years. Approximately 280 million people in the world have depression. Depression is about 50% more common among women than among men. Worldwide, more than 10% of pregnant women and women who have just given birth experience depression. More than 700,000 people die due to suicide every year. Suicide is the fourth leading cause of death in 15–29-year-olds.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Although there are known, effective treatments for mental disorders, more than 75% of people in low- and middle-income countries receive no treatment. Barriers to effective care include a lack of investment in mental health care, lack of trained health-care providers, and social stigma associated with mental disorders.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Diagnosis and Treatment",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "There are effective treatments for depression. These include psychological treatment and medications. Seek care if you have symptoms of depression.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Psychological treatments are the first treatments for depression. They can be combined with antidepressant medications in moderate and severe depression. Antidepressant medications are not needed for mild depression.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Psychological treatments can teach new ways of thinking, coping, or relating to others. They may include talk therapy with professionals and supervised lay therapists. Talk therapy can happen in person or online. Psychological treatments may be accessed through self-help manuals, websites, and apps.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Effective psychological treatments for depression include:",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "• Behavioral activation\n• Cognitive behavioral therapy\n• Interpersonal psychotherapy\n• Problem-solving therapy.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Antidepressant medications include selective serotonin reuptake inhibitors (SSRIs), such as fluoxetine. Health-care providers should keep in mind the possible adverse effects associated with antidepressant medication, the ability to deliver either intervention (in terms of expertise, and/or treatment availability), and individual preferences.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Antidepressants should not be used for treating depression in children and are not the first line of treatment in adolescents, among whom they should be used with extra caution.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Self-care",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Self-care can play an important role in managing symptoms of depression and promoting overall well-being.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "What you can do:",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "• Try to keep doing activities you used to enjoy\n• Stay connected to friends and family\n• Exercise regularly, even if it’s just a short walk\n• Stick to regular eating and sleeping habits as much as possible\n• Avoid or cut down on alcohol and don’t use illicit drugs, which can make depression worse\n• Talk to someone you trust about your feelings\n• Seek help from a healthcare provider.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "If you have thoughts of suicide:",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "• Remember you are not alone, and that many people have gone through what you’re experiencing and found help\n• Talk to someone you trust about how you feel\n• Talk to a health worker, such as a doctor or counselor\n• Join a support group.\nIf you think you are in immediate danger of harming yourself, contact any available emergency services or a crisis line.",
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
