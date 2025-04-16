def count_sequences(sequence)
    return 0 if sequence.size < 2
    
    seq_len = 1
    seq_count = 0
    
    (0...sequence.size-1).each do |i|
      if sequence[i+1] >= sequence[i]
        seq_len += 1
      elsif seq_len > 1
        seq_count += 1
        seq_len = 1
      else
        seq_len = 1
      end
    end
    
    seq_count += 1 if seq_len > 1
    seq_count
  end
  
  print "Введите последовательность чисел через пробел: "
  nums = gets.chomp.split.map(&:to_i)
  puts count_sequences(nums)