# dojo-timeago: ported jQuery plugin

<a href="https://github.com/rmm5t/jquery-timeago">Timeago</a> is a jQuery plugin that makes it easy to support automatically updating
fuzzy timestamps (e.g. "4 minutes ago" or "about 1 day ago") from ISO 8601
formatted dates and times embedded in your HTML (à la microformats).

Dojo-Timeago is an attempt to rewrite original Timeago functionality to dojo widgets structure.

## Usage

First, load Dojo and the plugin:

```html
<script src="dojo/dojo.js" type="text/javascript"></script>
<script type="text/javascript">
    dojo.require('timeago.Timeago');
</script>
```

Now, let's attach it to your timestamps in programmatic manner:

```html
<pre>
dojo.ready(function() {
    dojo.query('abbr.timeago').forEach(function(el){
        new timeago.Timeago({}, el);
    });
});
</pre>
```

This will turn all abbr elements with a class of timeago and an ISO 8601 timestamp in the title:

```html
<abbr class="timeago" title="2008-07-17T09:24:17Z">July 17, 2008</abbr>
```

into something like this:

```html
<abbr class="timeago" title="July 17, 2008">about 1 day ago</abbr>
```

As time passes, the timestamps will automatically update.

**Declarative approach**
You can also use dojo markup-based widget declaration by adding data-dojo-type attribute:

```html
<abbr class="timeago" data-dojo-type="timeago.Timeago" title="2008-02-27T00:23:00Z">July 17, 2008</abbr>
```

**For more usage and examples**: [http://timeago.yarp.com/](http://timeago.yarp.com/)


## Author

[Michał Rączka] (https://github.com/michaloo) - ported to dojo

[Ryan McGeary](http://ryan.mcgeary.org) ([@rmm5t](http://twitter.com/rmm5t))

## Other

[MIT License](http://www.opensource.org/licenses/mit-license.php)

Copyright (c) 2008-2010, Ryan McGeary (ryanonjavascript -[at]- mcgeary [*dot*] org)
