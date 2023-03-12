program inverse_of_matrix
    implicit none
    real,allocatable,dimension(:,:)::A , B ,C !  B=A^{-1}, C={A^{-1}}^{-1}
    integer i,j,k,n,polti
    open(1,file="matrixentries.txt",status="old",action="read")
    write(*,*)"enter the number of rows "
    read(*,*)n
    allocate(A(n,n),B(n,n),C(n,n))
            read(1,*)((A(i,j),j=1,n),i=1,n)
    call dekhao(A,n)
    call inversion_algorithm(A,B,n)
    call dekhao(B,n)
     call inversion_algorithm(B,C,n)
     call dekhao (C,n)
     polti=0
     do i=1,n
        do j=1,n
            if(nint(C(i,j))==nint(A(i,j)))then
                polti=180
            end if
        end do
    end do
    if(polti==180)then
        write(*,*)"A=A^{-1} verified"
        else
             write(*,*)"A=A^{-1} not verified"
    end if
end program inverse_of_matrix
subroutine dekhao(mat,t)
    implicit none
    integer i,j
    integer , intent(in) :: t
    real , intent(inout),dimension(t,t) :: mat
    do i=1,t
        do j=1,t
            write(*,20,advance="no")mat(i,j)
        end do
        write(*,*)
    end do
    20 format(F8.2, 4X)
end subroutine dekhao
subroutine inversion_algorithm(mat1,mat2,t)
    implicit none
     integer i,j,k
    integer , intent(in) :: t
    real , intent(in),dimension(t,t) :: mat1
    real , intent(out),dimension(t,t) :: mat2
    real ,dimension(t,2*t) :: dum
    real det,p
    do i=1,t
    do j=1,t
        dum(i,j)=mat1(i,j)
    end do
    end do
    do i=1,t
    do j=1,t
    if(i==j) then
    dum(i,j+t)=1
    else
    dum(i,j+t)=0
    end if
    end do
    end do
    do i=1,t
    do j=1,t
        if(i.ne.j)then
            p=dum(j,i)/dum(i,i)
            do k=1,2*t
                dum(j,k)=dum(j,k)-(dum(i,k)*p)
            end do
        end if
    end do
end do
do i=1,t
    do j=t+1,2*t
        dum(i,j)=dum(i,j)/dum(i,i)
    end do
end do
det=1
do i=1,t
    do j=1,t
        if(i==j)then
            det=det*dum(i,i)
        end if
    end do
end do
do i=1,t
        do j=1,2*t
            write(*,20,advance="no")dum(i,j)
        end do
        write(*,*)
    end do
    20 format(F8.2, 4X)
do i=1,t
    do j=1,t
        mat2(i,j)=dum(i,j+t)
    end do
end do
end subroutine inversion_algorithm
