      PROGRAM rotation
! Program that allow the rotation of two H atoms
! in the molecule of C2H4, this is done by reading
! an input file in which the information is avaliable.
! The two H atoms lie in the YZ plane.
      IMPLICIT NONE
! INITIAL DEFINITIONS
      DOUBLE PRECISION :: atom, x, y, z, PI, angle, radians
      DOUBLE PRECISION :: LengtH1, LengtH2
      DOUBLE PRECISION, DIMENSION(1500,4) :: M   !Arrays for the in/out files
      INTEGER :: i,k
      CHARACTER(len=8) :: ATOM1='H', ATOM2='C'
      DATA PI/3.1415926535898d0/

      angle   = AAAA.0d0
      radians = (PI*angle)/180.0d0
      LengtH1 = -0.9143655662d0 !parameter related to 
      LengtH2 =  0.9143740971d0 !initial coordinates
      print*, 'angle', angle
      Print*, 'radians', radians

!**********************************************************
! READ INITIAL COORDINATES
! First two rows represent the rotating H atoms
      OPEN(unit=3,file='coord.dat',status='old')
      OPEN(unit=6,file='rot_coord',status='new')
      
      DO 1 i=1,6
      READ(3,*) (M(i,k), k=1,4)
    1 CONTINUE
! A very unsophisticated rotation
      M(1,3)= LengtH1*dsin(radians) !Y coordinate rotation -H atom 1
      M(1,4)= LengtH1*dcos(radians) !Z coordinate rotation -H atom 1
      M(2,3)= LengtH2*dsin(radians) !Y coordinate rotation -H atom 2
      M(2,4)= LengtH2*dcos(radians) !Z coordinate rotation -H atom 2

! PRINT THE RESULTS IN A NEW FILE
      DO 3 i = 1,4
    2 WRITE(6,9000) ATOM1, M(i,2), M(i,3), M(i,4)
    3 CONTINUE
      DO 4 i = 5,6
    5 WRITE(6,9000) ATOM2, M(i,2), M(i,3), M(i,4)
    4 CONTINUE

      CLOSE(6)
      CLOSE(3)

 9000 FORMAT((A1,4x), 3(f13.10,3x))

      END program

