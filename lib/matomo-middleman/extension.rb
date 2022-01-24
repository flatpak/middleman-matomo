# Require core library
require 'middleman-core'

# Extension namespace
class MatomoExtension < ::Middleman::Extension
  option :domain, 'localhost.com', 'An example url for motomo'
  option :id, 1, 'The id for matomo'

  def after_configuration
    app.config[:matomo_domain] = options.domain
    app.config[:matomo_id] = options.id
  end

  helpers do
    def matomo
      <<END
<script>
  var _paq = window._paq = window._paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//#{config[:matomo_domain]}/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', "#{config[:matomo_id]}"]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
    <noscript><p><img referrerpolicy="no-referrer-when-downgrade" src="https://#{config[:matomo_domain]}/matomo.php?idsite=#{config[:matomo_id]}&amp;rec=1" style="border:0" alt="" /></p></noscript>
END
    end
  end
end
