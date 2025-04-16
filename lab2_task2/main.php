<?php

function countValidEmails(array $emails): int {
    $validEmails = [];
    $pattern = '/^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$/';
    
    foreach ($emails as $email) {
        if (!preg_match($pattern, $email, $matches)) {
            echo "Неверная почта: $email\n";
            continue;
        }
        
        $username = $matches[1];
        $domain = $matches[3];
        
        // Замена str_starts_with() для PHP < 8.0
        if (substr($username, 0, 1) === '.' || substr($username, -1) === '.' || strpos($username, '..') !== false) {
            echo "Лишние точки в имени: $email\n";
            continue;
        }
        
        if (substr($domain, 0, 1) === '.' || substr($domain, -1) === '.' || strpos($domain, '..') !== false) {
            echo "Лишние точки в домене: $email\n";
            continue;
        }
        
        $cleanUsername = str_replace('.', '', $username);
        if (strpos($cleanUsername, '*') !== false) {
            $parts = explode('*', $cleanUsername);
            $cleanUsername = $parts[0];
            if (strlen($cleanUsername) < 6) {
                echo "Имя пользователя слишком короткое: $email\n";
                continue;
            }
        }
        
        $validEmails["$cleanUsername@$domain"] = true;
    }
    
    return count($validEmails);
}

echo "Введите адреса почт через пробел: ";
$input = trim(fgets(STDIN));
$emails = array_filter(explode(' ', $input), function($email) {
    return !empty($email);
});
echo "Количество уникальных адресов: " . countValidEmails($emails) . "\n";
?>