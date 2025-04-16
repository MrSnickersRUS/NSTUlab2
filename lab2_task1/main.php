<?php
function checkBoardBounds($n, $m, $steps) {
    for ($startX = 1; $startX <= $n; $startX++) {
        for ($startY = 1; $startY <= $m; $startY++) {
            $x = $startX;
            $y = $startY;
            $isValid = true;
            for ($i = 0; $i < strlen($steps); $i++) {
                $step = $steps[$i];
                switch ($step) {
                    case 'L': $x--; break;
                    case 'R': $x++; break;
                    case 'D': $y--; break;
                    case 'U': $y++; break;
                    default: return "Ошибка в ходах";
                }
                if ($x < 1 || $x > $n || $y < 1 || $y > $m) {
                    $isValid = false;
                    break;
                }
            }
            if ($isValid) return "($startX,$startY)";
        }
    }
    return "No";
}

$n = intval(trim(fgets(STDIN)));
$m = intval(trim(fgets(STDIN)));
$steps = trim(fgets(STDIN));
echo checkBoardBounds($n, $m, $steps);
?>