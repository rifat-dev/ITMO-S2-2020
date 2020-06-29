(x86-64 gcc 10.1)
operator new(unsigned long, void*):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        pop     rbp
        ret
operator delete(void*, void*):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        nop
        pop     rbp
        ret
namesfile[abi:cxx11]:
        .zero   24
Point::Point() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rax], xmm0
        mov     rax, QWORD PTR [rbp-8]
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rax+8], xmm0
        mov     rax, QWORD PTR [rbp-8]
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rax+16], xmm0
        mov     rax, QWORD PTR [rbp-8]
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rax+24], xmm0
        nop
        pop     rbp
        ret
.LC1:
        .string " "
operator<<(std::basic_ostream<char, std::char_traits<char> >&, Point const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        movq    xmm0, rdx
        mov     rdi, rax
        call    std::basic_ostream<char, std::char_traits<char> >::operator<<(double)
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        call    std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+8]
        movq    xmm0, rax
        mov     rdi, rdx
        call    std::basic_ostream<char, std::char_traits<char> >::operator<<(double)
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        call    std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax+24]
        movq    xmm0, rax
        mov     rdi, rdx
        call    std::basic_ostream<char, std::char_traits<char> >::operator<<(double)
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
operator>>(std::basic_istream<char, std::char_traits<char> >&, Point&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(double&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        add     rax, 8
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(double&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        add     rax, 16
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(double&)
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
header_of_file::read(std::basic_istream<char, std::char_traits<char> >&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 104
        mov     QWORD PTR [rbp-104], rdi
        mov     QWORD PTR [rbp-112], rsi
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        lea     rax, [rbp-80]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        mov     rdx, QWORD PTR [rbp-104]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::getline<char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     esi, OFFSET FLAT:_ZSt2wsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(std::basic_istream<char, std::char_traits<char> >& (*)(std::basic_istream<char, std::char_traits<char> >&))
        mov     rax, QWORD PTR [rbp-104]
        lea     rdx, [rax+32]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::getline<char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     esi, OFFSET FLAT:_ZSt2wsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(std::basic_istream<char, std::char_traits<char> >& (*)(std::basic_istream<char, std::char_traits<char> >&))
        mov     rax, QWORD PTR [rbp-104]
        lea     rdx, [rax+64]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::getline<char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-104]
        add     rax, 160
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(int&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-104]
        add     rax, 168
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(int&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-104]
        add     rax, 164
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(int&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     esi, OFFSET FLAT:_ZSt2wsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >::operator>>(std::basic_istream<char, std::char_traits<char> >& (*)(std::basic_istream<char, std::char_traits<char> >&))
        mov     rax, QWORD PTR [rbp-104]
        lea     rdx, [rax+96]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::getline<char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdx, rax
        lea     rax, [rbp-48]
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-104]
        sub     rax, -128
        mov     rsi, rax
        mov     rdi, rdx
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        lea     rdx, [rbp-81]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::operator>><char, std::char_traits<char> >(std::basic_istream<char, std::char_traits<char> >&, char&)
        lea     rdx, [rbp-80]
        mov     rax, QWORD PTR [rbp-112]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::getline<char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        lea     rax, [rbp-80]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        jmp     .L12
        mov     rbx, rax
        lea     rax, [rbp-80]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L12:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
distance(double, double, double, double):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        movsd   QWORD PTR [rbp-8], xmm0
        movsd   QWORD PTR [rbp-16], xmm1
        movsd   QWORD PTR [rbp-24], xmm2
        movsd   QWORD PTR [rbp-32], xmm3
        movsd   xmm0, QWORD PTR [rbp-8]
        subsd   xmm0, QWORD PTR [rbp-24]
        movq    rax, xmm0
        movsd   xmm0, QWORD PTR .LC2[rip]
        movapd  xmm1, xmm0
        movq    xmm0, rax
        call    pow
        movsd   QWORD PTR [rbp-40], xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        movapd  xmm4, xmm0
        subsd   xmm4, QWORD PTR [rbp-32]
        movq    rax, xmm4
        movsd   xmm0, QWORD PTR .LC2[rip]
        movapd  xmm1, xmm0
        movq    xmm0, rax
        call    pow
        movapd  xmm5, xmm0
        addsd   xmm5, QWORD PTR [rbp-40]
        movq    rax, xmm5
        movq    xmm0, rax
        call    sqrt
        movq    rax, xmm0
        movq    xmm0, rax
        leave
        ret
getNearestX(std::vector<Point, std::allocator<Point> > const&, double, double):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 88
        mov     QWORD PTR [rbp-72], rdi
        movsd   QWORD PTR [rbp-80], xmm0
        movsd   QWORD PTR [rbp-88], xmm1
        mov     DWORD PTR [rbp-60], 0
        mov     DWORD PTR [rbp-64], 0
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-24], xmm0
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-32], xmm0
        mov     DWORD PTR [rbp-36], 0
.L27:
        mov     eax, DWORD PTR [rbp-36]
        movsx   rbx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::size() const
        cmp     rbx, rax
        setb    al
        test    al, al
        je      .L16
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        movsd   xmm4, QWORD PTR [rax+8]
        movsd   QWORD PTR [rbp-96], xmm4
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        mov     rax, QWORD PTR [rax]
        movsd   xmm1, QWORD PTR [rbp-88]
        movsd   xmm0, QWORD PTR [rbp-80]
        movapd  xmm3, xmm1
        movapd  xmm2, xmm0
        movsd   xmm1, QWORD PTR [rbp-96]
        movq    xmm0, rax
        call    distance(double, double, double, double)
        movq    rax, xmm0
        mov     QWORD PTR [rbp-48], rax
        movsd   xmm0, QWORD PTR [rbp-24]
        comisd  xmm0, QWORD PTR [rbp-48]
        jbe     .L17
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        movsd   xmm1, QWORD PTR [rax]
        movsd   xmm0, QWORD PTR [rbp-80]
        comisd  xmm0, xmm1
        jbe     .L17
        mov     eax, 1
        jmp     .L20
.L17:
        mov     eax, 0
.L20:
        test    al, al
        je      .L21
        movsd   xmm0, QWORD PTR [rbp-48]
        movsd   QWORD PTR [rbp-24], xmm0
        mov     eax, DWORD PTR [rbp-36]
        mov     DWORD PTR [rbp-60], eax
        jmp     .L22
.L21:
        movsd   xmm0, QWORD PTR [rbp-32]
        comisd  xmm0, QWORD PTR [rbp-48]
        jbe     .L23
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        movsd   xmm0, QWORD PTR [rax]
        comisd  xmm0, QWORD PTR [rbp-80]
        jbe     .L23
        mov     eax, 1
        jmp     .L26
.L23:
        mov     eax, 0
.L26:
        test    al, al
        je      .L22
        movsd   xmm0, QWORD PTR [rbp-48]
        movsd   QWORD PTR [rbp-32], xmm0
        mov     eax, DWORD PTR [rbp-36]
        mov     DWORD PTR [rbp-64], eax
.L22:
        add     DWORD PTR [rbp-36], 1
        jmp     .L27
.L16:
        lea     rdx, [rbp-64]
        lea     rcx, [rbp-60]
        lea     rax, [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::pair<int, int>::pair<int&, int&, true>(int&, int&)
        mov     rax, QWORD PTR [rbp-56]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
getNearestY(std::vector<Point, std::allocator<Point> > const&, double, double):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 88
        mov     QWORD PTR [rbp-72], rdi
        movsd   QWORD PTR [rbp-80], xmm0
        movsd   QWORD PTR [rbp-88], xmm1
        mov     DWORD PTR [rbp-60], 0
        mov     DWORD PTR [rbp-64], 0
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-24], xmm0
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-32], xmm0
        mov     DWORD PTR [rbp-36], 0
