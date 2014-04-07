require "bundler/gem_tasks"

def abort_with_error(msg)
  abort "\n\e[31mError:\e[0m #{msg}"
end

task :test do
  $LOAD_PATH.unshift('lib', 'test')
  Dir.glob('./test/**/*_test.rb') { |f| require f }
end

task :default => :test

task :console do
  require 'pry'
  require './lib/frasier'
  ARGV.clear
  Pry.start Frasier
end


task :checksum do
  require 'digest/sha2'
  abort_with_error "Set 'GEM' with name-0.x.x to calculate checksum" unless ENV["GEM"]
  name = ENV["GEM"]
  built_gem_path = 'pkg/frasier-0.5.1.gem'
  checksum = Digest::SHA512.new.hexdigest(File.read(built_gem_path))
  checksum_path = 'checksum/frasier-0.5.1.gem.sha512'
  File.open(checksum_path, 'w' ) {|f| f.write(checksum) }
  puts "Wrote checksum to #{checksum_path}"
end
