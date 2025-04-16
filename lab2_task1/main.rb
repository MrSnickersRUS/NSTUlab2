def check_board_bounds(n, m, steps)
    (1..n).each do |start_x|
      (1..m).each do |start_y|
        x, y = start_x, start_y
        valid = true
        steps.each_char do |step|
          case step
          when 'L' then x -= 1
          when 'R' then x += 1
          when 'D' then y -= 1
          when 'U' then y += 1
          else return "Ошибка в ходах"
          end
          if x < 1 || x > n || y < 1 || y > m
            valid = false
            break
          end
        end
        return "(#{start_x},#{start_y})" if valid
      end
    end
    "No"
  end
  
  n = gets.to_i
  m = gets.to_i
  steps = gets.chomp
  puts check_board_bounds(n, m, steps)