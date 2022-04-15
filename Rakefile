require_relative './lib/embulk_dev_helpers'
require 'yaml'
require 'fileutils'

CONFIG = YAML.load_file("conf.yml")


task :hoge do
  FileUtils.mkdir_p "build/jruby"
  jruby = CONFIG["jruby"] 
  Dir.chdir "build/jruby"
  jruby.each do |v|
    next unless v =~ /\d+\.\d+\.\d+.\d+/
    url = "https://repo1.maven.org/maven2/org/jruby/jruby-complete/#{v}/jruby-complete-#{v}.jar"
    next if File.exists? "jruby-complete-#{v}.jar"
    cmd = "curl -O #{url}"
    sh cmd
  end

end

task default: :hoge
