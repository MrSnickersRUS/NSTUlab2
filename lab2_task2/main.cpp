#include <iostream>
#include <unordered_set>
#include <string>
#include <regex>
#include <algorithm>

using namespace std;

int countValidEmails(const vector<string>& emails) {
    unordered_set<string> valid_emails;
    regex email_pattern(R"(^([a-zA-Z0-9\.]{6,30})(\*[a-zA-Z0-9\.]*)?@([a-zA-Z0-9\-\.]+)$)");
    
    for (const auto& email : emails) {
        smatch matches;
        if (!regex_match(email, matches, email_pattern)) {
            cout << "Неверная почта: " << email << endl;
            continue;
        }
        
        string username = matches[1].str();
        string domain = matches[3].str();
        
        if (username.front() == '.' || username.back() == '.' || username.find("..") != string::npos) {
            cout << "Лишние точки в домене: " << email << endl;
            continue;
        }
        
        if (domain.front() == '.' || domain.back() == '.' || domain.find("..") != string::npos) {
            cout << "Лишние точки в домене: " << email << endl;
            continue;
        }
        
        username.erase(remove(username.begin(), username.end(), '.'), username.end());
        size_t star_pos = username.find('*');
        if (star_pos != string::npos) {
            username = username.substr(0, star_pos);
            if (username.length() < 6) {
                cout << "Имя пользователя слишком короткое: " << email << endl;
                continue;
            }
        }
        
        valid_emails.insert(username + "@" + domain);
    }
    
    return valid_emails.size();
}

int main() {
    cout << "Введите адреса почт через пробел: ";
    string input;
    getline(cin, input);
    
    vector<string> emails;
    size_t pos = 0;
    while ((pos = input.find(' ')) != string::npos) {
        string email = input.substr(0, pos);
        if (!email.empty()) emails.push_back(email);
        input.erase(0, pos + 1);
    }
    if (!input.empty()) emails.push_back(input);
    
    int valid_count = countValidEmails(emails);
    cout << "Количество уникальных адресов: " << valid_count << endl;
    
    return 0;
}