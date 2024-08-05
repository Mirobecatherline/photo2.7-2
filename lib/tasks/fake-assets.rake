namespace :assets do
        desc "Should just print stuff and move on. Fake!"
        task :precompile do 
            puts "This is a Fake assets:precompile"
        end
end

# Rake::Task["assets:precompile"].clear
#    namespace :assets do
#      task 'precompile' do
#      puts "Not pre-compiling assets..."
#    end