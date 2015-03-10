Monologue.config do |config|


  config.site_name = "Le Cleaner du Hipster - BLOG"
  config.site_subtitle = "On va vous faire aimer le pressing : préparez-vous à un service de qualité."
  config.site_url = "https://www.hipcleaner.com"

  config.meta_description = "Le blog du pressing à domicile. La qualité du service "
  config.meta_keyword = "pressing, domicile, pratique"

  config.admin_force_ssl = false
  config.posts_per_page = 10

  config.disqus_shortname = "my_disqus_shortname"

  # LOCALE
  config.twitter_locale = "fr" # "fr"
  config.facebook_like_locale = "fr_CA" # "fr_CA"
  # config.google_plusone_locale = "en"

  # config.layout               = "layouts/application"

  # ANALYTICS
  # config.gauge_analytics_site_id = "YOUR COGE FROM GAUG.ES"
  # config.google_analytics_id = "YOUR GA CODE"

  config.sidebar = ["latest_posts", "latest_tweets", "categories", "tag_cloud"]


  #SOCIAL
  config.twitter_username = "hipcleaner"
  config.facebook_url = "https://www.facebook.com/hipcleaner"
  config.facebook_logo = 'logo.png'
  # config.google_plus_account_url = "https://plus.google.com/u/1/.../posts"
  # config.linkedin_url = "http://www.linkedin.com/in/myhandle"
  # config.github_username = "myhandle"
  config.show_rss_icon = true
end
