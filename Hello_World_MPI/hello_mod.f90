program helloworld_SendRecieve

    include 'mpif.h'
   
    integer comm, taskid, numproc, ierror, partner, MASTER, message, status, reslen
    character(len=20) :: hostname
   
    call MPI_INIT(ierror)
    call MPI_COMM_RANK(MPI_COMM_WORLD,taskid,ierror)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,numproc,ierror)

    MASTER = 0
    !we need an even number of task
    if (mod(numproc,2) .ne. 0) then
      if (taskid .eq. MASTER) then
        print*, "Quitting.Need an even number of task: numtask=", numproc
      endif
    else
      if (taskid .eq. MASTER) then
        print*, "MASTER: Number of MPI task is:", numproc
      endif
      call MPI_GET_PROCESSOR_NAME(hostname,reslen,ierror)
      print*, "Hello from task", taskid,hostname
      ! Determine partner and then send/receive with partner
      if (taskid .lt. numproc/2) then
         partner = numproc/2 + taskid
         call MPI_SEND(taskid, 1, MPI_INTEGER, partner, 1, MPI_COMM_WORLD, ierror)
         call MPI_RECV(message, 1, MPI_INTEGER, partner, 1, MPI_COMM_WORLD, status, ierror)
      else if (taskid .ge. numproc/2) then
        partner = taskid - numproc/2
        call MPI_RECV(message, 1, MPI_INTEGER, partner, 1, MPI_COMM_WORLD, status, ierror)
        call MPI_SEND(taskid, 1, MPI_INTEGER, partner, 1, MPI_COMM_WORLD, ierror)
      endif
      ! Print partner info and exit
      print *,"Task ",taskid,"is partner with",partner, "message",message
    endif
    call MPI_FINALIZE(ierror) 
end program helloworld_SendRecieve
