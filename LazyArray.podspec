Pod::Spec.new do |s|
  s.name             = "LazyArray"
  s.version          = "0.0.1"
  s.summary          = "LazyArray"
  s.description      = "O(1) array operations"
  s.homepage         = "https://github.com/lucas34/LazyArray"
  s.license          = 'MIT'
  s.author           = { "Lucas Nelaupe" => "lucas.nelaupe@gmail.com" }
  s.source           = { :git => "https://github.com/lucas34/LazyArray.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/**.swift'
  
end