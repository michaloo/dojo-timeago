window.requireConf = {
	baseUrl: '../..',
	paths: {
		require: 'modules/requirejs/require',
		cs: 'modules/require-cs/cs',
		domReady: 'modules/requirejs/domReady',
		'dojo/ready': 'modules/dojo-fix/ready',
		chai: 'node_modules/chai/chai'
	},
	packages: [
		{
			name: 'dojo',
			location: './modules/dojo'
		},
		{
			name: 'dijit',
			location: './modules/dijit'
			
		},
		{
			name: 'dojox',
			location: './modules/dojox'
		}
	]
}