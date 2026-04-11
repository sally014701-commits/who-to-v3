import '../../features/shared/data/models/tag_model.dart';

class AppConstants {
  static const List<TagModel> defaultRoleTags = [
    TagModel(id: 'engineer', name: 'Engineer', emoji: '💻'),
    TagModel(id: 'researcher', name: 'Researcher', emoji: '🔬'),
    TagModel(id: 'data-analyst', name: 'Data Analyst', emoji: '📊'),
    TagModel(id: 'designer', name: 'Designer', emoji: '🎨'),
    TagModel(id: 'speech-giver', name: 'Speech Giver', emoji: '🎤'),
  ];

  static const List<TagModel> defaultInterestTags = [
    TagModel(id: 'health-care', name: 'Health Care', emoji: '🏥'),
    TagModel(id: 'edu-tech', name: 'Edu Tech', emoji: '📚'),
    TagModel(id: 'fin-tech', name: 'Fin Tech', emoji: '💰'),
    TagModel(id: 'social-impact', name: 'Social Impact', emoji: '🌍'),
    TagModel(id: 'others', name: 'Others', emoji: '✏️'),
  ];

  static const List<Map<String, dynamic>> matchingParams = [
    {'id': 'role', 'labelKey': 'roleDiversity', 'defaultOn': true, 'hasForm': true},
    {'id': 'interest', 'labelKey': 'interestSimilarity', 'defaultOn': true, 'hasForm': true},
    {'id': 'extroversion', 'labelKey': 'extroversionBalance', 'defaultOn': false, 'hasForm': true},
    {'id': 'englishLevel', 'labelKey': 'englishLevelSimilarity', 'defaultOn': false, 'hasForm': true},
    {'id': 'discussionQuestion', 'labelKey': 'discussionQuestionMatch', 'defaultOn': false, 'hasForm': true},
  ];
}
