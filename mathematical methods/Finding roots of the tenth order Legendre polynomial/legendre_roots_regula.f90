!Author: Shajiratul Yaqueen
!April, 2024

FUNCTION sgn(x)
    REAL, INTENT(IN) :: x !input
    IF(x>0) sgn = 1
    IF(x<0) sgn = -1
END FUNCTION

FUNCTION leg10(x) RESULT(f)
    REAL, INTENT(IN) :: x           !input
    REAL :: f                       !output
    f = 46189.0*x**10/256 - 109395.0*x**8/256 + 45045.0*x**6/128 - 15015.0*x**4/128 + 3465.0*x**2/256 - 63.0/256 !this is the tenth order legendre poly
END FUNCTION

FUNCTION lag3(x) RESULT(f) !this is a laguerre poly that is not needed here
    REAL, INTENT(IN) :: x           !input
    REAL :: f                       !output
    f = -x**3/6 + 3*x**2/2 - 3*x + 1
END FUNCTION

FUNCTION findInterval(x0, incr) RESULT(p) !once a root is found, a new interval is searched for to look for a new root
    REAL, INTENT(IN) :: x0, incr
    REAL :: leg10, sgn
    REAL :: p
    INTEGER :: i, MAX = 5000
    p = x0
    i = 1
    DO WHILE(sgn(leg10(p))*sgn(leg10(p+incr))>0)
        p = p + incr
        i = i + 1
        IF(i>MAX)THEN
            WRITE(*,*)"Cannot find a bracket for the root. The function may be monotonic increasing or decreasing."
            EXIT
        END IF
    END DO
END FUNCTION

FUNCTION secant(x0, x1) RESULT(x)
    REAL, INTENT(IN) :: x0, x1      !inputs
    REAL :: leg10                    !function declaration
    REAL :: x                       !output
    x = x1-leg10(x1)*((x1-x0)/(leg10(x1)-leg10(x0)))
END FUNCTION

PROGRAM main
    IMPLICIT NONE
    INTEGER, PARAMETER :: num_roots=5, MAX = 1000         !10th legendre poly has 10 roots, but since its an even function, x and -x both are solutions, so
    INTEGER :: i, j                                       !we only look for five roots
    REAL, DIMENSION(num_roots) :: roots
    REAL :: p, x0, x1, temp
    REAL :: TOL = 1E-6
    REAL :: secant, findInterval, sgn, leg10             !function declaration
    REAL :: incr = 0.1                                   !increment for finding the interval of root
    p = -incr
    DO i = 1, num_roots
        WRITE(*,*)"Finding root num: ",i
        p = findInterval(p+incr, incr)
        x0 = p
        x1 = p + incr
        j = 1
        WRITE(*,*)"Finding root between",x0,"and",x1
        DO WHILE(abs((x1-x0))>TOL)            !appropriate stopping criterion for regula falsi
            temp = secant(x0, x1)
            IF(sgn(leg10(temp))*sgn(leg10(x0))>0)THEN
                x0 = temp
            ELSE
                x1 = temp
            END IF
            WRITE(*,*)"Iteration num:",j,"x1:",x1,"x0:",x0,"Error:",abs((x1-x0))
            j = j + 1
            IF (j>MAX)THEN
                PRINT*,"Maximum iterations reached"
                EXIT
            END IF
        END DO 
        WRITE(*,*)"Approximate root: ",x0
        roots(i) = x0
    END DO
    WRITE(*,*)"All approximate roots: ",roots
END PROGRAM
