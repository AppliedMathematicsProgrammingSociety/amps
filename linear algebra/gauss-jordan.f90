PROGRAM gaussian
    IMPLICIT NONE
    INTEGER :: n1,n2,i,j,k,z=0
    REAL :: det=1.0,temp
    REAL, DIMENSION(:,:), ALLOCATABLE :: a,b,check,checktest
    CHARACTER (LEN=20) :: fn,fm

    12 WRITE(*,'(A)') "The number of variables and the number of equations need to be equal "
    WRITE(*,'(A)') "Enter the number of variables in the set of equations: "
    READ(*,*) n1
    WRITE(*,'(A)') "Enter the number of equations in the set of equations: "
    READ(*,*) n2

    ALLOCATE(check(n1,n2))
    ALLOCATE(checktest(n1,n2))

    IF(n1/=n2) THEN
        WRITE(*,'(A)') "The number of variables and the number of equations are not equal."
        GOTO 12
    END IF
    n1=n1+1

    WRITE(fn,'("(",1I1,"(1F6.2,2X))")') n1
    WRITE(fm,'("(",1I1,"(1F6.2,2X))")') n2

    ALLOCATE(a(n1,n2))
    ALLOCATE(b(n1,n2))

    OPEN(UNIT=10,FILE='mat.txt',STATUS='OLD',ACTION='READ')
    READ(10,*) a

    DO i=1,n2
        DO j=1,n2
            check(i,j)=a(i,j)
        END DO
    END DO
    WRITE(*,'(A,/)') "The coefficient matrix is: "
    WRITE(*,fn) a
    WRITE(*,'(/)')

    DO i=1,n2
        DO j=1,n2
            check(i,j)=a(i,j)
        END DO
    END DO


    DO k=1,n2
        IF(a(k,k)==0) THEN
            z=1
            DO i=k+1,n2
                IF(a(k,i)/=0) THEN
                    z=2
                    DO j=1,n1
                        temp=a(j,k)
                        a(j,k)=-a(j,i)
                        a(j,i)=temp
                    END DO

                IF(z==2) THEN
                    EXIT
                END IF
            END DO
        END IF
        !WRITE(*,fn) a
        !WRITE(*,'(/)')
        b=a
        IF(z==1) THEN
            !WRITE(*,fn) a
            !WRITE(*,'(/)')
            IF(a(n1,n2)==0.AND.a(n1-1,n2)==0) THEN
                WRITE(*,'(A)') "There are infinitely many solutions to this set of equation."
            ELSE IF(a(n1,n2)/=0.AND.a(n1-1,n2)==0) THEN
                WRITE(*,'(A)') "There is no solution to this set of equation."
            ELSE
                WRITE(*,*) "There is no unique solution to this set of equations."
            END IF
            STOP
        END IF
        DO i=k,n1
            IF(b(k,k)==0) THEN
                a(i,k)=0
            ELSE
                a(i,k)=a(i,k)/b(k,k)
            END IF
                DO j=k+1,n2
                    a(i,j)=a(i,j)-a(i,k)*b(k,j)
                END DO
        END DO
    END DO

    WRITE(*,'(A,/)') "The row echelon form of the coefficient matrix is: "
    WRITE(*,fn) a
    WRITE(*,'(/)')

    DO j=n2,2,-1
        b=a
        DO i=j-1,1,-1
            a(j,i)=a(j,i)-a(j,j)*b(j,i)
            a(n1,i)=a(n1,i)-a(n1,j)*b(j,i)
        END DO
    END DO

    WRITE(*,'(A,/)') "The reduced row echelon form of the coefficient matrix is: "
    WRITE(*,fn) a
    WRITE(*,'(/)')

    WRITE(*,'(A,/)') "The solution to the system of equaltions is: "
    DO i=1,n2
        WRITE(*,'(1F6.2)') a(n1,i)
    END DO
END PROGRAM
