class AppConstants{



  static const String googleMapsKey = "AIzaSyATFx1nVkc5MLxwZEBBq6c8X-gDacdv1VI";

  ///API constants
  static const String baseUrl = "http://154.72.206.212:8080/api/v1/";
  // static const String baseUrl = "http://localhost:8080/api/v1/";




  ////
  ///in app data constants
  ///
  static List<String> supportString = [
    "Request Leave",
    "Training",
    "Salary Advance",
    "Allowances",
    "Anonymous Queries"
  ];


  static List<String> supportImg = [
    "assets/images/x2.jpg",
    "assets/images/x1.jpg",
    "assets/images/x2.jpg",
    "assets/images/x1.jpg",
    "assets/images/x2.jpg"
  ];


  static List<Map<String, String>> carousalItems = [
    {
      "image": "assets/images/img1.jpg",
      "link": "https://www.google.com",
      "title": "Just another shit"
    },
    {
      "image": "assets/images/img2.jpg",
      "link": "https://www.google.com",
      "title": "Just another shit two"
    },
    {
      "image": "assets/images/img3.jpg",
      "link": "https://www.google.com",
      "title": "Just another shit three"
    }
  ];
  
}