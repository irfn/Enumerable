require 'rake'

require 'rubygems'
require 'fileutils'


SPECS_TARGET_NAME = "Specs"
PROJECT_NAME = 'Enumerable'

CONFIGURATION = ENV["CONFIGURATION"] || "Release"

def system_or_exit(cmd, stdout = nil)
  puts "Executing #{cmd}"
  cmd += " >#{stdout}" if stdout
  system(cmd) or raise "******** Build failed ********"
end

def build_dir(effective_platform_name)
  File.join(File.dirname(__FILE__), "build", CONFIGURATION + effective_platform_name)
end

def output_file(target)
  output_dir = if ENV['IS_CI_BOX']
                 ENV['CC_BUILD_ARTIFACTS']
               else
                 build_dir = File.join(File.dirname(__FILE__), "build")
                 Dir.mkdir(build_dir) unless File.exists?(build_dir)
                 build_dir
               end

  output_file = File.join(output_dir, "#{target}.output")
  puts "Output: #{output_file}"
  output_file
end

desc 'Run Cedar Unit Tests'
task :cedar => ['build:specs'] do
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -target Specs -configuration #{CONFIGURATION} build], output_file("build_all"))
  build_dir = build_dir("")
  ENV["DYLD_FRAMEWORK_PATH"] = build_dir
  ENV["CEDAR_REPORTER_CLASS"] = "CDRColorizedReporter"
  system_or_exit(File.join(build_dir, SPECS_TARGET_NAME))
end

namespace :clean do
  desc 'clean all targets'
  task :all do
    system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -alltargets -configuration #{CONFIGURATION} clean], output_file("clean"))
  end
end

namespace :build do
  desc 'build all targets'
  task :all => ['clean:all'] do
    system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -alltargets -configuration #{CONFIGURATION} build], output_file("build_all"))
  end

  desc 'build specs'
  task :specs => ['clean:all'] do
    system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -target #{SPECS_TARGET_NAME} -configuration #{CONFIGURATION} build], output_file("build_specs"))
  end
end

task :default  => [:cedar]
