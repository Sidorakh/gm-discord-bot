var _map = ds_map_create();
for (var i=0;i<argument_count;i++) {
	var _a = argument[i];
	_map[? _a[0]] = _a[1];
}

return _map;