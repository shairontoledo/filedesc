require 'rubygems'

SPEC = Gem::Specification.new do |s|
   s.name = "filedesc"
   s.version = "0.0.3"
   s.author = "Shairon Toledo"
   s.email = "shairon.toledo@gmail.com"
   s.homepage = "http://github.com/shairontoledo/filedesc"
   s.platform = Gem::Platform::RUBY
   s.summary = "A wrapper that works with ruby File class and unix command 'file' to get dynamic mime-type and content description"
   candidates = Dir.glob("lib/**/*")
   s.files = candidates.delete_if do |item|
      item.include?("CVS") || item.include?("rdoc")
   end
   s.require_path  = "lib"
   s.has_rdoc = false
end
