/// @description 
token = get_string("Enter bot token","");//"";
header = map(["Content-Type","application/json"]);
var _body = map(["token",token]);
login_request = http_request("http://localhost:3000/bot/login","POST",header,json_encode(_body));

ds_map_destroy(_body);

message_request = -1;
ready = false;
uuid = "";

message_request_interval = 60;