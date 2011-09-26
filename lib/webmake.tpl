// This file was generated by modules-webmake (modules for web) project
// see: https://github.com/medikoo/modules-webmake

(function (modules) {
	var getModule, getRequire, require;
	getModule = (function (wrap) {
		return function (scope, tree, path) {
			var name, dir, exports = {}, module = { exports: exports }, fn;
			path = path.split('/');
			name = path.pop();
			while ((dir = path.shift())) {
				if (dir === '..') {
					scope = tree.pop();
				} else if (dir !== '.') {
					tree.push(scope);
					scope = scope[dir];
				}
			}
			if (scope[name + '.js']) {
				name += '.js';
			}
			if (typeof scope[name] === 'object') {
				tree.push(scope);
				scope = scope[name];
				name = 'index.js';
			}
			fn = scope[name];
			scope[name] = wrap(module);
			fn.call(exports, exports, module, getRequire(scope, tree));
			return module.exports;
		};
	})(function (cmodule) {
		return function (ignore, module) {
			module.exports = cmodule.exports;
		};
	});
	require = function (scope, tree, path) {
		var name, t = path.charAt(0);
		if (t === '/') {
			path = path.slice(1);
			scope = modules['/']; tree = [];
		} else if (t !== '.') {
			name = path.split('/', 1)[0];
			scope = modules[name]; tree = [];
			path = path.slice(name.length + 1) || scope[':mainpath:'];
		}
		return getModule(scope, tree, path);
	};
	getRequire = function (scope, tree) {
		return function (path) {
			return require(scope, [].concat(tree), path);
		};
	};
	return getRequire(modules, []);
})
