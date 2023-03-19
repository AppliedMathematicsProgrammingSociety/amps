 ! Mahamudul Hasan

! 2)Given the values of two Boolean variables x and y, find
!the values of x + y, xy, x ⊕ y, x ∣ y, and x ↓ y. Show them in a truth table.

program as206
    implicit none

    integer:: i,j,a,b,pls,plus,mul,mult,xor,bar,nor,nand
    integer, dimension(2):: x,y

x(1)=0
x(2)=1
y(1)=0
y(2)=1
write(*,*) '   x         y        x+y       xy     x xor y   x NAND y    x NOR Y'
write(*,*) '   -         -        ---       --     -------   --------    -------'

do i=1,2
     a=x(i)
    do j=1,2
        b=y(j)
pls=plus(a,b)

mul=mult(a,b)

xor=plus(mult(bar(a),b),mult(a,bar(b)))

nand=bar(mult(a,b))

nor= bar(plus(a,b))


write(*,101) a,b,pls,mul,xor,nand,nor
end do

end do

101 format( 3X, 7(I2,8X))
end program


recursive function plus(x,y) result(m)
implicit none
    integer :: x,y,m

    if(x == y .and. x==0) then
    m= 0

    else
        m= 1
        end if


end function

recursive function mult(x,y) result(m)
implicit none
    integer :: x,y,m

    if(x == y .and. x==1) then
    m= 1

    else
        m= 0
        end if

end function

recursive function bar(x) result(m)
implicit none
    integer :: x,y,m

    if(x == 1) then
    m= 0

    else
        m= 1
        end if


end function



