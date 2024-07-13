import 'package:get/get.dart';
import 'package:tflite_flutter/tflite_flutter.dart';



class AssessmentController extends GetxController {
  var answers = List<int>.filled(26, 0).obs;

  Interpreter? _depressionModel;
  Interpreter? _anxietyModel;
  Interpreter? _stressModel;

  @override
  void onInit() {
    super.onInit();
    _loadModels();
  }

  Future<void> _loadModels() async {
    try {
      _depressionModel = await Interpreter.fromAsset('depression_model.tflite');
      _anxietyModel = await Interpreter.fromAsset('anxiety_model.tflite');
      _stressModel = await Interpreter.fromAsset('stress_model.tflite');
      print("All models are loaded successfully");
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  void updateAnswer(int index, int value) {
    answers[index] = value;
  }

  List<double> _preprocessInput(String disease) {
    var inputFeatures = List<double>.filled(26, 0.0);
    if (disease == 'Depression') {
      for (int i = 0; i < 9; i++) {
        inputFeatures[i] = answers[i].toDouble();
      }
    } else if (disease == 'Anxiety') {
      for (int i = 0; i < 7; i++) {
        inputFeatures[i + 9] = answers[i + 9].toDouble();
      }
    } else if (disease == 'Stress') {
      for (int i = 0; i < 10; i++) {
        inputFeatures[i + 16] = answers[i + 16].toDouble();
      }
    }
    return inputFeatures;
  }

  double _computeScore(Interpreter model, List<double> inputFeatures) {
    var inputTensor = inputFeatures.reshape([1, 26]);
    var output = List.filled(1, 0.0).reshape([1, 1]);

    try {
      model.run(inputTensor, output);
      return output[0][0];
    } catch (e) {
      print('Error running inference: $e');
      return 0.0;
    }
  }

  String assessDisease(String disease) {
    List<double> inputFeatures = _preprocessInput(disease);
    double score;
// 'Assessment Score: $score\n, 'Assessment Score: $score\n, Assessment Score: $score\n
    if (disease == 'Depression') {
      score = _computeScore(_depressionModel!, inputFeatures);
      return 'Disease Status: ${categorizeDepressionScore(
          score)}';
    } else if (disease == 'Anxiety') {
      score = _computeScore(_anxietyModel!, inputFeatures);
      return 'Disease Status: ${categorizeAnxietyScore(
          score)}';
    } else if (disease == 'Stress') {
      score = _computeScore(_stressModel!, inputFeatures);
      return 'Disease Status: ${categorizeStressScore(
          score)}';
    } else {
      return 'Invalid disease selection.';
    }
  }

  String categorizeDepressionScore(double score) {
    if (score < 5) {
      return '''
Minimal or No Depression
Based on your responses, it appears that you have minimal or no signs of depression. This is a positive indication, and no immediate treatment is necessary. However, it’s important to maintain your mental well-being. Here are a few tips:
- Continue engaging in activities you enjoy.
- Maintain a healthy lifestyle, including regular exercise, balanced nutrition, and sufficient sleep.
- Monitor your mood and if you notice any changes or worsening symptoms, consider re-evaluating with the PHQ-9 or seeking further advice.
- Schedule periodic check-ins with a healthcare provider to ensure your mental health remains stable.
    ''';
    } else if (score < 10) {
      return '''
Mild Depression
Your responses suggest mild depression. While this level of depression often doesn’t require intensive treatment, it’s important to take steps to prevent worsening. Here’s what you can do:
- Engage in regular physical activity, which can help improve mood.
- Ensure you are getting adequate sleep and maintain good sleep hygiene by having a consistent bedtime routine.
- Consider brief counseling sessions, which can provide support and strategies to manage symptoms.
- Schedule a follow-up evaluation in a few weeks to reassess your symptoms. If you notice any increase in the severity of your symptoms, seek further help.
    ''';
    } else if (score < 15) {
      return '''
Moderate Depression
Your responses indicate moderate depression. This level of depression can impact your daily life and may require more active treatment. Here are my recommendations:
- Begin with regular psychotherapy sessions, such as cognitive-behavioral therapy (CBT), which can help you manage and reduce your symptoms.
- You might also benefit from medications that can help balance the chemicals in your brain that affect mood.
- Consider seeing a mental health professional who can work with you to develop a treatment plan tailored to your needs.
- Monitor your progress and make sure to have regular follow-up appointments to adjust your treatment as necessary.
    ''';
    } else if (score < 20) {
      return '''
Moderately Severe Depression
Your responses suggest you have moderately severe depression. It’s important to address this level of depression promptly to prevent further impact on your life. Here’s what you should do:
- Start treatment with antidepressant medication, which can help alleviate symptoms.
- Engage in regular, intensive psychotherapy sessions to explore and address underlying issues and develop coping strategies.
- I strongly recommend seeing a mental health specialist, such as a psychiatrist or psychologist, to provide comprehensive care.
- Keep track of your symptoms and make sure to have regular check-ins to monitor your progress and adjust treatment as needed.
    ''';
    } else {
      return '''
Severe Depression
Your responses indicate severe depression, which requires immediate and intensive treatment to ensure your safety and well-being. Here are the steps you should take:
- Begin immediate treatment with both antidepressant medication and intensive psychotherapy.
- Seek an urgent referral to a psychiatrist or mental health specialist who can provide specialized care.
- If you have any thoughts of self-harm or feel unable to care for yourself, please seek emergency help immediately. Consider the possibility of inpatient treatment to ensure you receive the necessary support and care.
- Regularly monitor your symptoms and have frequent follow-up appointments to adjust your treatment plan as needed.
    ''';
    }
  }

  String categorizeAnxietyScore(double score) {
    if (score < 5) {
      return '''
Minimal Anxiety
Your responses suggest minimal anxiety, which is a good sign. There is no need for specific treatment at this time. However, maintaining a healthy lifestyle can help prevent future anxiety. Here are some recommendations:
- Practice regular stress management techniques such as mindfulness or deep breathing exercises.
- Continue to engage in activities you enjoy and find relaxing.
- Monitor your anxiety levels, and if you notice an increase in symptoms, consider reassessing with the GAD-7 or seeking further advice.
    ''';
    } else if (score < 10) {
      return '''
Mild Anxiety
Your responses indicate mild anxiety. This level of anxiety is common and can often be managed with some simple strategies:
- Monitor your symptoms and schedule a follow-up assessment in a few weeks.
- Engage in regular physical activity and ensure you are getting enough sleep.
- Practice relaxation techniques such as deep breathing, meditation, or yoga.
- Consider brief counseling sessions to develop strategies for managing anxiety.
    ''';
    } else if (score < 15) {
      return '''
Moderate Anxiety
Your responses suggest moderate anxiety, which can affect your daily life. Here are my recommendations:
- Consider starting cognitive-behavioral therapy (CBT) or another form of psychotherapy to help manage your anxiety.
- Medications may also be beneficial. Discuss with a healthcare provider whether this is appropriate for you.
- It might be helpful to see a mental health professional who can provide a comprehensive evaluation and treatment plan.
- Regularly monitor your symptoms and schedule follow-up appointments to track your progress.
    ''';
    } else {
      return '''
Severe Anxiety
Your responses indicate severe anxiety, which requires immediate and comprehensive treatment. Here’s what you should do:
- Begin treatment with medications to help manage your anxiety symptoms.
- Engage in intensive psychotherapy, such as CBT, to address and manage your anxiety.
- I strongly recommend seeing a mental health specialist for a thorough evaluation and tailored treatment plan.
- If your anxiety is significantly impacting your ability to function, consider seeking urgent help. Regular monitoring and follow-up are crucial to ensure your treatment is effective.
    ''';
    }
  }

  String categorizeStressScore(double score) {
    if (score < 14) {
      return '''
Low Stress
Your responses suggest that you have low perceived stress, which is a positive indication for your overall well-being. Here’s how to maintain this:
- Continue with your current lifestyle, ensuring it includes activities that you enjoy and find relaxing.
- Practice regular stress management techniques, such as mindfulness or deep breathing exercises.
- Maintain a balanced diet, regular exercise, and adequate sleep.
    ''';
    } else if (score < 27) {
      return '''
Moderate Stress
Your responses indicate moderate stress. This level of stress can impact your health and well-being, so it’s important to manage it effectively. Here’s what you can do:
- Practice mindfulness and relaxation techniques such as yoga, meditation, or deep breathing exercises.
- Make lifestyle changes to reduce stress, such as regular physical activity, a healthy diet, and ensuring you get enough sleep.
- Consider brief counseling or psychoeducation sessions to develop effective stress management strategies.
    ''';
    } else {
      return '''
High Stress
Your responses suggest high levels of perceived stress, which can significantly impact your health and daily functioning. It’s important to address this promptly. Here’s what you should do:
- Engage in intensive stress management programs or workshops that focus on coping strategies and stress reduction techniques.
- Consider seeking counseling or therapy to address underlying issues contributing to your high stress levels.
- Practice advanced stress management techniques tailored to your specific stressors.
- It’s essential to monitor your stress levels and schedule follow-up appointments to track your progress and adjust your stress management plan as needed.
    ''';
    }
  }
}
