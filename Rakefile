desc 'This task will run tests in parallel on 3 Android devices'
task :run_android_parallel do
  t1 = Thread.new { sh "UDID=29a54bc414047ece cucumber features/mobile_login.feature" }
  t2 = Thread.new { sh "UDID=emulator-5554 cucumber features/mobile_login.feature" }
  t3 = Thread.new { sh "UDID=emulator-5556 cucumber features/mobile_login.feature" }

  t1.join
  t2.join
  t3.join
end

desc 'This task will run tests on 3 Android devices one by one'
task :run_android_sequence do
  started_at = Time.now
  puts "[35m Started At #{started_at} [0m"

  sh "UDID=29a54bc414047ece cucumber features/mobile_login.feature"
  sh "UDID=emulator-5554 cucumber features/mobile_login.feature"
  sh "UDID=emulator-5556 cucumber features/mobile_login.feature"

  finished_at = Time.now
  run_time = Time.at(finished_at - started_at).utc.strftime('%H:%M:%S')
  puts "[35m End At #{finished_at} [0m"
  puts "[35m Run took #{run_time} [0m"
end

