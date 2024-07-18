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
**Minimal or No Depression**
You have minimal or no signs of depression.
Maintain your mental well-being.
Engage in enjoyable activities.
Maintain a healthy lifestyle.
Monitor mood and schedule periodic check-ins.
    ''';
    } else if (score < 10) {
      return '''
**Mild Depression**
You have mild depression.
Engage in regular physical activity.
Maintain good sleep hygiene.
Consider brief counseling.
Schedule a follow-up evaluation.
    ''';
    } else if (score < 15) {
      return '''
**Moderate Depression**
You have moderate depression.
Consider regular psychotherapy sessions.
Medications may help balance brain chemicals.
See a mental health professional.
Monitor progress with regular follow-ups.
    ''';
    } else if (score < 20) {
      return '''
**Moderately Severe Depression**
You have moderately severe depression.
Start treatment with antidepressant medication.
Engage in intensive psychotherapy.
See a mental health specialist.
Monitor symptoms with regular check-ins.
    ''';
    } else {
      return '''
**Severe Depression**
You have severe depression.
Begin immediate treatment with medication and therapy.
Seek a referral to a mental health specialist.
If thoughts of self-harm occur, seek emergency help.
Regularly monitor symptoms and adjust treatment.
    ''';
    }
  }

  String categorizeAnxietyScore(double score) {
    if (score < 5) {
      return '''
**Minimal Anxiety**
You have minimal anxiety.
Maintain a healthy lifestyle.
Engage in enjoyable activities.
Practice stress management techniques.
Monitor anxiety levels.
    ''';
    } else if (score < 10) {
      return '''
**Mild Anxiety**
You have mild anxiety.
Monitor symptoms and reassess in a few weeks.
Engage in regular physical activity.
Practice relaxation techniques.
Consider brief counseling.
    ''';
    } else if (score < 15) {
      return '''
**Moderate Anxiety**
You have moderate anxiety.
Consider starting psychotherapy.
Medications may be beneficial.
See a mental health professional.
Monitor symptoms and schedule follow-ups.
    ''';
    } else {
      return '''
**Severe Anxiety**
You have severe anxiety.
Begin treatment with medications.
Engage in intensive psychotherapy.
See a mental health specialist.
Seek urgent help if anxiety affects functioning.
    ''';
    }
  }

  String categorizeStressScore(double score) {
    if (score < 14) {
      return '''
**Low Stress**
You have low perceived stress.
Maintain your current lifestyle.
Engage in enjoyable and relaxing activities.
Practice stress management techniques.
Maintain a balanced diet and regular exercise.
    ''';
    } else if (score < 27) {
      return '''
**Moderate Stress**
You have moderate stress.
Practice mindfulness and relaxation techniques.
Make lifestyle changes to reduce stress.
Consider brief counseling.
Monitor and manage stress effectively.
    ''';
    } else {
      return '''
**High Stress**
You have high perceived stress.
Engage in intensive stress management programs.
Seek counseling to address underlying issues.
Practice advanced stress management techniques.
Monitor stress levels and schedule follow-ups.
    ''';
    }
  }
}
