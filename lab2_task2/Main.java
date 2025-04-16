import java.util.*;
import java.util.regex.*;

public class Main {
    public static int countValidEmails(List<String> emails) {
        Set<String> validEmails = new HashSet<>();
        Pattern pattern = Pattern.compile("^([a-zA-Z0-9\\.]{6,30})(\\*[a-zA-Z0-9\\.]*)?@([a-zA-Z0-9\\-\\.]+)$");
        
        for (String email : emails) {
            Matcher matcher = pattern.matcher(email);
            if (!matcher.matches()) {
                System.out.println("Неверная почта: " + email);
                continue;
            }
            
            String username = matcher.group(1);
            String domain = matcher.group(3);
            
            if (username.startsWith(".") || username.endsWith(".") || username.contains("..")) {
                System.out.println("Лишние точки в имени: " + email);
                continue;
            }
            
            if (domain.startsWith(".") || domain.endsWith(".") || domain.contains("..")) {
                System.out.println("Лишние точки в домене: " + email);
                continue;
            }
            
            String cleanUsername = username.replace(".", "");
            if (cleanUsername.contains("*")) {
                cleanUsername = cleanUsername.split("\\*")[0];
                if (cleanUsername.length() < 6) {
                    System.out.println("Имя пользователя слишком короткое: " + email);
                    continue;
                }
            }
            
            validEmails.add(cleanUsername + "@" + domain);
        }
        
        return validEmails.size();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите адреса почт через пробел: ");
        List<String> emails = Arrays.asList(scanner.nextLine().split(" "));
        System.out.println("Количество уникальных адресов: " + countValidEmails(emails));
    }
}