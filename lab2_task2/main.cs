using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class Task2 {
    static int CountValidEmails(List<string> emails) {
        var validEmails = new HashSet<string>();
        var pattern = new Regex(@"^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$");
        
        foreach (var email in emails) {
            var match = pattern.Match(email);
            if (!match.Success) {
                Console.WriteLine($"Неверная почта: {email}");
                continue;
            }
            
            var username = match.Groups[1].Value;
            var domain = match.Groups[3].Value;
            
            if (username.StartsWith(".") || username.EndsWith(".") || username.Contains("..")) {
                Console.WriteLine($"Лишние точки в имени: {email}");
                continue;
            }
            
            if (domain.StartsWith(".") || domain.EndsWith(".") || domain.Contains("..")) {
                Console.WriteLine($"Лишние точки в домене: {email}");
                continue;
            }
            
            var cleanUsername = username.Replace(".", "");
            if (cleanUsername.Contains("*")) {
                cleanUsername = cleanUsername.Split('*')[0];
                if (cleanUsername.Length < 6) {
                    Console.WriteLine($"Имя пользователя слишком короткое: {email}");
                    continue;
                }
            }
            
            validEmails.Add($"{cleanUsername}@{domain}");
        }
        
        return validEmails.Count;
    }

    static void Main() {
        Console.Write("Введите адреса почт через пробел: ");
        var emails = new List<string>(Console.ReadLine().Split(' '));
        Console.WriteLine($"Количество уникальных адресов: {CountValidEmails(emails)}");
    }
}