// ignore_for_file: non_constant_identifier_names

String Email = "ahmed@mailinator.com";
String Id = "";

String mainUrl = "http://192.168.1.3:80/ASPS/Dahboard/API/";

String USERLOGIN = "${mainUrl}users/login.php";
String GETTASKS = "${mainUrl}tasks/SelTask.php?email=$Email";
String GETPOSTS = "${mainUrl}posts/posts.php";
String RESETPASSWORD = "${mainUrl}users/resetPassword.php?id=$Id";
