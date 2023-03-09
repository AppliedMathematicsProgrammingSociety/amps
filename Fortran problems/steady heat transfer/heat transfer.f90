! Mahfuz Islam Suave
! program for visualizing steady heat transfer in a metallic plate
program two_dimension_steady_heat_transfer
    implicit none
! declaring variables
    real dx,dy,w,e,Base,Height
    integer i,j,imax,jmax
    real, allocatable,dimension(:,:) :: t,t_old,x,y

! initializing dimensions of the plate
    Base=.5 ! base of plate
    Height=.7 ! height of plate
    w=1.6 ! relaxation factor
! generating grid
    imax=51
    jmax=71
    dx=Base/(imax-1)
    dy=Height/(jmax-1)
    allocate(t(imax,jmax),t_old(imax,jmax),x(imax,jmax),y(imax,jmax))
! generating points
    do i=1,imax
        do j=1,jmax
            x(i,j)=(i-1)*dx
            y(i,j)=(j-1)*dy
        end do
    end do
! temperature values
    t=0.0 ! initializing to 0
    t(:,1)=210.0 ! bottom side
    t(:,jmax)=150.0 ! top side
    t(1,:)=20.0 ! left side
    t(imax,:)=70.0 ! right side
    t(1,1)=115.0 ! bottom-left point
    t(imax,jmax)=110.0 ! top-right point
    t(1,jmax)=85.0 ! top-left point
    t(imax,1)=140.0 ! bottom-right point
    t_old=t ! saving values in a template variable


    do
        e=0.0 ! error
! iterating heat distribution by SOR method
        do i=2,imax-1
        do j=2,jmax-1
            t(i,j)=(1-w)*t_old(i,j)+0.25*w*(t(i+1,j)+t(i-1,j)+t(i,j+1)+t(i,j-1))
            e=e+abs(t(i,j)-t_old(i,j))
        end do
    end do
    if(e<0.01)exit
    t_old=t
    end do
! tecplot file
    open(12,file="temperature.plt",status="replace",action="write")
    write(12,*)"variables = x , y , T"
    write(12,*)"Zone i = ",jmax," j = ",imax ! y=c is parallel to x axis
                                                                      ! x=c is parallel to y axis
! graphing the plate
    do i=1,imax
        do j=1,jmax
            write(12,*)x(i,j),y(i,j),t(i,j)
        end do
    end do
close(12)
end program two_dimension_steady_heat_transfer
