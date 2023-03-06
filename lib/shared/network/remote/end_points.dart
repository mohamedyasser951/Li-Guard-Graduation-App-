// ignore_for_file: non_constant_identifier_names

String? Email;
String? Id;

String mainUrl = "http://192.168.1.3:80/ASPS/Dahboard/API/";
//String mainUrl = "http://192.168.1.3:81/Dahboard/API";

String USERLOGIN = "${mainUrl}users/login.php";
String USERRegister = "${mainUrl}users/register.php";
String GETTASKS = "${mainUrl}tasks/SelTask.php?email=$Email";
String GETPOSTS = "${mainUrl}posts/posts.php";
String RESETPASSWORD = "${mainUrl}users/resetPassword.php?id=$Id";
String GETUSERDATA = "${mainUrl}users/SelUser.php?id=$Id";
String UPDATEUSERDATA = "${mainUrl}users/update.php?id=$Id";
String UPLOADIMAGE = "${mainUrl}images/add.php";
