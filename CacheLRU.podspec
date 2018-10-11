Pod::Spec.new do |s|
 s.name = 'CacheLRU'
 s.version = '0.0.1'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'SiSimple implementation based in the algorithm LRU'
 s.homepage = 'http://brunofernandes.me'
 s.social_media_url = 'https://twitter.com/bfernandesbfs'
 s.authors = { "Bruno Fernandes" => "bruno.fernandesbfs@gmail.com" }
 s.source = { :git => "https://github.com/bfernandesbfs/CacheLRU.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "10.0", :osx => "10.10", :tvos => "9.0", :watchos => "4.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.framework  = "Foundation"
 end
end
