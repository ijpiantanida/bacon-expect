unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'bacon-expect/**/*.rb')).reverse.each do |file|
    app.spec_files << file
  end
end