# Matomo-Middleman
[![Gem Version](https://badge.fury.io/rb/matomo-middleman.svg)](https://badge.fury.io/rb/matomo-middleman)

It's an extension for the [Middleman](http://middlemanapp.com/) static site generator
to use [Matomo](https://matomo.org/) tracking (previously known as [Piwik](https://matomo.org/blog/2018/01/piwik-is-now-matomo/)).


## Installation

Clone the repository `git clone git@github.com:wikimatze/matomo-middleman.git ~/git/matomo-middleman`.
Then add the following line to your `Gemfile`:


```ruby
gem 'matomo-middleman', path: "/home/wm/git/matomo-middleman/"
```

Run `bundle install`.


## Configuration

In your `config.rb` you can configure the settings as follow:

```ruby
activate :matomomiddleman do |p|
  p.domain = '<your-domain>'
  p.id = '<your-id>
end
```


## Helper

This plugin will add the following helper method:

```erb
<%= matomo %>
```


which will expand to


```erb
<script type="text/javascript">
  var _paq = window._paq = window._paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//<your-domain>/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', "<your-id>"]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img referrerpolicy="no-referrer-when-downgrade" src="https://<your-domain>/matomo.php?idsite=<your-id>&amp;rec=1" style="border:0" alt="" /></p></noscript>
```

