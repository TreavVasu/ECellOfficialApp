import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecellapp/models/leader_board.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ecellapp/core/res/errors.dart';
import 'package:ecellapp/core/res/strings.dart';
import 'package:ecellapp/core/utils/injection.dart';
import 'package:ecellapp/core/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/global_state.dart';
import '../../../models/user.dart';
import '../../login/cubit/login_cubit.dart';
import '../../login/login.dart';
import '../../login/login_repository.dart';

@immutable
abstract class LeaderRepository {
  /// All subfunctions are final No arguments required returns json
  Future<List<Data>> getAllleaders();
}

// class FakeLeaderRepository extends LeaderRepository{
//   Future<List<Data>> getAllleaders() async {
//     // network delay
//     await Future.delayed(Duration(seconds: 1));
//     if (Random().nextBool()) {
//       throw NetworkException();
//     } else {
//       var response = {
//         "message": "Leader Board Fetched successfully.",
//         "data": [
//           {

//             "username": "Kick Buttowski",
//             "email":
//                 "kickbuttowski@gmail.com",
//             "bquiz_score": 3000

//           },
//           {
//             "username": "Elon Musk",
//             "email":
//                 "elonmusk@gmail.com",
//             "bquiz_score": 2990
//           },
//           {

//             "username": "Jeff Bezos",
//             "email":
//                 "jeffbezos@gmail.com",
//             "bquiz_score": 2700

//           },
//           {
//             "username": "Neeraj",
//             "email":
//                 "neeraj123@gmail.com",
//             "bquiz_score": 2000
//           },
//         ]
//       };
//       return (response["data"] as List).map((e) => Data.fromJson(e)).toList();

// }

// }
// }

class APILeaderRepository extends LeaderRepository {
  final String classTag = "APIgetleaderRepository";
  final List<Data> leaderList = List.empty(growable: true);

  APILeaderRepository({required this.label});
  final String label;
  String? token;
  // final User user;
  @override
  Future<List<Data>> getAllleaders() async {
    final db = FirebaseFirestore.instance;

    try {
      final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
    String? token = sharedPreferences.getString(S.tokenKeySharedPreferences);
    print("stoken:$token");
    CollectionReference leaderBoard =
        FirebaseFirestore.instance.collection("LEADERBOARD");
     
    DocumentSnapshot v=await leaderBoard
        .doc(label)
        .collection("leaders").doc(token)
        .get();
      
    if(v.exists){
      print(true);
    }
    else{
      print(false);
    }
    print("hello");
    // print("ans:$ans");
        // print("x:$x");
        // print(token==x);
      // await db.collection('LEADERBOARD').doc(label).get().then((DocumentSnapshot doc)
      await db
          .collection("LEADERBOARD")
          .doc(label)
          .collection('leaders')
          .orderBy("score", descending: true)
          .get()
          .then(
        (value) {
          value.docs.forEach((element) {
            leaderList.add(Data.fromFirestore(element));
          });
          value.docs.forEach((element) {
            print(element.get('username'));
          });

          print(leaderList[0].username);
        },
        onError: (e) => print("Error getting document: $e"),
      );
      return leaderList;
    } on FirebaseException catch (e) {
      print(e);
      throw UnknownException();
    } catch (error) {
      print(error);
      throw UnknownException();
    }
  }

  Future<void> uploadScore(int score, User user) async {
    String name = "${user.firstName!} ${user.lastName}";

    // APILoginRepository _loginRepository = new APILoginRepository();
    // String email = LoginScreen.emailController.text;
    // String pass = LoginScreen.passwordController.text;
    final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
    String? token = sharedPreferences.getString(S.tokenKeySharedPreferences);
    print("stoken:$token");
    CollectionReference leaderBoard =
        FirebaseFirestore.instance.collection("LEADERBOARD");
    var x = await leaderBoard
        .doc(label)
        .collection("leaders")
        .doc(token).id;
        print("x:$x");
    await leaderBoard
        .doc(label)
        .collection("leaders")
        .doc(token)
        .set({"username": name, "email": user.email, "score": score});
  }
  Future<bool> validate() async {
    final SharedPreferences sharedPreferences = sl.get<SharedPreferences>();
    String? token = sharedPreferences.getString(S.tokenKeySharedPreferences);
    
    CollectionReference leaderBoard =
        FirebaseFirestore.instance.collection("LEADERBOARD");
     
    DocumentSnapshot v=await leaderBoard
        .doc(label)
        .collection("leaders").doc(token)
        .get();
      
    if(v.exists){
      return false;
    }
    else{
      return true;
    }
    
    
  }
}
