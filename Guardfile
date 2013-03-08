# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :growl, :sticky => true, :priority => 0
#notification :growl_notify, :sticky => false, :priority => 0



guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
#   watch(%r{app/views/.+\.(erb|haml|slim)}) { |m| Growl.notify m[0],  :icon => :jpeg, :title => 'File Changed'}
end

# guard :test do
#   watch(%r{^lib/(.+)\.rb$})     { |m| "test/#{m[1]}_test.rb" }
#   watch(%r{^test/.+_test\.rb$})
#   watch('test/test_helper.rb')  { "test" }

#   # Rails example
#   watch(%r{^app/models/(.+)\.rb$})                   { |m| "test/unit/#{m[1]}_test.rb" }
#   watch(%r{^app/controllers/(.+)\.rb$})              { |m| "test/functional/#{m[1]}_test.rb" }
#   watch(%r{^app/views/.+\.rb$})                      { "test/integration" }
#   watch('app/controllers/application_controller.rb') { ["test/functional", "test/integration"] }
# end

guard 'reloader' do
  watch(%r{^app/models/(.+)\.rb$})
  watch(%r{^test/unit/(.+)\.rb$})
  watch(%r{^app/controllers/(.+)\.rb$})
  watch(%r{^test/functional/(.+)\.rb$})
end
