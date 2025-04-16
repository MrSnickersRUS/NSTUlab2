package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strings"
)

func countValidEmails(emails []string) int {
	validEmails := make(map[string]bool)
	pattern := regexp.MustCompile(`^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$`)
	
	for _, email := range emails {
		matches := pattern.FindStringSubmatch(email)
		if matches == nil {
			fmt.Printf("Неверная почта: %s\n", email)
			continue
		}
		
		username := matches[1]
		domain := matches[3]
		
		if strings.HasPrefix(username, ".") || strings.HasSuffix(username, ".") || strings.Contains(username, "..") {
			fmt.Printf("Лишние точки в имени: %s\n", email)
			continue
		}
		
		if strings.HasPrefix(domain, ".") || strings.HasSuffix(domain, ".") || strings.Contains(domain, "..") {
			fmt.Printf("Лишние точки в домене: %s\n", email)
			continue
		}
		
		cleanUsername := strings.ReplaceAll(username, ".", "")
		if strings.Contains(cleanUsername, "*") {
			parts := strings.Split(cleanUsername, "*")
			cleanUsername = parts[0]
			if len(cleanUsername) < 6 {
				fmt.Printf("Имя пользователя слишком короткое: %s\n", email)
				continue
			}
		}
		
		validEmails[cleanUsername+"@"+domain] = true
	}
	
	return len(validEmails)
}

func main() {
	fmt.Print("Введите адреса почт через пробел: ")
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	input := scanner.Text()
	emails := strings.Fields(input)
	fmt.Printf("Количество уникальных адресов: %d\n", countValidEmails(emails))
}