.L45:
        mov     eax, DWORD PTR [rbp-36]
        movsx   rbx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::size() const
        cmp     rbx, rax
        setb    al
        test    al, al
        je      .L34
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        movsd   xmm4, QWORD PTR [rax+8]
        movsd   QWORD PTR [rbp-96], xmm4
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        mov     rax, QWORD PTR [rax]
        movsd   xmm1, QWORD PTR [rbp-88]
        movsd   xmm0, QWORD PTR [rbp-80]
        movapd  xmm3, xmm1
        movapd  xmm2, xmm0
        movsd   xmm1, QWORD PTR [rbp-96]
        movq    xmm0, rax
        call    distance(double, double, double, double)
        movq    rax, xmm0
        mov     QWORD PTR [rbp-48], rax
        movsd   xmm0, QWORD PTR [rbp-24]
        comisd  xmm0, QWORD PTR [rbp-48]
        jbe     .L35
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        movsd   xmm1, QWORD PTR [rax+8]
        movsd   xmm0, QWORD PTR [rbp-88]
        comisd  xmm0, xmm1
        jbe     .L35
        mov     eax, 1
        jmp     .L38
.L35:
        mov     eax, 0
.L38:
        test    al, al
        je      .L39
        movsd   xmm0, QWORD PTR [rbp-48]
        movsd   QWORD PTR [rbp-24], xmm0
        mov     eax, DWORD PTR [rbp-36]
        mov     DWORD PTR [rbp-60], eax
        jmp     .L40
.L39:
        movsd   xmm0, QWORD PTR [rbp-32]
        comisd  xmm0, QWORD PTR [rbp-48]
        jbe     .L41
        mov     eax, DWORD PTR [rbp-36]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-72]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const
        movsd   xmm0, QWORD PTR [rax+8]
        comisd  xmm0, QWORD PTR [rbp-88]
        jbe     .L41
        mov     eax, 1
        jmp     .L44
.L41:
        mov     eax, 0
.L44:
        test    al, al
        je      .L40
        movsd   xmm0, QWORD PTR [rbp-48]
        movsd   QWORD PTR [rbp-32], xmm0
        mov     eax, DWORD PTR [rbp-36]
        mov     DWORD PTR [rbp-64], eax
.L40:
        add     DWORD PTR [rbp-36], 1
        jmp     .L45
.L34:
        lea     rdx, [rbp-64]
        lea     rcx, [rbp-60]
        lea     rax, [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::pair<int, int>::pair<int&, int&, true>(int&, int&)
        mov     rax, QWORD PTR [rbp-56]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
header_of_file::header_of_file() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 32
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 64
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 96
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        mov     rax, QWORD PTR [rbp-8]
        sub     rax, -128
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        nop
        leave
        ret
header_of_file::~header_of_file() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        sub     rax, -128
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 96
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 64
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        mov     rax, QWORD PTR [rbp-8]
        add     rax, 32
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        nop
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_Vector_impl::~_Vector_impl() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::allocator<Point>::~allocator() [base object destructor]
        nop
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_Vector_base() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_Vector_impl::_Vector_impl() [complete object constructor]
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::vector() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_Vector_base() [base object constructor]
        nop
        leave
        ret
.LC8:
        .string "\n"
computeE(std::basic_istream<char, std::char_traits<char> >&, std::basic_ostream<char, std::char_traits<char> >&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 376
        mov     QWORD PTR [rbp-360], rdi
        mov     QWORD PTR [rbp-368], rsi
        lea     rax, [rbp-240]
        mov     rdi, rax
        call    header_of_file::header_of_file() [complete object constructor]
        mov     rdx, QWORD PTR [rbp-360]
        lea     rax, [rbp-240]
        mov     rsi, rdx
        mov     rdi, rax
        call    header_of_file::read(std::basic_istream<char, std::char_traits<char> >&)
        lea     rax, [rbp-272]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::vector() [complete object constructor]
        lea     rax, [rbp-304]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string() [complete object constructor]
        mov     DWORD PTR [rbp-20], 0
.L62:
        mov     eax, DWORD PTR [rbp-72]
        cmp     DWORD PTR [rbp-20], eax
        jge     .L57
        lea     rax, [rbp-352]
        mov     rdi, rax
        call    Point::Point() [complete object constructor]
        lea     rdx, [rbp-352]
        mov     rax, QWORD PTR [rbp-360]
        mov     rsi, rdx
        mov     rdi, rax
        call    operator>>(std::basic_istream<char, std::char_traits<char> >&, Point&)
        lea     rdx, [rbp-352]
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::push_back(Point const&)
        mov     rax, QWORD PTR [rbp-360]
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >::peek()
        cmp     eax, 43
        je      .L58
        mov     rax, QWORD PTR [rbp-360]
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >::peek()
        cmp     eax, 45
        jne     .L59
.L58:
        mov     eax, 1
        jmp     .L60
.L59:
        mov     eax, 0
.L60:
        test    al, al
        je      .L61
        lea     rdx, [rbp-304]
        mov     rax, QWORD PTR [rbp-360]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::basic_istream<char, std::char_traits<char> >& std::getline<char, std::char_traits<char>, std::allocator<char> >(std::basic_istream<char, std::char_traits<char> >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
.L61:
        add     DWORD PTR [rbp-20], 1
        jmp     .L62
.L57:
        movsd   xmm0, QWORD PTR .LC4[rip]
        movsd   QWORD PTR [rbp-32], xmm0
.L68:
        movsd   xmm0, QWORD PTR .LC5[rip]
        comisd  xmm0, QWORD PTR [rbp-32]
        jb      .L75
        movsd   xmm0, QWORD PTR .LC6[rip]
        movsd   QWORD PTR [rbp-40], xmm0
.L67:
        movsd   xmm0, QWORD PTR .LC7[rip]
        comisd  xmm0, QWORD PTR [rbp-40]
        jb      .L76
        movsd   xmm0, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rax, [rbp-272]
        movapd  xmm1, xmm0
        movq    xmm0, rdx
        mov     rdi, rax
        call    getNearestX(std::vector<Point, std::allocator<Point> > const&, double, double)
        mov     QWORD PTR [rbp-312], rax
        movsd   xmm0, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rax, [rbp-272]
        movapd  xmm1, xmm0
        movq    xmm0, rdx
        mov     rdi, rax
        call    getNearestY(std::vector<Point, std::allocator<Point> > const&, double, double)
        mov     QWORD PTR [rbp-320], rax
        mov     eax, DWORD PTR [rbp-308]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm2, QWORD PTR [rax+16]
        movsd   QWORD PTR [rbp-376], xmm2
        mov     eax, DWORD PTR [rbp-312]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm0, QWORD PTR [rax+16]
        movsd   xmm2, QWORD PTR [rbp-376]
        subsd   xmm2, xmm0
        movsd   QWORD PTR [rbp-376], xmm2
        mov     eax, DWORD PTR [rbp-308]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm4, QWORD PTR [rax]
        movsd   QWORD PTR [rbp-384], xmm4
        mov     eax, DWORD PTR [rbp-312]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm0, QWORD PTR [rax]
        movsd   xmm1, QWORD PTR [rbp-384]
        subsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-376]
        divsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-48], xmm0
        mov     eax, DWORD PTR [rbp-316]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm3, QWORD PTR [rax+16]
        movsd   QWORD PTR [rbp-376], xmm3
        mov     eax, DWORD PTR [rbp-320]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm0, QWORD PTR [rax+16]
        movsd   xmm3, QWORD PTR [rbp-376]
        subsd   xmm3, xmm0
        movsd   QWORD PTR [rbp-376], xmm3
        mov     eax, DWORD PTR [rbp-316]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm5, QWORD PTR [rax+8]
        movsd   QWORD PTR [rbp-384], xmm5
        mov     eax, DWORD PTR [rbp-320]
        movsx   rdx, eax
        lea     rax, [rbp-272]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::operator[](unsigned long)
        movsd   xmm0, QWORD PTR [rax+8]
        movsd   xmm1, QWORD PTR [rbp-384]
        subsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-376]
        divsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-56], xmm0
        lea     rax, [rbp-352]
        mov     rdi, rax
        call    Point::Point() [complete object constructor]
        movsd   xmm0, QWORD PTR [rbp-40]
        movsd   QWORD PTR [rbp-352], xmm0
        movsd   xmm0, QWORD PTR [rbp-32]
        movsd   QWORD PTR [rbp-344], xmm0
        movsd   xmm0, QWORD PTR [rbp-48]
        movapd  xmm1, xmm0
        mulsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-56]
        mulsd   xmm0, xmm0
        addsd   xmm1, xmm0
        movq    rax, xmm1
        movq    xmm0, rax
        call    sqrt
        movq    rax, xmm0
        mov     QWORD PTR [rbp-328], rax
        lea     rdx, [rbp-352]
        mov     rax, QWORD PTR [rbp-368]
        mov     rsi, rdx
        mov     rdi, rax
        call    operator<<(std::basic_ostream<char, std::char_traits<char> >&, Point const&)
        mov     esi, OFFSET FLAT:.LC8
        mov     rdi, rax
        call    std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
        movsd   xmm1, QWORD PTR [rbp-40]
        movsd   xmm0, QWORD PTR .LC9[rip]
        addsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-40], xmm0
        jmp     .L67
