require 'tempfile'
 
def say(cmd, voice='Fred')
  temp_file = Tempfile.new('sayfile')
  tf = File.new(temp_file.path, "w+")
  tf.puts(cmd)
  tf.close
  `cat #{temp_file.path} | /usr/bin/say -v #{voice}`
  temp_file.unlink
end
 
def ding_dong
  say("Ding dong!", 'Bells')
end
 
def echo_date
  t = Time.now
  say(t.strftime("The time is now %I %p"))
end
 
ding_dong
sleep 1
echo_date