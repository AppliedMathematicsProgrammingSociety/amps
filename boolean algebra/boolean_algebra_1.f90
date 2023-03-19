!Mahamudul Hasan

! 1)Let p,q,r are three logical variable .Write down  truth table for three input.

program secod206

    implicit none

    integer:: i,j,k,n
    logical, dimension(2):: p,q,r
    logical:: a,b,c

    p(1)= .true.
    p(2)= .false.

    do i=1,2
        q(i)=p(i)
        r(i)=p(i)

    end do

    write(*,*) 'The truth table is : '
    write(*,*) '------------------'

    write(*,11) ' no ' ,'p' , 'q' , ' r'
    write(*,11) ' --' ,'--' , '--' , '--'


   11 format (3X, 4(A,5X))
n=0;
   do i= 1,2
    a=p(i)
    do j=1,2
        b=q(j)

        do k=1,2
            c=r(k)
            n=n+1

             write(*,12) n, a,b,c


        end do
    end do


    12 format(4X,I2, 5X,3(L2,4X))

   end do



end program
