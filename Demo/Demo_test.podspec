# MARK: converted automatically by spec.py. @hgy

Pod::Spec.new do |s|
	s.name = 'Demo'
	s.version = '1'
	s.description = '我只是一个测试的，主要是想要 s.dependency'
	s.license = 'MIT'
	s.summary = 'Seeyou'
	s.homepage = 'https://github.com/meiyoudev/IMYPublic'
	s.authors = { 'suliangjin' => 'suliangjin@xiaoyouzi.com' }
	s.source = { :git => 'git@github.com:su350380433/cocaopods-imy-bin.git', :branch => 'dev' }
        s.requires_arc = true
        s.ios.deployment_target = '9.0'
        s.source_files = 'Source/**/*.{h,m,c}'
        s.public_header_files = 'Source/**/*.h'


        s.dependency 'YYModel'
        s.dependency 'YYCache'
        s.dependency 'FMDB'
        s.dependency 'LKDBHelper'




end
