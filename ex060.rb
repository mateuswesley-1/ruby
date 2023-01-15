# capturing block
def call_block
  yield
end


my_proc = Proc.new { puts "vtnc trankilo" }

call_block(&my_proc)
