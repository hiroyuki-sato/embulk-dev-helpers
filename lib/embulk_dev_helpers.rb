require_relative 'embulk_dev_helpers/cli'
module EmbulkDevHelpers
  BASE_DIR = File.expand_path("../../build",__FILE__)
  JRUBY_BASE = File.join(BASE_DIR,"jruby")
  EMBULK_BASE = File.join(BASE_DIR,"embulk")
 
  def jruby_path(ver)
    File.join(JRUBY_BASE,jruby_jar_name(ver))
  end

  def embulk_path(ver)
    File.join(EMBULK_BASE,embulk_jar_name(ver))
  end

  def embulk_home_path(jver,ever)
    File.join(BASE_DIR,embulk_home_name(jver,ever))

  end

  private
  def embulk_gem_name(ver)
    "embulk-#{ver}-jar.gem"
  end

  def embulk_jar_name(ver)
    "embulk-#{ver}.jar"
  end

  def jruby_jar_name(ver)
    "jruby-complete-#{ver}.jar"
  end

  def embulk_home_name(jruby,embulk)
    "embulk_#{embulk}_jruby_#{jruby}"
  end
end