.L76:
        movsd   xmm1, QWORD PTR [rbp-32]
        movsd   xmm0, QWORD PTR .LC9[rip]
        addsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-32], xmm0
        jmp     .L68
.L75:
        lea     rax, [rbp-304]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        lea     rax, [rbp-272]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::~vector() [complete object destructor]
        lea     rax, [rbp-240]
        mov     rdi, rax
        call    header_of_file::~header_of_file() [complete object destructor]
        jmp     .L77
        mov     rbx, rax
        lea     rax, [rbp-304]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        lea     rax, [rbp-272]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::~vector() [complete object destructor]
        jmp     .L70
        mov     rbx, rax
.L70:
        lea     rax, [rbp-240]
        mov     rdi, rax
        call    header_of_file::~header_of_file() [complete object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L77:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC10:
        .string "result-"
.LC11:
        .string ".txt"
main:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 1128
        mov     DWORD PTR [rbp-1124], edi
        mov     QWORD PTR [rbp-1136], rsi
        mov     DWORD PTR [rbp-20], 0
.L80:
        cmp     DWORD PTR [rbp-20], 17
        jg      .L79
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        mov     rsi, rax
        mov     edi, OFFSET FLAT:namesfile[abi:cxx11]
        call    std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::operator[](unsigned long)
        mov     rdx, rax
        lea     rax, [rbp-1120]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
        lea     rax, [rbp-21]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rdx, [rbp-21]
        lea     rax, [rbp-1088]
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-21]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-1120]
        mov     esi, OFFSET FLAT:.LC11
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::operator+=(char const*)
        lea     rdx, [rbp-1120]
        lea     rax, [rbp-1088]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::operator+=(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
        lea     rcx, [rbp-1120]
        lea     rax, [rbp-544]
        mov     edx, 8
        mov     rsi, rcx
        mov     rdi, rax
        call    std::basic_ifstream<char, std::char_traits<char> >::basic_ifstream(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::_Ios_Openmode)
        lea     rcx, [rbp-1088]
        lea     rax, [rbp-1056]
        mov     edx, 16
        mov     rsi, rcx
        mov     rdi, rax
        call    std::basic_ofstream<char, std::char_traits<char> >::basic_ofstream(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::_Ios_Openmode)
        lea     rdx, [rbp-1056]
        lea     rax, [rbp-544]
        mov     rsi, rdx
        mov     rdi, rax
        call    computeE(std::basic_istream<char, std::char_traits<char> >&, std::basic_ostream<char, std::char_traits<char> >&)
        lea     rax, [rbp-1056]
        mov     rdi, rax
        call    std::basic_ofstream<char, std::char_traits<char> >::~basic_ofstream() [complete object destructor]
        lea     rax, [rbp-544]
        mov     rdi, rax
        call    std::basic_ifstream<char, std::char_traits<char> >::~basic_ifstream() [complete object destructor]
        lea     rax, [rbp-1088]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        lea     rax, [rbp-1120]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        add     DWORD PTR [rbp-20], 1
        jmp     .L80
.L79:
        mov     eax, 0
        jmp     .L91
        mov     rbx, rax
        lea     rax, [rbp-21]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L83
        mov     rbx, rax
        lea     rax, [rbp-1056]
        mov     rdi, rax
        call    std::basic_ofstream<char, std::char_traits<char> >::~basic_ofstream() [complete object destructor]
        jmp     .L85
        mov     rbx, rax
.L85:
        lea     rax, [rbp-544]
        mov     rdi, rax
        call    std::basic_ifstream<char, std::char_traits<char> >::~basic_ifstream() [complete object destructor]
        jmp     .L86
        mov     rbx, rax
.L86:
        lea     rax, [rbp-1088]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
.L83:
        lea     rax, [rbp-1120]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L91:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocator() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::new_allocator() [base object constructor]
        nop
        leave
        ret
std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~allocator() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~new_allocator() [base object destructor]
        nop
        leave
        ret
std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::vector(std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     rax, rsi
        mov     rsi, rdx
        mov     rdx, rsi
        mov     QWORD PTR [rbp-64], rax
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_base(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        lea     rax, [rbp-64]
        mov     rdi, rax
        call    std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::end() const
        mov     rbx, rax
        lea     rax, [rbp-64]
        mov     rdi, rax
        call    std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::begin() const
        mov     rcx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, rbx
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_range_initialize<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::forward_iterator_tag)
        jmp     .L97
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::~_Vector_base() [base object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L97:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::~vector() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_get_Tp_allocator()
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&)
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::~_Vector_base() [base object destructor]
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::size() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax]
        mov     rax, rdx
        sub     rax, rcx
        sar     rax, 5
        pop     rbp
        ret
std::vector<Point, std::allocator<Point> >::operator[](unsigned long) const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        sal     rax, 5
        add     rax, rdx
        pop     rbp
        ret
std::pair<int, int>::pair<int&, int&, true>(int&, int&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    int& std::forward<int&>(std::remove_reference<int&>::type&)
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax], edx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    int& std::forward<int&>(std::remove_reference<int&>::type&)
        mov     edx, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     DWORD PTR [rax+4], edx
        nop
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_Vector_impl::_Vector_impl() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::allocator<Point>::allocator() [base object constructor]
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_Vector_impl_data::_Vector_impl_data() [base object constructor]
        nop
        leave
        ret
std::allocator<Point>::~allocator() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::~new_allocator() [base object destructor]
        nop
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::~_Vector_base() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax]
        mov     rax, rdx
        sub     rax, rcx
        sar     rax, 5
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_deallocate(Point*, unsigned long)
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_Vector_impl::~_Vector_impl() [complete object destructor]
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::~vector() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::_Destroy<Point*, Point>(Point*, Point*, std::allocator<Point>&)
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::~_Vector_base() [base object destructor]
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::push_back(Point const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+16]
        cmp     rdx, rax
        je      .L109
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::allocator_traits<std::allocator<Point> >::construct<Point, Point const&>(std::allocator<Point>&, Point*, Point const&)
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        lea     rdx, [rax+32]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L111
.L109:
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::end()
        mov     rcx, rax
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::vector<Point, std::allocator<Point> >::_M_realloc_insert<Point const&>(__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >, Point const&)
.L111:
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::operator[](unsigned long):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        sal     rax, 5
        add     rax, rdx
        pop     rbp
        ret
