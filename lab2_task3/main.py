def count_sequences(sequence):
    if len(sequence) < 2:
        return 0
    
    seq_len = 1
    seq_count = 0
    
    for i in range(len(sequence) - 1):
        if sequence[i+1] >= sequence[i]:
            seq_len += 1
        elif seq_len > 1:
            seq_count += 1
            seq_len = 1
        else:
            seq_len = 1
    
    if seq_len > 1:
        seq_count += 1
    
    return seq_count

nums = list(map(int, input("Введите последовательность чисел через пробел: ").split()))
print(count_sequences(nums))