# 注释

Pod::Spec.new do |s|

  #组件名称
  s.name             = 'ZLSuperClass'

  #组件版本号
  s.version          = '4.1.6'

  #摘要
  s.summary          = '自定义父类'

  #详细描述。字数需要比摘要多
  s.description      = <<-DESC
  '将实用的功能抽出一个抽象类，后续继承自这些类来提高效率'
                       DESC
  #组件主页地址
  s.homepage         = 'https://github.com/ZLPublicLibrary/ZLSuperClass'

  #权限、授权协议
  s.license          = 'MIT'

  #用户名及邮箱
  s.author           = { 'Mr.Zhao' => 'itzhaolei@foxmail.com' }

  #仓库地址 SSH地址 tag指向了上面的 s.version
  s.source           = { :git => 'https://github.com/ZLPublicLibrary/ZLSuperClass.git', :tag => '4.1.6' }

  #支持的系统版本号不小于哪个版本
  s.ios.deployment_target = '9.0'
  
  #允许组件中使用静态库
  s.static_framework = true

  #头文件
  s.public_header_files = 'ZLSuperClass/Classes/ZLSuperClassHeader.h'
  s.source_files = 'ZLSuperClass/Classes/ZLSuperClassHeader.h'

  #组件文件的存放位置
  s.subspec 'Nav' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/Nav/**/*'
  end
  s.subspec 'ViewController' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/ViewController/**/*'
  end
  s.subspec 'ScrollView' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/ScrollView/**/*'
  end
  s.subspec 'TableView' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/TableView/**/*'
  end
  s.subspec 'CollectionView' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/CollectionView/**/*'
  end
  s.subspec 'TextField' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/TextField/**/*'
  end
  s.subspec 'TextView' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/TextView/**/*'
  end
  s.subspec 'Button' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/Button/**/*'
  end
  s.subspec 'Countdown' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/Countdown/**/*'
  end
  s.subspec 'LoadImageFromPath' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/LoadImageFromPath/**/*'
  end
  s.subspec 'MessageTextView' do |ss|
    ss.source_files = 'ZLSuperClass/Classes/MessageTextView/**/*'
  end
    
  #依赖的第三方库
  s.dependency 'ZLNavigationBar'

end
