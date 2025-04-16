use std::io;

fn check_board_bounds(n: i32, m: i32, steps: &str) -> String {
    for start_x in 1..=n {
        for start_y in 1..=m {
            let (mut x, mut y) = (start_x, start_y);
            let mut is_valid = true;
            for step in steps.chars() {
                match step {
                    'L' => x -= 1,
                    'R' => x += 1,
                    'D' => y -= 1,
                    'U' => y += 1,
                    _ => return "Ошибка в ходах".to_string(),
                }
                if x < 1 || x > n || y < 1 || y > m {
                    is_valid = false;
                    break;
                }
            }
            if is_valid {
                return format!("({},{})", start_x, start_y);
            }
        }
    }
    "No".to_string()
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();
    
    input.clear();
    io::stdin().read_line(&mut input).unwrap();
    let m: i32 = input.trim().parse().unwrap();
    
    input.clear();
    io::stdin().read_line(&mut input).unwrap();
    let steps = input.trim();
    
    println!("{}", check_board_bounds(n, m, steps));
}