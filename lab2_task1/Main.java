import java.util.Scanner;

public class Main {
    public static String checkBoardBounds(int n, int m, String steps) {
        for (int startX = 1; startX <= n; startX++) {
            for (int startY = 1; startY <= m; startY++) {
                int x = startX, y = startY;
                boolean isValid = true;
                for (char step : steps.toCharArray()) {
                    switch (step) {
                        case 'L': x--; break;
                        case 'R': x++; break;
                        case 'D': y--; break;
                        case 'U': y++; break;
                        default: return "Ошибка в ходах";
                    }
                    if (x < 1 || x > n || y < 1 || y > m) {
                        isValid = false;
                        break;
                    }
                }
                if (isValid) {
                    return "(" + startX + "," + startY + ")";
                }
            }
        }
        return "No";
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();
        String steps = sc.next();
        System.out.println(checkBoardBounds(n, m, steps));
    }
}