std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::operator[](unsigned long):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        sal     rax, 5
        add     rax, rdx
        pop     rbp
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::new_allocator() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        nop
        pop     rbp
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~new_allocator() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        nop
        pop     rbp
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl::~_Vector_impl() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~allocator() [base object destructor]
        nop
        leave
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_base(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl::_Vector_impl(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        nop
        leave
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::~_Vector_base() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax]
        mov     rax, rdx
        sub     rax, rcx
        sar     rax, 5
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rcx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_deallocate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, unsigned long)
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl::~_Vector_impl() [complete object destructor]
        nop
        leave
        ret
std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::begin() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        pop     rbp
        ret
std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::end() const:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 24
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::begin() const
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::size() const
        sal     rax, 5
        add     rax, rbx
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
void std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_range_initialize<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::forward_iterator_tag):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     rdx, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::iterator_traits<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>::difference_type std::distance<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*)
        mov     QWORD PTR [rbp-24], rax
        mov     rbx, QWORD PTR [rbp-40]
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_get_Tp_allocator()
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_S_check_init_len(unsigned long, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        mov     rsi, rax
        mov     rdi, rbx
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_allocate(unsigned long)
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rdx], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-24]
        sal     rax, 5
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rax+16], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_get_Tp_allocator()
        mov     rcx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rax]
        mov     rsi, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__uninitialized_copy_a<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&)
        mov     rdx, QWORD PTR [rbp-40]
        mov     QWORD PTR [rdx+8], rax
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_get_Tp_allocator():
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)
        nop
        leave
        ret
int& std::forward<int&>(std::remove_reference<int&>::type&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
std::allocator<Point>::allocator() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::new_allocator() [base object constructor]
        nop
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_Vector_impl_data::_Vector_impl_data() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+16], 0
        nop
        pop     rbp
        ret
__gnu_cxx::new_allocator<Point>::~new_allocator() [base object destructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        nop
        pop     rbp
        ret
std::_Vector_base<Point, std::allocator<Point> >::_M_deallocate(Point*, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        cmp     QWORD PTR [rbp-16], 0
        je      .L136
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-16]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::allocator_traits<std::allocator<Point> >::deallocate(std::allocator<Point>&, Point*, unsigned long)
.L136:
        nop
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator():
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void std::_Destroy<Point*, Point>(Point*, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::_Destroy<Point*>(Point*, Point*)
        nop
        leave
        ret
void std::allocator_traits<std::allocator<Point> >::construct<Point, Point const&>(std::allocator<Point>&, Point*, Point const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    Point const& std::forward<Point const&>(std::remove_reference<Point const&>::type&)
        mov     rdx, rax
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    void __gnu_cxx::new_allocator<Point>::construct<Point, Point const&>(Point*, Point const&)
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::end():
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        lea     rdx, [rax+8]
        lea     rax, [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::__normal_iterator(Point* const&)
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
std::vector<Point, std::allocator<Point> >::_S_use_relocate():
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        call    std::vector<Point, std::allocator<Point> >::_S_nothrow_relocate(std::integral_constant<bool, true>)
        leave
        ret
std::vector<Point, std::allocator<Point> >::_S_nothrow_relocate(std::integral_constant<bool, true>):
        push    rbp
        mov     rbp, rsp
        mov     eax, 1
        pop     rbp
        ret
.LC12:
        .string "vector::_M_realloc_insert"
void std::vector<Point, std::allocator<Point> >::_M_realloc_insert<Point const&>(__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >, Point const&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 104
        mov     QWORD PTR [rbp-88], rdi
        mov     QWORD PTR [rbp-96], rsi
        mov     QWORD PTR [rbp-104], rdx
        mov     rax, QWORD PTR [rbp-88]
        mov     edx, OFFSET FLAT:.LC12
        mov     esi, 1
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::_M_check_len(unsigned long, char const*) const
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::begin()
        mov     QWORD PTR [rbp-72], rax
        lea     rdx, [rbp-72]
        lea     rax, [rbp-96]
        mov     rsi, rdx
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::difference_type __gnu_cxx::operator-<Point*, std::vector<Point, std::allocator<Point> > >(__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > > const&, __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > > const&)
        mov     QWORD PTR [rbp-56], rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_allocate(unsigned long)
        mov     QWORD PTR [rbp-64], rax
        mov     rax, QWORD PTR [rbp-64]
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-104]
        mov     rdi, rax
        call    Point const& std::forward<Point const&>(std::remove_reference<Point const&>::type&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        sal     rax, 5
        mov     rcx, rax
        mov     rax, QWORD PTR [rbp-64]
        add     rcx, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::allocator_traits<std::allocator<Point> >::construct<Point, Point const&>(std::allocator<Point>&, Point*, Point const&)
        mov     QWORD PTR [rbp-24], 0
        call    std::vector<Point, std::allocator<Point> >::_S_use_relocate()
        test    al, al
        je      .L148
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rbx, rax
        lea     rax, [rbp-96]
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const
        mov     rsi, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rbx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::_S_relocate(Point*, Point*, Point*, std::allocator<Point>&)
        mov     QWORD PTR [rbp-24], rax
        add     QWORD PTR [rbp-24], 32
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rbx, rax
        lea     rax, [rbp-96]
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rbx
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::_S_relocate(Point*, Point*, Point*, std::allocator<Point>&)
        mov     QWORD PTR [rbp-24], rax
        jmp     .L149
.L148:
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rbx, rax
        lea     rax, [rbp-96]
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const
        mov     rsi, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-64]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rbx
        mov     rdi, rax
        call    Point* std::__uninitialized_move_if_noexcept_a<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&)
        mov     QWORD PTR [rbp-24], rax
        add     QWORD PTR [rbp-24], 32
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rbx, rax
        lea     rax, [rbp-96]
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const
        mov     rax, QWORD PTR [rax]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rbp-48]
        mov     rcx, rbx
        mov     rdi, rax
        call    Point* std::__uninitialized_move_if_noexcept_a<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&)
        mov     QWORD PTR [rbp-24], rax
.L149:
        call    std::vector<Point, std::allocator<Point> >::_S_use_relocate()
        xor     eax, 1
        test    al, al
        je      .L150
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rdx, rax
        mov     rcx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::_Destroy<Point*, Point>(Point*, Point*, std::allocator<Point>&)
.L150:
        mov     rax, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rdx+16]
        sub     rdx, QWORD PTR [rbp-40]
        sar     rdx, 5
        mov     rcx, QWORD PTR [rbp-40]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_deallocate(Point*, unsigned long)
        mov     rax, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-64]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-24]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-32]
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     QWORD PTR [rax+16], rdx
        jmp     .L157
        mov     rdi, rax
        call    __cxa_begin_catch
        cmp     QWORD PTR [rbp-24], 0
        jne     .L152
        mov     rax, QWORD PTR [rbp-56]
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-64]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-88]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::allocator_traits<std::allocator<Point> >::destroy<Point>(std::allocator<Point>&, Point*)
        jmp     .L153
