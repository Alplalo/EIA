module escriure_results      ! Habitual utilitzar mateix nom per .f90 i per nom modul
    implicit none
contains
    subroutine print_results(vec1,vec2)            ! Però el nom de la subrutina ha de ser diferent del nom del module
        real, intent(in), dimension(:) :: vec1, vec2
        integer :: i
        print *, "Results:"
        i = 1
        do while (i <= size(vec1))
            print*, vec1(i), vec2(i)
            i = i + 1
        end do
    end subroutine print_results
end module escriure_results