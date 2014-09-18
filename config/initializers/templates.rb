Rails.application.assets.register_engine('.haml', Tilt::HamlTemplate)
Rails.application.assets.register_mime_type 'text/html', '.html'