.L152:
        mov     rax, QWORD PTR [rbp-88]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator()
        mov     rdx, rax
        mov     rcx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-64]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::_Destroy<Point*, Point>(Point*, Point*, std::allocator<Point>&)
.L153:
        mov     rax, QWORD PTR [rbp-88]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rcx, QWORD PTR [rbp-64]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_deallocate(Point*, unsigned long)
        call    __cxa_rethrow
        mov     rbx, rax
        call    __cxa_end_catch
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L157:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret

std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl::_Vector_impl(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocator(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data::_Vector_impl_data() [base object constructor]
        nop
        leave
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_deallocate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        cmp     QWORD PTR [rbp-16], 0
        je      .L161
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-16]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::allocator_traits<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::deallocate(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, unsigned long)
.L161:
        nop
        leave
        ret
std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::size() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        pop     rbp
        ret
std::iterator_traits<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>::difference_type std::distance<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        lea     rax, [rbp-8]
        mov     rdi, rax
        call    std::iterator_traits<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>::iterator_category std::__iterator_category<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const* const&)
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::iterator_traits<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>::difference_type std::__distance<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::random_access_iterator_tag)
        leave
        ret
.LC13:
        .string "cannot create std::vector larger than max_size()"
std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_S_check_init_len(unsigned long, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rdx, QWORD PTR [rbp-48]
        lea     rax, [rbp-17]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocator(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        lea     rax, [rbp-17]
        mov     rdi, rax
        call    std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_S_max_size(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        cmp     QWORD PTR [rbp-40], rax
        seta    bl
        lea     rax, [rbp-17]
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~allocator() [complete object destructor]
        test    bl, bl
        je      .L167
        mov     edi, OFFSET FLAT:.LC13
        call    std::__throw_length_error(char const*)
.L167:
        mov     rax, QWORD PTR [rbp-40]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_M_allocate(unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        cmp     QWORD PTR [rbp-16], 0
        je      .L170
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::allocator_traits<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::allocate(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&, unsigned long)
        jmp     .L172
.L170:
        mov     eax, 0
.L172:
        leave
        ret
std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__uninitialized_copy_a<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::uninitialized_copy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)
        leave
        ret
void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::_Destroy_aux<false>::__destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)
        nop
        leave
        ret
__gnu_cxx::new_allocator<Point>::new_allocator() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        nop
        pop     rbp
        ret
std::allocator_traits<std::allocator<Point> >::deallocate(std::allocator<Point>&, Point*, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::deallocate(Point*, unsigned long)
        nop
        leave
        ret
void std::_Destroy<Point*>(Point*, Point*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::_Destroy_aux<true>::__destroy<Point*>(Point*, Point*)
        nop
        leave
        ret
Point const& std::forward<Point const&>(std::remove_reference<Point const&>::type&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void __gnu_cxx::new_allocator<Point>::construct<Point, Point const&>(Point*, Point const&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    Point const& std::forward<Point const&>(std::remove_reference<Point const&>::type&)
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, 32
        call    operator new(unsigned long, void*)
        mov     rcx, rax
        mov     rax, QWORD PTR [rbx]
        mov     rdx, QWORD PTR [rbx+8]
        mov     QWORD PTR [rcx], rax
        mov     QWORD PTR [rcx+8], rdx
        mov     rax, QWORD PTR [rbx+16]
        mov     rdx, QWORD PTR [rbx+24]
        mov     QWORD PTR [rcx+16], rax
        mov     QWORD PTR [rcx+24], rdx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::__normal_iterator(Point* const&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        nop
        pop     rbp
        ret
std::vector<Point, std::allocator<Point> >::_M_check_len(unsigned long, char const*) const:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::max_size() const
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::size() const
        sub     rbx, rax
        mov     rdx, rbx
        mov     rax, QWORD PTR [rbp-48]
        cmp     rdx, rax
        setb    al
        test    al, al
        je      .L184
        mov     rax, QWORD PTR [rbp-56]
        mov     rdi, rax
        call    std::__throw_length_error(char const*)
.L184:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::size() const
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::size() const
        mov     QWORD PTR [rbp-32], rax
        lea     rdx, [rbp-48]
        lea     rax, [rbp-32]
        mov     rsi, rdx
        mov     rdi, rax
        call    unsigned long const& std::max<unsigned long>(unsigned long const&, unsigned long const&)
        mov     rax, QWORD PTR [rax]
        add     rax, rbx
        mov     QWORD PTR [rbp-24], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::size() const
        cmp     QWORD PTR [rbp-24], rax
        jb      .L185
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::max_size() const
        cmp     QWORD PTR [rbp-24], rax
        jbe     .L186
.L185:
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::max_size() const
        jmp     .L187
.L186:
        mov     rax, QWORD PTR [rbp-24]
.L187:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::vector<Point, std::allocator<Point> >::begin():
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rdx, QWORD PTR [rbp-24]
        lea     rax, [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::__normal_iterator(Point* const&)
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::difference_type __gnu_cxx::operator-<Point*, std::vector<Point, std::allocator<Point> > >(__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > > const&, __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > > const&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 24
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const
        mov     rbx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    __gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const
        mov     rdx, QWORD PTR [rax]
        mov     rax, rbx
        sub     rax, rdx
        sar     rax, 5
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_M_allocate(unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        cmp     QWORD PTR [rbp-16], 0
        je      .L194
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::allocator_traits<std::allocator<Point> >::allocate(std::allocator<Point>&, unsigned long)
        jmp     .L196
.L194:
        mov     eax, 0
.L196:
        leave
        ret
std::vector<Point, std::allocator<Point> >::_S_relocate(Point*, Point*, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rcx, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::_S_do_relocate(Point*, Point*, Point*, std::allocator<Point>&, std::integral_constant<bool, true>)
        leave
        ret
__gnu_cxx::__normal_iterator<Point*, std::vector<Point, std::allocator<Point> > >::base() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
Point* std::__uninitialized_move_if_noexcept_a<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    std::move_iterator<Point*> std::__make_move_if_noexcept_iterator<Point, std::move_iterator<Point*> >(Point*)
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::move_iterator<Point*> std::__make_move_if_noexcept_iterator<Point, std::move_iterator<Point*> >(Point*)
        mov     rdi, rax
        mov     rdx, QWORD PTR [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     rcx, rdx
        mov     rdx, rax
        mov     rsi, rbx
        call    Point* std::__uninitialized_copy_a<std::move_iterator<Point*>, Point*, Point>(std::move_iterator<Point*>, std::move_iterator<Point*>, Point*, std::allocator<Point>&)
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
void std::allocator_traits<std::allocator<Point> >::destroy<Point>(std::allocator<Point>&, Point*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    void __gnu_cxx::new_allocator<Point>::destroy<Point>(Point*)
        nop
        leave
        ret
std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocator(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::new_allocator(__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        nop
        leave
        ret
std::_Vector_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_Vector_impl_data::_Vector_impl_data() [base object constructor]:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+16], 0
        nop
        pop     rbp
        ret
std::allocator_traits<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::deallocate(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::deallocate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, unsigned long)
        nop
        leave
        ret
std::iterator_traits<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>::iterator_category std::__iterator_category<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const* const&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        nop
        pop     rbp
        ret
std::iterator_traits<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>::difference_type std::__distance<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::random_access_iterator_tag):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        sub     rax, QWORD PTR [rbp-8]
        sar     rax, 5
        pop     rbp
        ret
std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::_S_max_size(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        movabs  rax, 288230376151711743
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::allocator_traits<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::max_size(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        mov     QWORD PTR [rbp-16], rax
        lea     rdx, [rbp-16]
        lea     rax, [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    unsigned long const& std::min<unsigned long>(unsigned long const&, unsigned long const&)
        mov     rax, QWORD PTR [rax]
        leave
        ret
std::allocator_traits<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::allocate(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >&, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocate(unsigned long, void const*)
        leave
        ret
std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::uninitialized_copy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     BYTE PTR [rbp-1], 1
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__uninitialized_copy<false>::__uninit_copy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)
        leave
        ret
void std::_Destroy_aux<false>::__destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
.L219:
        mov     rax, QWORD PTR [rbp-8]
        cmp     rax, QWORD PTR [rbp-16]
        je      .L220
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__addressof<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdi, rax
        call    void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)
        add     QWORD PTR [rbp-8], 32
        jmp     .L219
.L220:
        nop
        leave
        ret
__gnu_cxx::new_allocator<Point>::deallocate(Point*, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-24]
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    operator delete(void*, unsigned long)
        nop
        leave
        ret
void std::_Destroy_aux<true>::__destroy<Point*>(Point*, Point*):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        nop
        pop     rbp
        ret
std::vector<Point, std::allocator<Point> >::max_size() const:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator() const
        mov     rdi, rax
        call    std::vector<Point, std::allocator<Point> >::_S_max_size(std::allocator<Point> const&)
        leave
        ret
unsigned long const& std::max<unsigned long>(unsigned long const&, unsigned long const&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jnb     .L226
        mov     rax, QWORD PTR [rbp-16]
        jmp     .L227
.L226:
        mov     rax, QWORD PTR [rbp-8]
.L227:
        pop     rbp
        ret
std::allocator_traits<std::allocator<Point> >::allocate(std::allocator<Point>&, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     edx, 0
        mov     rsi, rcx
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::allocate(unsigned long, void const*)
        leave
        ret
std::vector<Point, std::allocator<Point> >::_S_do_relocate(Point*, Point*, Point*, std::allocator<Point>&, std::integral_constant<bool, true>):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rcx, QWORD PTR [rbp-32]
        mov     rdx, QWORD PTR [rbp-24]
        mov     rsi, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    Point* std::__relocate_a<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&)
        leave
        ret
std::move_iterator<Point*> std::__make_move_if_noexcept_iterator<Point, std::move_iterator<Point*> >(Point*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rdx, QWORD PTR [rbp-24]
        lea     rax, [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::move_iterator<Point*>::move_iterator(Point*)
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
Point* std::__uninitialized_copy_a<std::move_iterator<Point*>, Point*, Point>(std::move_iterator<Point*>, std::move_iterator<Point*>, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     QWORD PTR [rbp-32], rcx
        mov     rdx, QWORD PTR [rbp-24]
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    Point* std::uninitialized_copy<std::move_iterator<Point*>, Point*>(std::move_iterator<Point*>, std::move_iterator<Point*>, Point*)
        leave
        ret
void __gnu_cxx::new_allocator<Point>::destroy<Point>(Point*):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        nop
        pop     rbp
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::new_allocator(__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        nop
        pop     rbp
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::deallocate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, unsigned long):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-24]
        sal     rax, 5
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     rdi, rax
        call    operator delete(void*, unsigned long)
        nop
        leave
        ret
std::allocator_traits<std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::max_size(std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::max_size() const
        leave
        ret
unsigned long const& std::min<unsigned long>(unsigned long const&, unsigned long const&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        cmp     rdx, rax
        jnb     .L242
        mov     rax, QWORD PTR [rbp-16]
        jmp     .L243
.L242:
        mov     rax, QWORD PTR [rbp-8]
.L243:
        pop     rbp
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocate(unsigned long, void const*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::_M_max_size() const
        cmp     QWORD PTR [rbp-16], rax
        seta    al
        test    al, al
        je      .L245
        call    std::__throw_bad_alloc()
.L245:
        mov     rax, QWORD PTR [rbp-16]
        sal     rax, 5
        mov     rdi, rax
        call    operator new(unsigned long)
        leave
        ret
std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__uninitialized_copy<false>::__uninit_copy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-24], rax
.L249:
        mov     rax, QWORD PTR [rbp-40]
        cmp     rax, QWORD PTR [rbp-48]
        je      .L248
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__addressof<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     rdi, rdx
        call    void std::_Construct<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
        add     QWORD PTR [rbp-40], 32
        add     QWORD PTR [rbp-24], 32
        jmp     .L249
.L248:
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L255
        mov     rdi, rax
        call    __cxa_begin_catch
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*)
        call    __cxa_rethrow
        mov     rbx, rax
        call    __cxa_end_catch
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L255:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret

std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >* std::__addressof<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void std::_Destroy<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        nop
        leave
        ret
std::vector<Point, std::allocator<Point> >::_S_max_size(std::allocator<Point> const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        movabs  rax, 288230376151711743
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::allocator_traits<std::allocator<Point> >::max_size(std::allocator<Point> const&)
        mov     QWORD PTR [rbp-16], rax
        lea     rdx, [rbp-16]
        lea     rax, [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    unsigned long const& std::min<unsigned long>(unsigned long const&, unsigned long const&)
        mov     rax, QWORD PTR [rax]
        leave
        ret
std::_Vector_base<Point, std::allocator<Point> >::_M_get_Tp_allocator() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
__gnu_cxx::new_allocator<Point>::allocate(unsigned long, void const*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::_M_max_size() const
        cmp     QWORD PTR [rbp-16], rax
        seta    al
        test    al, al
        je      .L264
        call    std::__throw_bad_alloc()
.L264:
        mov     rax, QWORD PTR [rbp-16]
        sal     rax, 5
        mov     rdi, rax
        call    operator new(unsigned long)
        leave
        ret
Point* std::__relocate_a<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        push    r12
        push    rbx
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     QWORD PTR [rbp-48], rcx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    Point* std::__niter_base<Point*>(Point*)
        mov     r12, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    Point* std::__niter_base<Point*>(Point*)
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    Point* std::__niter_base<Point*>(Point*)
        mov     rdi, rax
        mov     rax, QWORD PTR [rbp-48]
        mov     rcx, rax
        mov     rdx, r12
        mov     rsi, rbx
        call    Point* std::__relocate_a_1<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&)
        add     rsp, 32
        pop     rbx
        pop     r12
        pop     rbp
        ret
std::move_iterator<Point*>::move_iterator(Point*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        lea     rax, [rbp-16]
        mov     rdi, rax
        call    std::remove_reference<Point*&>::type&& std::move<Point*&>(Point*&)
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        nop
        leave
        ret
Point* std::uninitialized_copy<std::move_iterator<Point*>, Point*>(std::move_iterator<Point*>, std::move_iterator<Point*>, Point*):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     BYTE PTR [rbp-1], 1
        mov     rdx, QWORD PTR [rbp-40]
        mov     rcx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    Point* std::__uninitialized_copy<false>::__uninit_copy<std::move_iterator<Point*>, Point*>(std::move_iterator<Point*>, std::move_iterator<Point*>, Point*)
        leave
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::max_size() const:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::_M_max_size() const
        leave
        ret
__gnu_cxx::new_allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::_M_max_size() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        movabs  rax, 288230376151711743
        pop     rbp
        ret
void std::_Construct<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&>(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&):
        push    rbp
        mov     rbp, rsp
        push    r13
        push    r12
        push    rbx
        sub     rsp, 24
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     rax, QWORD PTR [rbp-48]
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const& std::forward<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&>(std::remove_reference<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&>::type&)
        mov     r13, rax
        mov     rbx, QWORD PTR [rbp-40]
        mov     rsi, rbx
        mov     edi, 32
        call    operator new(unsigned long, void*)
        mov     r12, rax
        mov     rsi, r13
        mov     rdi, r12
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)
        jmp     .L278
        mov     r13, rax
        mov     rsi, rbx
        mov     rdi, r12
        call    operator delete(void*, void*)
        mov     rax, r13
        mov     rdi, rax
        call    _Unwind_Resume
.L278:
        add     rsp, 24
        pop     rbx
        pop     r12
        pop     r13
        pop     rbp
        ret
std::allocator_traits<std::allocator<Point> >::max_size(std::allocator<Point> const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::max_size() const
        leave
        ret
__gnu_cxx::new_allocator<Point>::_M_max_size() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        movabs  rax, 288230376151711743
        pop     rbp
        ret
Point* std::__niter_base<Point*>(Point*):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
Point* std::__relocate_a_1<Point*, Point*, std::allocator<Point> >(Point*, Point*, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     QWORD PTR [rbp-64], rcx
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-24], rax
.L287:
        mov     rax, QWORD PTR [rbp-40]
        cmp     rax, QWORD PTR [rbp-48]
        je      .L286
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    Point* std::__addressof<Point>(Point&)
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    Point* std::__addressof<Point>(Point&)
        mov     rcx, rax
        mov     rax, QWORD PTR [rbp-64]
        mov     rdx, rax
        mov     rsi, rbx
        mov     rdi, rcx
        call    void std::__relocate_object_a<Point, Point, std::allocator<Point> >(Point*, Point*, std::allocator<Point>&)
        add     QWORD PTR [rbp-40], 32
        add     QWORD PTR [rbp-24], 32
        jmp     .L287
.L286:
        mov     rax, QWORD PTR [rbp-24]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::remove_reference<Point*&>::type&& std::move<Point*&>(Point*&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
Point* std::__uninitialized_copy<false>::__uninit_copy<std::move_iterator<Point*>, Point*>(std::move_iterator<Point*>, std::move_iterator<Point*>, Point*):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-24], rax
.L293:
        lea     rdx, [rbp-48]
        lea     rax, [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    bool std::operator!=<Point*>(std::move_iterator<Point*> const&, std::move_iterator<Point*> const&)
        test    al, al
        je      .L292
        lea     rax, [rbp-40]
        mov     rdi, rax
        call    std::move_iterator<Point*>::operator*() const
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    Point* std::__addressof<Point>(Point&)
        mov     rsi, rbx
        mov     rdi, rax
        call    void std::_Construct<Point, Point>(Point*, Point&&)
        lea     rax, [rbp-40]
        mov     rdi, rax
        call    std::move_iterator<Point*>::operator++()
        add     QWORD PTR [rbp-24], 32
        jmp     .L293
.L292:
        mov     rax, QWORD PTR [rbp-24]
        jmp     .L299
        mov     rdi, rax
        call    __cxa_begin_catch
        mov     rdx, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::_Destroy<Point*>(Point*, Point*)
        call    __cxa_rethrow
        mov     rbx, rax
        call    __cxa_end_catch
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L299:
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret

std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const& std::forward<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&>(std::remove_reference<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&>::type&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
__gnu_cxx::new_allocator<Point>::max_size() const:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    __gnu_cxx::new_allocator<Point>::_M_max_size() const
        leave
        ret
Point* std::__addressof<Point>(Point&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void std::__relocate_object_a<Point, Point, std::allocator<Point> >(Point*, Point*, std::allocator<Point>&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    std::remove_reference<Point&>::type&& std::move<Point&>(Point&)
        mov     rdx, rax
        mov     rcx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rcx
        mov     rdi, rax
        call    void std::allocator_traits<std::allocator<Point> >::construct<Point, Point>(std::allocator<Point>&, Point*, Point&&)
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    Point* std::__addressof<Point>(Point&)
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rdx
        mov     rdi, rax
        call    void std::allocator_traits<std::allocator<Point> >::destroy<Point>(std::allocator<Point>&, Point*)
        nop
        leave
        ret
bool std::operator!=<Point*>(std::move_iterator<Point*> const&, std::move_iterator<Point*> const&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rdx
        mov     rdi, rax
        call    bool std::operator==<Point*>(std::move_iterator<Point*> const&, std::move_iterator<Point*> const&)
        xor     eax, 1
        leave
        ret
std::move_iterator<Point*>::operator++():
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        lea     rdx, [rax+32]
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
std::move_iterator<Point*>::operator*() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        pop     rbp
        ret
void std::_Construct<Point, Point>(Point*, Point&&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 24
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    Point&& std::forward<Point>(std::remove_reference<Point>::type&)
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, 32
        call    operator new(unsigned long, void*)
        mov     rcx, rax
        mov     rax, QWORD PTR [rbx]
        mov     rdx, QWORD PTR [rbx+8]
        mov     QWORD PTR [rcx], rax
        mov     QWORD PTR [rcx+8], rdx
        mov     rax, QWORD PTR [rbx+16]
        mov     rdx, QWORD PTR [rbx+24]
        mov     QWORD PTR [rcx+16], rax
        mov     QWORD PTR [rcx+24], rdx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::remove_reference<Point&>::type&& std::move<Point&>(Point&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void std::allocator_traits<std::allocator<Point> >::construct<Point, Point>(std::allocator<Point>&, Point*, Point&&):
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     QWORD PTR [rbp-24], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    Point&& std::forward<Point>(std::remove_reference<Point>::type&)
        mov     rdx, rax
        mov     rcx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rsi, rcx
        mov     rdi, rax
        call    void __gnu_cxx::new_allocator<Point>::construct<Point, Point>(Point*, Point&&)
        nop
        leave
        ret
bool std::operator==<Point*>(std::move_iterator<Point*> const&, std::move_iterator<Point*> const&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 24
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    std::move_iterator<Point*>::base() const
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    std::move_iterator<Point*>::base() const
        cmp     rbx, rax
        sete    al
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
Point&& std::forward<Point>(std::remove_reference<Point>::type&):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
void __gnu_cxx::new_allocator<Point>::construct<Point, Point>(Point*, Point&&):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    Point&& std::forward<Point>(std::remove_reference<Point>::type&)
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     rsi, rax
        mov     edi, 32
        call    operator new(unsigned long, void*)
        mov     rcx, rax
        mov     rax, QWORD PTR [rbx]
        mov     rdx, QWORD PTR [rbx+8]
        mov     QWORD PTR [rcx], rax
        mov     QWORD PTR [rcx+8], rdx
        mov     rax, QWORD PTR [rbx+16]
        mov     rdx, QWORD PTR [rbx+24]
        mov     QWORD PTR [rcx+16], rax
        mov     QWORD PTR [rcx+24], rdx
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
std::move_iterator<Point*>::base() const:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-8], rdi
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax]
        pop     rbp
        ret
.LC14:
        .string "T1"
.LC15:
        .string "T2"
.LC16:
        .string "T3"
.LC17:
        .string "T4"
.LC18:
        .string "T5"
.LC19:
        .string "T6"
.LC20:
        .string "TT1"
.LC21:
        .string "TT2"
.LC22:
        .string "TT3"
.LC23:
        .string "TT4"
.LC24:
        .string "TT5"
.LC25:
        .string "TT6"
.LC26:
        .string "TTT1"
.LC27:
        .string "TTT2"
.LC28:
        .string "TTT3"
.LC29:
        .string "TTT4"
.LC30:
        .string "TTT5"
.LC31:
        .string "TTT6"
__static_initialization_and_destruction_0(int, int):
        push    rbp
        mov     rbp, rsp
        push    r13
        push    r12
        push    rbx
        sub     rsp, 632
        mov     DWORD PTR [rbp-644], edi
        mov     DWORD PTR [rbp-648], esi
        cmp     DWORD PTR [rbp-644], 1
        jne     .L324
        cmp     DWORD PTR [rbp-648], 65535
        jne     .L324
        mov     edi, OFFSET FLAT:_ZStL8__ioinit
        call    std::ios_base::Init::Init() [complete object constructor]
        mov     edx, OFFSET FLAT:__dso_handle
        mov     esi, OFFSET FLAT:_ZStL8__ioinit
        mov     edi, OFFSET FLAT:_ZNSt8ios_base4InitD1Ev
        call    __cxa_atexit
        lea     rax, [rbp-51]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rdx, [rbp-51]
        lea     rax, [rbp-640]
        mov     esi, OFFSET FLAT:.LC14
        mov     rdi, rax
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-50]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-50]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+32]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC15
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-49]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-49]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+64]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC16
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-48]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+96]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC17
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-47]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-47]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+128]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC18
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-46]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-46]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+160]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC19
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-45]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-45]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+192]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC20
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-44]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-44]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+224]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC21
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-43]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-43]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+256]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC22
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-42]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-42]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+288]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC23
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-41]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-41]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+320]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC24
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-40]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-40]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+352]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC25
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-39]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-39]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+384]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC26
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-38]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-38]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+416]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC27
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-37]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-37]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+448]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC28
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-36]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-36]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+480]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC29
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-35]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-35]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+512]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC30
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-34]
        mov     rdi, rax
        call    std::allocator<char>::allocator() [complete object constructor]
        lea     rax, [rbp-34]
        lea     rdx, [rbp-640]
        lea     rcx, [rdx+544]
        mov     rdx, rax
        mov     esi, OFFSET FLAT:.LC31
        mov     rdi, rcx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
        lea     rax, [rbp-640]
        mov     r12, rax
        mov     r13d, 18
        lea     rax, [rbp-33]
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::allocator() [complete object constructor]
        lea     rax, [rbp-33]
        mov     rsi, r12
        mov     rdi, r13
        mov     rcx, r12
        mov     rbx, r13
        mov     rdx, rbx
        mov     rcx, rax
        mov     edi, OFFSET FLAT:namesfile[abi:cxx11]
        call    std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > >::vector(std::initializer_list<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&)
        lea     rax, [rbp-33]
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~allocator() [complete object destructor]
        lea     rbx, [rbp-640]
        add     rbx, 576
