module operacions_vector      ! Habitual utilitzar mateix nom per .f90 i per nom modul
    implicit none
contains

    function Norm(vec) result(norma)
        real, intent(in), dimension(:) :: vec
        real :: norma
        
        ! Calculate the norm of the vector
        norma = sqrt(sum(vec**2))
    end function Norm
    
    function Dist(vec1, vec2) result(distancia)
        real, intent(in), dimension(:) :: vec1, vec2
        real :: distancia
        
        ! Calculate the distance between two vectors
        distancia = sqrt(sum((vec1 - vec2)**2))
    end function Dist
    
end module operacions_vector