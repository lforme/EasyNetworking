

Pod::Spec.new do |s|


  s.name         = "EasyNetworking"
  s.version      = "0.0.1"
  s.summary      = "base on AFNetworking and ReactiveCocoa"

  s.description  = <<-DESC
    一个关于AFNetworking的类别
                   DESC

  s.homepage     = "https://github.com/lforme/EasyNetworking.git"




  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }




  s.author             = { "王宏洋" => "lforme@163.com" }
  # Or just: s.author    = "王宏洋"
  # s.authors            = { "王宏洋" => "lforme@163.com" }
  # s.social_media_url   = "http://twitter.com/王宏洋"


  # s.platform     = :ios
    s.platform     = :ios, "9.3"




  s.source       = { :git => "https://github.com/lforme/EasyNetworking.git", :tag => "#{s.version}" }


  s.source_files  = "EasyNetworking/NetworkingTool/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"



  # s.framework  = "SomeFramework"
    s.frameworks = "AFNetworking", "ReactiveObjC"




    s.requires_arc = true
    s.dependency "AFNetworking"
    s.dependency "ReactiveObjC"

end