.L327:
        lea     rax, [rbp-640]
        cmp     rbx, rax
        je      .L326
        sub     rbx, 32
        mov     rdi, rbx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        jmp     .L327
.L326:
        lea     rax, [rbp-34]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-35]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-36]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-37]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-38]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-39]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-40]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-41]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-42]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-43]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-44]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-45]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-46]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-47]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-49]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-50]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        lea     rax, [rbp-51]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        mov     edx, OFFSET FLAT:__dso_handle
        mov     esi, OFFSET FLAT:namesfile[abi:cxx11]
        mov     edi, OFFSET FLAT:_ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EED1Ev
        call    __cxa_atexit
        jmp     .L324
        mov     rbx, rax
        lea     rax, [rbp-33]
        mov     rdi, rax
        call    std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >::~allocator() [complete object destructor]
        mov     r12, rbx
        lea     rbx, [rbp-640]
        add     rbx, 576
.L330:
        lea     rax, [rbp-640]
        cmp     rbx, rax
        je      .L329
        sub     rbx, 32
        mov     rdi, rbx
        call    std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::~basic_string() [complete object destructor]
        jmp     .L330
.L329:
        mov     rbx, r12
        jmp     .L331
        mov     rbx, rax
.L331:
        lea     rax, [rbp-34]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L332
        mov     rbx, rax
