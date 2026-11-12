extern printf,scanf,exit


section .bss
    user_input resd 1
section .data
    intro_massage db "Fibonacci sequence", 0x0a, 0x00
    input_message db "input max Fn: ", 0x00
    error_msg db "zero is not allowed.", 0x0a, 0x00
    intger_format db "%d", 0x00
    output_format db "%d ", 0x00
    newline db 0x0a, 0x00
section .text
    global main
main:
    sub rsp, 8
    lea rdi, [rel intro_massage]
    xor rax, rax
    
    call printf

    xor rax, rax
    lea rdi, [rel input_message]
    call printf

    xor rax, rax
    lea rdi, [rel intger_format]
    lea rsi, [rel user_input]
    

    lea rdi, [rel intger_format]
    lea rsi, [rel user_input]
    call scanf
    add rsp, 8

    mov ecx, [rel user_input]
    test ecx, ecx
    jz zero_error
    
    xor rax, rax
    mov rbx, 1
    xor r12d, r12d
loop_fib:
    add rax, rbx
    xchg rax, rbx
    mov rsi, rax
    push rax
    push rbx
    push rcx
    lea rdi, [rel output_format]
    xor eax, eax
    call printf
    pop rcx
    pop rbx
    pop rax
    inc r12d
    dec ecx
    cmp r12d, 6
    je new_line
    test ecx, ecx
    jnz loop_fib

finish:
    xor edi, edi
    call exit


new_line:
    push rax
    push rbx
    push rcx
    lea rdi, [rel newline]
    xor rax, rax
    call printf
    pop rcx
    pop rbx
    pop rax
    xor r12d, r12d
    test ecx, ecx
    jnz loop_fib
    jmp finish

zero_error:
    xor rax, rax
    lea rdi, [rel error_msg]
    sub rsp, 8
    call printf
    mov rdi, 1
    call exit
    add rsp, 8
