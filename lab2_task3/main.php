<?php

function countSequences($sequence) {
    if (count($sequence) < 2) return 0;
    
    $seqLen = 1;
    $seqCount = 0;
    
    for ($i = 0; $i < count($sequence) - 1; $i++) {
        if ($sequence[$i+1] >= $sequence[$i]) {
            $seqLen++;
        } elseif ($seqLen > 1) {
            $seqCount++;
            $seqLen = 1;
        } else {
            $seqLen = 1;
        }
    }
    
    if ($seqLen > 1) $seqCount++;
    
    return $seqCount;
}

echo "Введите последовательность чисел через пробел: ";
$input = trim(fgets(STDIN));
$nums = array_map('intval', explode(' ', $input));
echo countSequences($nums) . "\n";
?>