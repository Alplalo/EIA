module demanar_vector      ! Habitual utilitzar mateix nom per .f90 i per nom modul
    implicit none
contains
    subroutine intro_vector(vec1,vec2)            ! Però el nom de la subrutina ha de ser diferent del nom del module
        real, intent(inout), dimension(:) :: vec1, vec2
        integer :: i
        print *, "Enter the components of the vectors:"
        i = 1
        print*, size(vec1)
        do while (i <= size(vec1))
            print *, "Enter the component ", i
            read(*, *) vec1(i), vec2(i)
            i = i + 1
        end do
    end subroutine intro_vector
end module demanar_vector