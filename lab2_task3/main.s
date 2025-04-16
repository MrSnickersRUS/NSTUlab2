section .data
    array dd 1, 2, 3, 5, 2
    array_len equ ($ - array) / 4

    result_msg db "Количество неубывающих серий: ", 0
    result_msg_len equ $ - result_msg
    newline db 10, 0
    newline_len equ $ - newline
    buffer times 11 db 0

section .text
    global _start

_start:
    mov ecx, array_len
    cmp ecx, 1
    jle .special_cases

    ; Основная логика
    mov esi, array
    mov ebx, 1          ; Первая серия
    mov ecx, array_len
    dec ecx

.compare_loop:
    mov eax, [esi]
    mov edx, [esi + 4]
    cmp eax, edx
    jle .next_element
    inc ebx             ; Новая серия
.next_element:
    add esi, 4
    loop .compare_loop
    jmp .print_result

.special_cases:
    mov ebx, ecx        ; 0 или 1
    jmp .print_result

.print_result:
    ; Вывод сообщения
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    ; Вывод числа
    mov eax, ebx
    call print_uint

    ; Вывод перевода строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, newline_len
    int 0x80

.exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_uint:
    mov edi, buffer + 10
    mov byte [edi], 0
    mov ecx, 10
.convert_loop:
    dec edi
    xor edx, edx
    div ecx
    add dl, '0'
    mov [edi], dl
    test eax, eax
    jnz .convert_loop
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 10
    sub edx, edi
    int 0x80
    ret