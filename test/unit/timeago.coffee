define ['dojo/query', 'dojo/dom-attr', 'test/unit/helper'], (q, a, h)->

	describe 'dojo-timeago widget', ->
		it 'should replace text in abbr tag', ->
			q('abbr.timeago').forEach (el) ->
				expect(a.get(el, 'innerHTML')).is.not.equal("(you shouldn't see this)")
		
		it 'should replace text in time tag', ->
			q('time.timeago').forEach (el) ->
				expect(a.get(el, 'innerHTML')).is.not.equal("(you shouldn't see this)")
			
		it 'should not replace text in abbr tag', ->
			q('abbr.bad').forEach (el) ->
				expect(a.get(el, 'innerHTML')).is.equal('(this should be displayed)')
			
		it 'should replace dates shorter than a minute with short term text', ->
			q("abbr.testShortTerm").forEach (el) ->
				expect(a.get(el, 'innerHTML')).to.match(/^(.*)\sseconds\s(.*)$/)
				
		it 'should replace dates older than one year with term containing "year" word', ->
			q("abbr.testLongTerm").forEach (el) ->
				expect(a.get(el, 'innerHTML')).to.match(/year/)
				
		it 'should set timeago data object', ->
			tooltip = dojo.attr("testTooltip", 'timeago')
			expect(tooltip).to.be.object
			expect(tooltip.datetime).to.be.object
			
		it 'should set title to original text contents', ->
			title = dojo.attr("testTooltip", "title")
			expect(title).is.equal('February 26th')
		
		it 'should leave title alone if no text text content', ->
			title = dojo.attr("defaultTooltip", "title")
			expect(title).is.equal('2008-02-26')
	
	describe 'Parser', ->
		correctMatch = /Mon, 18 Dec 1978 17:17:00 (GMT|UTC)/
		
		it "From Z", ->
			html = dojo.attr('testParsing1', 'innerHTML')
			expect(html).to.match(correctMatch)
			
		it "From -00:00", ->
			html = dojo.attr('testParsing2', 'innerHTML')
			expect(html).to.match(correctMatch)
		
		it "From -05:00", ->
			html = dojo.attr('testParsing3', 'innerHTML')
			expect(html).to.match(correctMatch)
		
		it "From -0500", ->
			html = dojo.attr('testParsing4', 'innerHTML')
			expect(html).to.match(correctMatch)
			
		it "From +09:00", ->
			html = dojo.attr('testParsing5', 'innerHTML')
			expect(html).to.match(correctMatch)
		
		it "From +0900", ->
			html = dojo.attr('testParsing6', 'innerHTML')
			expect(html).to.match(correctMatch)
		
		it "From blank TZ", ->
			html = dojo.attr('testParsing7', 'innerHTML')
			expect(html).to.match(/Mon, 18 Dec 1978 \d\d:17:00 (GMT|UTC)/)
			
		it "From Z with milliseconds", ->
			html = dojo.attr('testParsing8', 'innerHTML')
			expect(html).to.match(correctMatch)
			
		it "From Z with microseconds", ->
			html = dojo.attr('testParsing9', 'innerHTML')
			expect(html).to.match(correctMatch)
	
	describe 'Wording', ->
	
		it "-120 min", ->
			html = dojo.attr('testWording1', 'innerHTML')
			expect(html).to.equal('about 2 hours from now')
	
		it "-60 sec", ->
			html = dojo.attr('testWording2', 'innerHTML')
			expect(html).to.equal('about a minute from now')
		
		it "-30 sec", ->
			html = dojo.attr('testWording3', 'innerHTML')
			expect(html).to.equal('30 seconds from now')
		
		it "-1 sec", ->
			html = dojo.attr('testWording4', 'innerHTML')
			expect(html).to.equal('1 second from now')
		
		it "0 sec", ->
			html = dojo.attr('testWording5', 'innerHTML')
			expect(html).to.equal('now')
		
		it "30 sec", ->
			html = dojo.attr('testWording6', 'innerHTML')
			expect(html).to.equal('30 seconds ago')
			
		it "45 sec", ->
			html = dojo.attr('testWording7', 'innerHTML')
			expect(html).to.equal('about a minute ago')
			
		it "90 sec", ->
			html = dojo.attr('testWording8', 'innerHTML')
			expect(html).to.equal('2 minutes ago')
		
		it "120 sec", ->
			html = dojo.attr('testWording9', 'innerHTML')
			expect(html).to.equal('2 minutes ago')
		
		it "45 min", ->
			html = dojo.attr('testWording10', 'innerHTML')
			expect(html).to.equal('about an hour ago')
		
		it "89 min", ->
			html = dojo.attr('testWording11', 'innerHTML')
			expect(html).to.equal('about an hour ago')
		
		it "90 min", ->
			html = dojo.attr('testWording12', 'innerHTML')
			expect(html).to.equal('about 2 hours ago')
		
		it "120 min", ->
			html = dojo.attr('testWording13', 'innerHTML')
			expect(html).to.equal('about 2 hours ago')
			
 		it "1380 min", ->
			html = dojo.attr('testWording14', 'innerHTML')
			expect(html).to.equal('about 23 hours ago')
			
		it "25 hours", ->
			html = dojo.attr('testWording15', 'innerHTML')
			expect(html).to.equal('a day ago')
		
		it "48 hours", ->
			html = dojo.attr('testWording16', 'innerHTML')
			expect(html).to.equal('2 days ago')
			
		it "696 hours", ->
			html = dojo.attr('testWording17', 'innerHTML')
			expect(html).to.equal('29 days ago')
		
		it "30 days", ->
			html = dojo.attr('testWording18', 'innerHTML')
			expect(html).to.equal('about a month ago')
		
		it "190 days", ->
			html = dojo.attr('testWording19', 'innerHTML')
			expect(html).to.equal('6 months ago')
		
		it "366 days", ->
			html = dojo.attr('testWording20', 'innerHTML')
			expect(html).to.equal('about a year ago')
		
		it "1095 days", ->
			html = dojo.attr('testWording21', 'innerHTML')
			expect(html).to.equal('3 years ago')
	
	describe 'Settings', ->
		
		it 'suffixFromNow', ->
			expect(dojo.attr('testLatinSettings1', 'innerHTML')).to.match(/omNow-fray$/)
			expect(dojo.attr('testMillisSettings1', 'innerHTML')).to.match(/from now$/)
			
		it 'suffixAgo', ->
			expect(dojo.attr('testLatinSettings6', 'innerHTML')).to.match(/ago-hay$/)
			expect(dojo.attr('testRussianSettings6', 'innerHTML')).to.match(/назад$/)
			expect(dojo.attr('testMillisSettings6', 'innerHTML')).to.match(/ago/)
			
		it 'prefixFromNow', ->
			expect(dojo.attr('testRussianSettings2', 'innerHTML')).to.match(/^через/)
			
		it 'seconds', ->
			expect(dojo.attr('testLatinSettings6', 'innerHTML')).to.match(/ess-lay an-thay a-hay inute-may ago-hay/)
			expect(dojo.attr('testRussianSettings6', 'innerHTML')).to.match(/^меньше минуты/)
			expect(dojo.attr('testMillisSettings5', 'innerHTML')).to.match(/0 milliseconds/)
		
		it 'minute', ->
			expect(dojo.attr('testLatinSettings7', 'innerHTML')).to.match(/^about-hay a-hay inute-may/)
			expect(dojo.attr('testRussianSettings7', 'innerHTML')).to.match(/^минуту/)
			expect(dojo.attr('testMillisSettings7', 'innerHTML')).to.match(/45000 milliseconds/)
		
		it 'minutes', ->
			expect(dojo.attr('testLatinSettings8', 'innerHTML')).to.match(/^2 inutes-may/)
			expect(dojo.attr('testRussianSettings8', 'innerHTML')).to.match(/^2 минуты/)
			# TODO: Test "минута" and "минут"
		
		it 'hour', ->
			expect(dojo.attr('testLatinSettings10', 'innerHTML')).to.match(/^about-hay an-hay hour-hay/)
			expect(dojo.attr('testRussianSettings10', 'innerHTML')).to.match(/^час/)
		
		it 'hours', ->
			expect(dojo.attr('testLatinSettings12', 'innerHTML')).to.match(/^about-hay 2 hours-hay/)
			expect(dojo.attr('testRussianSettings12', 'innerHTML')).to.match(/^2 часа/)
			# TODO: Test "час" and "часов"
		
		it 'day', ->
			expect(dojo.attr('testLatinSettings15', 'innerHTML')).to.match(/^a-hay ay-day/)
			expect(dojo.attr('testRussianSettings15', 'innerHTML')).to.match(/^день/)
		
		it 'days', ->
			expect(dojo.attr('testLatinSettings16', 'innerHTML')).to.match(/^2 ays-day/)
			expect(dojo.attr('testRussianSettings16', 'innerHTML')).to.match(/^2 дня/)
			expect(dojo.attr('testRussianSettings17', 'innerHTML')).to.match(/^29 дней/)
			# TODO: Test "день"
		
		it 'month', ->
			expect(dojo.attr('testLatinSettings18', 'innerHTML')).to.match(/^about-hay a-hay onth-may/)
			expect(dojo.attr('testRussianSettings18', 'innerHTML')).to.match(/^месяц/)
		
		it 'months', ->
			expect(dojo.attr('testLatinSettings19', 'innerHTML')).to.match(/^6 onths-may/)
			expect(dojo.attr('testRussianSettings19', 'innerHTML')).to.match(/^6 месяцев/)
			# TODO: Test "месяца" and "месяц"
		
		it 'year', ->
			expect(dojo.attr('testLatinSettings20', 'innerHTML')).to.match(/^about-hay a-hay ear-yay/)
			expect(dojo.attr('testRussianSettings20', 'innerHTML')).to.match(/^год/)
		
		it 'years', ->
			expect(dojo.attr('testYoungOldSettings1', 'innerHTML')).to.match(/^16 young years/)
			expect(dojo.attr('testYoungOldSettings2', 'innerHTML')).to.match(/^64 old years/)
			expect(dojo.attr('testLatinSettings21', 'innerHTML')).to.match(/^3 years-yay/)
			expect(dojo.attr('testRussianSettings21', 'innerHTML')).to.match(/^3 года/)
			# TODO: Test "год" and "лет"
		
		it 'numbers', ->
			expect(dojo.attr('testNumbersSettings1', 'innerHTML')).to.match(/^two minutes/)
			expect(dojo.attr('testNumbersSettings2', 'innerHTML')).to.match(/^nine minutes/)
			expect(dojo.attr('testNumbersSettings3', 'innerHTML')).to.match(/^10 minutes/)
		