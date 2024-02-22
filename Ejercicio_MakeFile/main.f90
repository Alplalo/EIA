program main
    use demanar_dimensio   ! Moduls en minuscula, ja que buscarà en arxius amb nom en minuscula
    use demanar_vector
    use operacions_vector
    use escriure_results
    
    implicit none
    integer :: dim
    real, allocatable :: vec1(:), vec2(:)
    integer :: alloc_status
    
    ! Inicialitzar Vectors
    call intro_dimension(dim)

    ! Allotjar memòria pels vectors
    allocate(vec1(dim), vec2(dim), stat=alloc_status)
    
    ! Verificar si s'ha allotjat memòria correctament
    if (alloc_status /= 0) then
        print *, "Error: No s'ha pogut allotjar memòria per a vec1 i vec2."
        stop
    endif


    
    ! Input vectors
    call intro_vector(vec1, vec2)
    
    ! Calcular norma i distancia
    print *, "Norm of vector 1:", Norm(vec1)
    print *, "Norm of vector 2:", Norm(vec2)
    print *, "Distance between vectors:", Dist(vec1, vec2)
    
    ! Print results
    call print_results(vec1, vec2)
    
    ! Alliberar memoria
    deallocate(vec1, vec2)
    
end program main

