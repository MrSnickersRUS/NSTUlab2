using System;

public class Task1 {
    public static string CheckBoardBounds(int n, int m, string steps) {
        for (int startX = 1; startX <= n; startX++) {
            for (int startY = 1; startY <= m; startY++) {
                int x = startX;
                int y = startY;
                bool isValid = true;

                foreach (char step in steps) {
                    switch (step) {
                        case 'L': x--; break;
                        case 'R': x++; break;
                        case 'D': y--; break;
                        case 'U': y++; break;
                        default: return "Ошибка в значении ходов";
                    }

                    if (x < 1 || x > n || y < 1 || y > m) {
                        isValid = false;
                        break;
                    }
                }

                if (isValid) {
                    return $"({startX},{startY})";
                }
            } 
        }
        return "No";
    }
    
    public static void Main() {
        Console.WriteLine("Введите длину доски: ");
        int n = Int32.Parse(Console.ReadLine());
        
        Console.WriteLine("Введите ширину доски: ");
        int m = Int32.Parse(Console.ReadLine());
        
        Console.WriteLine("Введите ходы для фигуры (LRDU): ");
        string steps = Console.ReadLine();
        
        Console.WriteLine(CheckBoardBounds(n, m, steps));
    }
}