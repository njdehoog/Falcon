Pod::Spec.new do |s|
  s.name             = "Falcon"
  s.version          = "0.1.0"
  s.summary          = "Objective-C API wrapper for Star Wars API (swapi.co)"
  s.homepage         = "https://github.com/njdehoog/Falcon"
  s.license          = 'MIT'
  s.author           = { "Niels de Hoog" => "njdehoog@gmail.com" }
  s.source           = { :git => "https://github.com/njdehoog/Falcon.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nielsjonathan'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.dependency 'Mantle', '~> 1.5'
  s.dependency 'ISO8601DateFormatter', '~> 0.7'
end
