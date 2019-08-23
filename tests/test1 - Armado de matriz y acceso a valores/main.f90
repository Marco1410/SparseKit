program test1
  use SparseKit
  implicit none
  type(Sparse) :: matrix

  matrix = sparse( nnz = 19, rows = 4)

  call matrix%append( value =    4, row = 1, col = 1)
  call matrix%append( value =  -30, row = 1, col = 2)
  call matrix%append( value =   60, row = 1, col = 3)
  call matrix%append( value =  -35, row = 1, col = 4)
  call matrix%append( value =  -30, row = 2, col = 1)
  call matrix%append( value =  300, row = 2, col = 2)
  call matrix%append( value = -675, row = 2, col = 3)
  call matrix%append( value =  420, row = 2, col = 4)
  call matrix%append( value =   60, row = 3, col = 1)
  call matrix%append( value = -675, row = 3, col = 2)
  call matrix%append( value = 1620, row = 3, col = 3)
  call matrix%append( value =-1050, row = 3, col = 4)
  call matrix%append( value =  -35, row = 4, col = 1)
  call matrix%append( value =  420, row = 4, col = 2)
  call matrix%append( value =-1050, row = 4, col = 3)
  call matrix%append( value =  700, row = 4, col = 4)
  
  call matrix%makeCRS

  print'(/,A,E12.5,/)','A(3,2) = ', matrix%get( 3, 3)
  print'(A,1X,I0,/)','nnz    = ', matrix%getNonZeros()

end program test1

