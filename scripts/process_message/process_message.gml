/// @description process_message
/// @arg message

var _msg = argument[0];

show_debug_message(_msg[? "content"]);
return map(
	["reply",string_reverse(_msg[? "content"])],
	["delete",false],
	["id",_msg[? "id"]]
);