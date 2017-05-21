function Map(){
		this.arr = [];

};

	Map.prototype.put = function(_key, _value) {
		this.arr.push({
            key: _key,
            value: _value
        });
	};

	Map.prototype.get = function(key) {
		for ( var i = 0; i < this.arr.length; i++) {
			if (this.arr[i].key === key) {
				return this.arr[i].value;
			}
		}
		return null;
	};

	Map.prototype.remove = function(key) {
		var v;
		for ( var i = 0; i < this.arr.length; i++) {
			v = this.arr.pop();
			if (v.key === key) {
				continue;
			}
			this.arr.unshift(v);
		}
	};

	Map.prototype.size = function() {
		return this.arr.length;
	};

	Map.prototype.isEmpty = function() {
		return this.arr.length <= 0;
	};

	Map.prototype.toJson = function(){
		var json = "";
		for ( var i = 0; i < this.arr.length; i++) {
			var m = this.arr[i];
			json += "\""+m.key + "\":\""+m.value+"\",";
		}
		if(json.length > 0) json = json.substring(0,json.length-1);
		return $.parseJSON("{"+json+"}");
	};
