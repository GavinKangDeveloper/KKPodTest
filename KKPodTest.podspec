
Pod::Spec.new do |s|
  s.name             = 'KKPodTest'
  s.version          = '0.0.1'
  s.summary          = 'A test of Pod.'
  s.description      = <<-DESC
  主要是为了测试创建 pod 库
                       DESC
  s.homepage         = 'https://github.com/GavinKangDeveloper/KKPodTest'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KangKang' => '776362265@qq.com.com' }
  s.source           = { :git => 'https://github.com/GavinKangDeveloper/KKPodTest.git', :tag => s.version.to_s }
  s.social_media_url = 'https://juejin.im/user/1433418895468397/posts'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
end
