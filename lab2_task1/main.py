def checkBoardBounds (n, m, steps):
    for startX in range(1, n):
        for startY in range(1, m):
            x = startX
            y = startY
            isValid = True
            
            for step in steps:
                if step == 'L': x -= 1
                elif step == 'R': x += 1
                elif step == 'D': y -= 1
                elif step == 'U': y += 1
                if x < 1 or x > n or y < 1 or y > m:
                    isValid = False
                    break
            if isValid:
                return (f'({startX}, {startY})')
    return "No"


n = int(input("Введите длину доски: ")) 
m = int(input("Введите ширину доски: "))
steps = input("Введите ходы для фигуры (LRDU): ")
print(checkBoardBounds(n, m, steps))