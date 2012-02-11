define(['dojo/ready', 'dojo/query', 'timeago/Timeago', 'dojo/parser',
	'timeago/nls/ru/Timeago'], function(r, q, t, p, ru){
	
	var test;
	
	var millisSubstitution = function(number, millis) { return millis + " milliseconds"; };
	
	var toWords = function(el) {
		var string = test.inWords(parseInt(dojo.attr(el, 'title'), 10) * 1000);
		dojo.attr(el, 'innerHTML', string);
	}
	
	var helper = {
		latin: {
			suffixAgo: "ago-hay",
			suffixFromNow: "omNow-fray",
			now: "hey-now",
			second: "ess-lay",
			seconds: "ess-lay an-thay a-hay inute-may",
			minute: "about-hay a-hay inute-may",
			minutes: "%d inutes-may",
			hour: "about-hay an-hay hour-hay",
			hours: "about-hay %d hours-hay",
			day: "a-hay ay-day",
			days: "%d ays-day",
			month: "about-hay a-hay onth-may",
			months: "%d onths-may",
			year: "about-hay a-hay ear-yay",
			years: "%d years-yay"
		},
		
		millis: {
			suffixAgo: "ago",
			suffixFromNow: "from now",
			now: millisSubstitution(0, 0),
			second: millisSubstitution,
			seconds: millisSubstitution,
			minute: millisSubstitution,
			minutes: millisSubstitution,
			hour: millisSubstitution,
			hours: millisSubstitution,
			day: millisSubstitution,
			days: millisSubstitution,
			month: millisSubstitution,
			months: millisSubstitution,
			year: millisSubstitution,
			years: millisSubstitution
		},
		
		numbers: ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"],
		
		years: function(value) { return (value < 21) ? "%d young years" : "%d old years"; },
		
		zeropad: function (num) {
		  return ((num < 10) ? '0' : '') + num;
		},
		iso8601: function (date) {
		  return date.getUTCFullYear()
		    + "-" + this.zeropad(date.getUTCMonth()+1)
		    + "-" + this.zeropad(date.getUTCDate())
		    + "T" + this.zeropad(date.getUTCHours())
		    + ":" + this.zeropad(date.getUTCMinutes())
		    + ":" + this.zeropad(date.getUTCSeconds()) + "Z";
		},
		
		run: function() {
			dojo.attr(q('abbr.loaded')[0], "title", this.iso8601(new Date()));
			dojo.attr(q('abbr.modified')[0], "title", this.iso8601(new Date(document.lastModified)));
			
			p.parse();
			
			q('abbr.timeago:not([data-dojo-type="timeago/Timeago"])').forEach(function(el){
				var to = new t({}, el);
			});
			
			q('time').forEach(function(el){
				var to = new t({}, el);
			});
			
			test = new t();
			
			q('abbr.todate').forEach(function(el) {
				var date = test.parse(dojo.attr(el, 'title'));
				dojo.attr(el, 'innerHTML', date.toUTCString());
			});
			
			test.settings.allowFuture = true;
			
			q("abbr.towords").forEach(toWords);
			
			test.strings.numbers = this.numbers;
			q("abbr.tonumbers").forEach(toWords);
			test.strings.numbers = [];      
			
			test.strings.years = this.years;
			q("abbr.toyoungold").forEach(toWords);
			
			test.strings = this.latin;
			q("abbr.tolatin").forEach(toWords);
			
			test.strings = ru;
			q("abbr.torussian").forEach(toWords);
			
			test.strings = this.millis;
			q("abbr.tomillis").forEach(toWords);
		}
	}
	helper.run();
	return helper;
});