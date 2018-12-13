task default: %w[fight]

task :fight do
  sh "ruby tests/fight_test.rb --name test_random_fight"
end

task :vamp do
  sh "ruby tests/fight_test.rb --name test_vampire_vs_random"
end

task :test do
  sh "ruby tests/mob_test.rb"
  sh "ruby tests/arena_test.rb"
end

