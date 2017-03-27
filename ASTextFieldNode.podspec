Pod::Spec.new do |s|
  s.name         = "ASTextFieldNode"
  s.version      = "0.2.1"
  s.summary      = "UITextField wrapper for AsyncDisplayKit."
  s.description  = <<-DESC
  UITextField wrapper for AsyncDisplayKit that can handle secure text entry.  Alternative to ASEditableTextNode.
                   DESC
  s.homepage     = "https://github.com/pocketlabs/ASTextFieldNode"
  s.license      = { :type => 'BSD', :file => "LICENSE" }
  s.platform     = :ios, "7.0"
  s.author             = { "Kyle Shank" => "kyle.shank@gmail.com" }
  s.source       = { :git => "https://github.com/pocketlabs/ASTextFieldNode.git", :tag => "#{s.version}" }
  s.source_files  = "ASTextFieldNode", "ASTextFieldNode/*.{h,mm}"
  s.dependency "AsyncDisplayKit", "~> 2.2"
end