.L332:
        lea     rax, [rbp-35]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L333
        mov     rbx, rax
.L333:
        lea     rax, [rbp-36]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L334
        mov     rbx, rax
.L334:
        lea     rax, [rbp-37]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L335
        mov     rbx, rax
.L335:
        lea     rax, [rbp-38]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L336
        mov     rbx, rax
.L336:
        lea     rax, [rbp-39]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L337
        mov     rbx, rax
.L337:
        lea     rax, [rbp-40]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L338
        mov     rbx, rax
.L338:
        lea     rax, [rbp-41]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L339
        mov     rbx, rax
.L339:
        lea     rax, [rbp-42]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L340
        mov     rbx, rax
.L340:
        lea     rax, [rbp-43]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L341
        mov     rbx, rax
.L341:
        lea     rax, [rbp-44]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L342
        mov     rbx, rax
.L342:
        lea     rax, [rbp-45]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L343
        mov     rbx, rax
.L343:
        lea     rax, [rbp-46]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L344
        mov     rbx, rax
.L344:
        lea     rax, [rbp-47]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L345
        mov     rbx, rax
.L345:
        lea     rax, [rbp-48]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L346
        mov     rbx, rax
.L346:
        lea     rax, [rbp-49]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L347
        mov     rbx, rax
.L347:
        lea     rax, [rbp-50]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        jmp     .L348
        mov     rbx, rax
.L348:
        lea     rax, [rbp-51]
        mov     rdi, rax
        call    std::allocator<char>::~allocator() [complete object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L324:
        add     rsp, 632
        pop     rbx
        pop     r12
        pop     r13
        pop     rbp
        ret
_GLOBAL__sub_I_namesfile[abi:cxx11]:
        push    rbp
        mov     rbp, rsp
        mov     esi, 65535
        mov     edi, 1
        call    __static_initialization_and_destruction_0(int, int)
        pop     rbp
        ret
.LC2:
        .long   0
        .long   1073741824
.LC3:
        .long   0
        .long   1083129856
.LC4:
        .long   0
        .long   -1072431104
.LC5:
        .long   0
        .long   1075052544
.LC6:
        .long   0
        .long   -1071644672
.LC7:
        .long   0
        .long   1075838976
.LC9:
        .long   -1717986918
        .long   1069128089
