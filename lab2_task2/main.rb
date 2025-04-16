def count_valid_emails(emails)
    valid_emails = Set.new
    pattern = /^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$/
    
    emails.each do |email|
      match = pattern.match(email)
      unless match
        puts "Неверная почта: #{email}"
        next
      end
      
      username = match[1]
      domain = match[3]
      
      if username.start_with?('.') || username.end_with?('.') || username.include?('..')
        puts "Лишние точки в имени: #{email}"
        next
      end
      
      if domain.start_with?('.') || domain.end_with?('.') || domain.include?('..')
        puts "Лишние точки в домене: #{email}"
        next
      end
      
      clean_username = username.gsub('.', '')
      if clean_username.include?('*')
        clean_username = clean_username.split('*')[0]
        if clean_username.length < 6
          puts "Имя пользователя слишком короткое: #{email}"
          next
        end
      end
      
      valid_emails.add("#{clean_username}@#{domain}")
    end
    
    valid_emails.size
  end
  
  print "Введите адреса почт через пробел: "
  emails = gets.chomp.split
  puts "Количество уникальных адресов: #{count_valid_emails(emails)}"