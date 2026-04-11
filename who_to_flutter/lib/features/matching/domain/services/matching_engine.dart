import 'dart:math';
import '../../../profile/data/models/student_model.dart';
import '../../data/models/session_model.dart';
import '../../data/models/team_model.dart';

class MatchingEngine {
  static double jaccardSimilarity(Set<String> setA, Set<String> setB) {
    if (setA.isEmpty && setB.isEmpty) return 0.5;
    final intersection = setA.intersection(setB);
    final union = setA.union(setB);
    return intersection.length / union.length;
  }

  static double jaccardDistance(Set<String> setA, Set<String> setB) {
    return 1 - jaccardSimilarity(setA, setB);
  }

  static double calculatePairwiseScore(
    StudentMatchingInputs studentA,
    StudentMatchingInputs studentB,
    Map<String, int> weights,
    List<String> params,
  ) {
    double score = 0;
    final double totalWeight = weights.values.fold(0, (a, b) => a + b).toDouble();
    if (totalWeight == 0) return 0;

    if (params.contains('role')) {
      final rolesA = studentA.roleTagIds.toSet();
      final rolesB = studentB.roleTagIds.toSet();
      score += (weights['role'] ?? 0) / totalWeight * jaccardDistance(rolesA, rolesB);
    }

    if (params.contains('interest')) {
      final interestsA = studentA.interestTagIds.toSet();
      final interestsB = studentB.interestTagIds.toSet();
      score += (weights['interest'] ?? 0) / totalWeight * jaccardSimilarity(interestsA, interestsB);
    }

    if (params.contains('englishLevel')) {
      final la = studentA.englishLevel;
      final lb = studentB.englishLevel;
      final levelSim = 1 - (la - lb).abs() / 4.0;
      score += (weights['englishLevel'] ?? 0) / totalWeight * levelSim;
    }

    if (params.contains('discussionQuestion')) {
      final sameQ = (studentA.discussionQuestionId != null &&
              studentA.discussionQuestionId == studentB.discussionQuestionId)
          ? 1.0
          : 0.0;
      score += (weights['discussionQuestion'] ?? 0) / totalWeight * sameQ;
    }

    return score;
  }

  static List<List<int>> greedyTeamFormation(
    List<StudentMatchingInputs> students,
    int teamSize,
    List<List<double>> matrix,
    List<String> params,
    double weightExtro,
    double? globalExtroMean,
  ) {
    final int n = students.length;
    final numTeams = (n / teamSize).ceil();
    final assigned = List.filled(n, false);
    final List<List<int>> teams = [];
    final bool useExtro = params.contains('extroversion') &&
        weightExtro > 0 &&
        globalExtroMean != null;

    for (int t = 0; t < numTeams; t++) {
      final List<int> team = [];
      int bestSeed = -1;
      double bestAvg = -1;

      for (int i = 0; i < n; i++) {
        if (!assigned[i]) {
          final avgCompat = matrix[i].reduce((a, b) => a + b) / n;
          if (avgCompat > bestAvg) {
            bestAvg = avgCompat;
            bestSeed = i;
          }
        }
      }

      if (bestSeed >= 0) {
        team.add(bestSeed);
        assigned[bestSeed] = true;
      }

      while (team.length < teamSize) {
        int bestCandidate = -1;
        double bestScore = double.negativeInfinity;
        final teamExtSum = useExtro
            ? team.fold(0.0, (s, idx) => s + (students[idx].extroversionScore))
            : 0;

        for (int candidate = 0; candidate < n; candidate++) {
          if (assigned[candidate]) continue;
          final avgWithTeam = team.fold(0.0, (sum, member) => sum + matrix[candidate][member]) / team.length;
          double score = avgWithTeam;

          if (useExtro) {
            final newTeamAvg = (teamExtSum + students[candidate].extroversionScore) / (team.length + 1);
            final dev = (newTeamAvg - globalExtroMean!).abs() / 5.0;
            score -= weightExtro * dev;
          }

          if (score > bestScore) {
            bestScore = score;
            bestCandidate = candidate;
          }
        }

        if (bestCandidate >= 0) {
          team.add(bestCandidate);
          assigned[bestCandidate] = true;
        } else {
          break;
        }
      }
      if (team.isNotEmpty) teams.add(team);
    }
    return teams;
  }

  static List<TeamModel> runMatching(SessionModel session, List<StudentModel> allStudents) {
    final inputs = allStudents.map((s) => s.inputs).toList();
    final params = session.config.selectedParams;
    final weights = session.config.weights;
    final teamSize = session.config.teamSize;

    if (inputs.isEmpty) return [];

    final n = inputs.length;
    final matrix = List.generate(n, (_) => List.filled(n, 0.0));

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        final score = calculatePairwiseScore(inputs[i], inputs[j], weights, params);
        matrix[i][j] = score;
        matrix[j][i] = score;
      }
    }

    double? globalExtroMean;
    if (params.contains('extroversion')) {
      globalExtroMean = inputs.fold(0.0, (s, st) => s + st.extroversionScore) / n;
    }

    final teamIndices = greedyTeamFormation(
      inputs,
      teamSize,
      matrix,
      params,
      (weights['extroversion'] ?? 0).toDouble(),
      globalExtroMean,
    );

    return teamIndices.asMap().entries.map((entry) {
      final i = entry.key;
      final indices = entry.value;
      final cohesion = _calculateCohesion(indices, matrix);
      return TeamModel(
        identity: TeamIdentity(id: 'team_$i', name: 'Team ${String.fromCharCode(65 + i)}'),
        results: MatchingResults(
          cohesionScore: cohesion,
          memberIds: indices.map((idx) => allStudents[idx].identity.id).toList(),
        ),
      );
    }).toList();
  }

  static double _calculateCohesion(List<int> teamIndices, List<List<double>> matrix) {
    if (teamIndices.length < 2) return 0;
    double total = 0;
    int pairs = 0;
    for (int i = 0; i < teamIndices.length; i++) {
      for (int j = i + 1; j < teamIndices.length; j++) {
        total += matrix[teamIndices[i]][teamIndices[j]];
        pairs++;
      }
    }
    return pairs > 0 ? total / pairs : 0;
  }
}
