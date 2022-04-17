require_relative './lib/embulk_dev_helpers'
require 'yaml'
require 'fileutils'

CONFIG = YAML.load_file("conf.yml")
JRUBY_BASE = File.expand_path("../build/jruby",__FILE__)
EMBULK_BASE = File.expand_path("../build/embulk",__FILE__)

task :download_jruby do
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

task :embulk do
  FileUtils.mkdir_p "build/embulk"
#  directory "build/embulk"
  embulk = CONFIG["embulk"]
  Dir.chdir "build/embulk"
  embulk.each do |v|

    embulk_gem = "https://rubygems.org/downloads/embulk-#{v}-java.gem"
    unless File.exists? "embulk-#{v}-java.gem"
      sh "curl -O #{embulk_gem}"
    end

    embulk_jar = "https://github.com/embulk/embulk/releases/download/v#{v}/embulk-#{v}.jar"
    unless File.exists?  "embulk-#{v}.jar"
      sh "curl -L -O #{embulk_jar}"
    end
  end
end

task :embulk_property do
  embulk = CONFIG["embulk"]
  jruby = CONFIG["jruby"]

  FileUtils.mkdir_p "build/embulk_homes"
  Dir.chdir "build/embulk_homes"
  embulk.each do |e|
    jruby.each do |j|
      home_name = "embulk_#{e}_jruby_#{j}"
      prop_path = File.join(home_name,"embulk.properties")
      jruby_path = jruby_jar_path(j)
      FileUtils.mkdir_p home_name
      unless File.exists?(prop_path)
        File.write(prop_path,jruby_path)
      end
    end
  end
end

def embulk_gem_name(ver)
  "embulk-#{ver}-java.gem"
end

def jruby_jar_name(ver)
  "jruby-complete-#{ver}.jar"
end

def jruby_jar_path(ver)
  %q!file://! + File.join(JRUBY_BASE,jruby_jar_name(ver))
end

task default: :hoge
