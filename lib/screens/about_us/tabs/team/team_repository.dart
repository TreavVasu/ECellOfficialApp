import 'dart:convert';
import 'dart:math';
import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/team.dart';
import 'package:ecellapp/models/team_category.dart';
import 'package:http/http.dart' as http;

abstract class TeamRepository {
  /// fetches all team members data and returns the list of [TeamCategory]
  ///
  /// Make sure that the category that has no members should not be shown in the UI.
  Future<List<TeamCategory>> getAllTeamMembers();
}

class FakeTeamRepository implements TeamRepository {
  @override
  Future<List<TeamCategory>> getAllTeamMembers() async {
    // network delay
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextBool()) {
      throw NetworkException();
    } else {
      var response = {
        "message": "Team members Fetched successfully.",
        "data": [
          {
            "id": 1,
            "name": "Kick Buttowski",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "EXC",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 2,
            "name": "Elon Musk",
            "profile_url":
            "https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg",
            "image": null,
            "member_type": "HCD",
            "year": 2021,
            "domain": "tech",
            "linkedin": null,
            "facebook": null
          },
          {
            "id": 4,
            "name": "Bowjack",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "EXC",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 5,
            "name": "Agent P",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "DIR",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 6,
            "name": "Jack Sparrow",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "FCT",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 7,
            "name": "Taylor Swift",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "HCO",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 8,
            "name": "Pidgeot",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "EXC",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 9,
            "name": "Dragonite",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "DIR",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 10,
            "name": "Kiterestu",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "MNG",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 15,
            "name": "Kochikame",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "MNG",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 11,
            "name": "Hattori",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "OCO",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
          {
            "id": 1,
            "name": "Kazama",
            "profile_url":
            "https://i.pinimg.com/originals/83/f5/88/83f588b8414b1bacfd0ef3027b5aba7f.jpg",
            "image": null,
            "member_type": "EXC",
            "year": 2021,
            "domain": "tech",
            "linkedin": "http://linkdin.com/IamBttowski",
            "facebook": "http://facebook.com/IamBttowski"
          },
        ]
      };

      List<TeamCategory> categories = [
        TeamCategory("Director", []),
        TeamCategory("Head of CDC", []),
        TeamCategory("Faculty Incharge", []),
        TeamCategory("Overall Co-ordinators", []),
        TeamCategory("Head Co-ordinators", []),
        TeamCategory("Managers", []),
        TeamCategory("Executives", []),
        TeamCategory("Other", []),
      ];

      Map<String, int> typeToIndex = {
        "DIR": 0,
        "HCD": 1,
        "FCT": 2,
        "OCO": 3,
        "HCO": 4,
        "MNG": 5,
        "EXC": 6,
      };

      (response["data"] as List).forEach((e) {
        // converting json to dart TeamMember object.
        TeamMember member = TeamMember.fromJson(e);
        // adding the team member to the specific category.
        // If that category doesnot exist in our directory, add it to the others list.
        categories[typeToIndex[member.type] ?? 7].members.add(member);
      });

      return categories;
    }
  }
}

class APITeamRepository extends TeamRepository {
  final String classTag = "APITeamRepository";

  @override
  Future<List<TeamCategory>> getAllTeamMembers() async {
    final String tag = classTag + "getAllTeamMembers()";
    http.Response response;
    try {
      response = await sl.get<http.Client>().get(Uri.parse(S.getTeamUrl+"${S.teamApiYear}/"));
    } catch (e) {
      throw NetworkException();
    }
    if (response.statusCode == 200) {
      //Process response here

      Map<String, dynamic> teamResponse = jsonDecode(response.body);

      List<TeamCategory> categories = [
        TeamCategory("Director", []),
        TeamCategory("Head of CDC", []),
        TeamCategory("Faculty Incharge", []),
        TeamCategory("Overall Co-ordinators", []),
        TeamCategory("Head Co-ordinators", []),
        TeamCategory("Managers", []),
        TeamCategory("Executives", []),
        TeamCategory("Other", []),
      ];

      Map<String, int> typeToIndex = {
        "DIR": 0,
        "HCD": 1,
        "FCT": 2,
        "OCO": 3,
        "HCO": 4,
        "MNG": 5,
        "EXC": 6,
      };

      (teamResponse["data"] as List).forEach((e) {
        TeamMember member = TeamMember.fromJson(e);
        categories[typeToIndex[member.type] ?? 7].members.add(member);
      });

      return categories;
    } else if (response.statusCode == 404) {
      throw ValidationException(response.body);
    } else {
      Log.s(
          tag: tag,
          message: "Unknown response code -> ${response.statusCode}, message ->" + response.body);
      throw UnknownException();
    }
  }
}