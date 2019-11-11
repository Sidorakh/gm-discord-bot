/// @description 
if (async_load[? "status"] == 1) {
	return;
}
if (async_load[? "id"] == login_request) {
	var _map = json_decode(async_load[? "result"]);
	if (_map == -1) {
		// soemthing died
		return;
	}
	
	if (_map[? "status"] == "ready") {
		ready = true;
		uuid = _map[? "uuid"];
		alarm[0] = 1;
		alarm[1] = room_speed*10;
		header[? "Authorization"] = uuid;
	} else {
		show_error("Could not establish session with Discord.js",false);
	}
	ds_map_destroy(_map);
	
}

if (async_load[? "id"] == message_request) {
	show_debug_message(async_load[? "result"]);
	var _map = json_decode(async_load[? "result"]);
	if (_map == -1) {
		// soemthing died
		return;
	}
	var _msg_list = _map[? "messages"];
	if (_map[? "num"]) {
		for (var i=0;i<_map[? "num"];i++) {
			var _ret = process_message(_msg_list[| i]);
			show_debug_message(json_encode(_ret));
			http_request("http://localhost:3000/bot/msg/respond","POST",header,json_encode(_ret));
			ds_map_destroy(_ret);
		}
	}
	alarm[0] = message_request_interval;
	
}