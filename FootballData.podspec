#
# Be sure to run `pod lib lint FootballData.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FootballData'
  s.version          = '0.1.0'
  s.summary          = 'OpenSource library that allows to fetch and parse data from http://www.football-data.org.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library can be useful for those who tries to fetch info about football competitions from http://www.football-data.org.
http://www.football-data.org - is an open source project which allows retrive info about events, fixtures, standings for about 20 leagues around the world.
OpenSource library that allows to fetch and parse data from http://www.football-data.org.
                       DESC

  s.homepage         = 'https://github.com/gogunskiy/FootballData'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Volodymyr Hohunskyi' => 'volodymyr.hohunskyi@gmail.com' }
  s.source           = { :git => 'https://github.com/gogunskiy/FootballData.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.source_files = 'FootballData/Classes/**/*'

end
