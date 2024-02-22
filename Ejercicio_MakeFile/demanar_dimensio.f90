module demanar_dimensio      ! Habitual utilitzar mateix nom per .f90 i per nom modul
    implicit none
contains
    subroutine intro_dimension(dim)            ! Però el nom de la subrutina ha de ser diferent del nom del module
        integer, intent(out) :: dim
        print *, "Enter the dimension of the vectors:"
        read(*, *) dim
    end subroutine intro_dimension
end module demanar_dimensio

