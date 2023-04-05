// ignore_for_file: non_constant_identifier_names

String? EMAIL ;
String? Id;

String mainUrl = "http://192.168.1.3:80/ASPS/Dahboard/API/";
//String mainUrl = "http://192.168.1.3:81/Dahboard/API";

String USERLOGIN = "${mainUrl}users/login.php";
String USERRegister = "${mainUrl}users/register.php";
String GETTASKS = "${mainUrl}tasks/SelTask.php?email=$EMAIL";
String GETPOSTS = "${mainUrl}posts/posts.php";
String GETMESSAGES = "${mainUrl}messages/SelMes.php?email=eslammohmoud@gmail.com";
String RESETPASSWORD = "${mainUrl}users/resetPassword.php?id=$Id";
String GETUSERDATA = "${mainUrl}users/SelUser.php?id=$Id";
String UPDATEUSERDATA = "${mainUrl}users/update.php?id=$Id";
String UPLOADIMAGE = "${mainUrl}images/add.php";

//Visitor
String VISITOR_REGISTER = "${mainUrl}vistors/register.php";
String VISITORINVITECODE = "${mainUrl}vistors/invitCode.php?invitCode=24798939";


