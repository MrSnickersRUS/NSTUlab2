use std::io;

fn count_sequences(sequence: &[i32]) -> i32 {
    if sequence.len() < 2 {
        return 0;
    }

    let mut seq_len = 1;
    let mut seq_count = 0;

    for i in 0..sequence.len() - 1 {
        if sequence[i+1] >= sequence[i] {
            seq_len += 1;
        } else if seq_len > 1 {
            seq_count += 1;
            seq_len = 1;
        } else {
            seq_len = 1;
        }
    }

    if seq_len > 1 {
        seq_count += 1;
    }

    seq_count
}

fn main() {
    println!("Введите последовательность чисел через пробел:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    
    let nums: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();
    
    println!("{}", count_sequences(&nums));
}