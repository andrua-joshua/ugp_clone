import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ugp_clone/models/lost_and_found.dart';
import 'package:ugp_clone/models/missing_person.dart';
import 'package:ugp_clone/models/station.dart';
import 'package:ugp_clone/utils/app_constants.dart';

class ApiRepository {


  Future<List<LostAndFound>> getAllLostAndFound()async{
    final uri = Uri.parse("${AppConstants.baseUrl}lostAndFound/getAll");

    try{

      final response = await http.get(
        uri
      );


      if(response.statusCode == 200){
        print("data fetched succ: ${response.body}");
        final data = jsonDecode(response.body) as List;

        return data.map((element)=> LostAndFound.fromJson(element)).toList();
      }else{
        print("there wasnt  any data printed by the server");
        return [];
      }

    }catch(err){
      print("error fetching data:   $err");
      rethrow;
    }

  }


  Future<List<MissingPerson>> getAllMissingPerson()async{
    final uri = Uri.parse("${AppConstants.baseUrl}missingPerson/getAll");

    try{

      final response = await http.get(
        uri
      );


      if(response.statusCode == 200){
        final data = jsonDecode(response.body) as List;

        return data.map((element)=> MissingPerson.fromJson(element)).toList();
      }else{
        print("there wasnt  any data printed by the server");
        return [];
      }

    }catch(err){
      print("error fetching data:  $err");
      rethrow;
    }

  }



  Future<List<Station>> getAllStatations()async{
    final uri = Uri.parse("${AppConstants.baseUrl}station/getAll");

    try{

      final response = await http.get(
        uri
      );


      if(response.statusCode == 200){
        final data = jsonDecode(response.body) as List;

        return data.map((element)=> Station.fromJson(element)).toList();
      }else{
        print("there wasnt  any data printed by the server");
        return [];
      }

    }catch(err){
      print("error fetching data:   $err");
      rethrow;
    }

  }



  /**
   * 
   * private String category;
    private String details;
    private String type;
    private String firstname;
    private String lastname;
    private String phone;
    private double longitude;
    private double latitude;
   */

  Future<bool> makeReport({
    required String category,
    required String details,
    required String type,
    required String lastname,
    required String firstname,
    required String phone,
    double? lng,
    double? lat,
    XFile? attachment
  })async{
    final uri = Uri.parse("${AppConstants.baseUrl}report/addReport");

    try{

      final req =  http.MultipartRequest("post",uri);

      req.fields['category'] = category;
      req.fields['details'] = details;
      req.fields['type'] = type;
      req.fields['firstname'] = firstname;
      req.fields['lastname'] = lastname;
      req.fields['phone'] = phone;
      req.fields['longitude'] = "${lng??0.0}";
      req.fields['latitude'] = "${lat??0.0}";
      if(attachment!=null){
          final image = await http.MultipartFile.fromPath(
            "attachment", attachment.path);

          req.files.add(image);
        
        }

      
      // print(":::::: the file being sent: ${req.files.first.filename}");

      final res = await req.send();

      if(res.statusCode == 200){
        return true;
      }
      else{
        print(">>>>>>>>>>failed to send report:   ${res.stream}");
        return false;
      }


      

    }catch(err){
      print("error fetching data:   $err");
      rethrow;
    }

  }



}