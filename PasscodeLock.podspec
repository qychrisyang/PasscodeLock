Pod::Spec.new do |s|
  s.name = 'PasscodeLock'
  s.version = '1.0.0'
  s.summary = 'Application security'
  s.authors = 'MYZ'
  s.license = 'Apache-2.0'
  s.homepage = "https://github.com/qychrisyang/PasscodeLock"
  s.source = { :git => "https://github.com/qychrisyang/PasscodeLock.git" }
  s.platform = :ios, "8.0"
  s.source_files = 'PasscodeLockView/**/*.{h,m}'
end
