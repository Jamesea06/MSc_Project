% Assuming you have two matrices named matrix1 and matrix2 of size 12x20
matrix1 = Elastic; % your 12x20 matrix
matrix2 = Hardness; % your 12x20 matrix
matrix3 = Mat_Type;

% Reshape the matrices into a single matrix of size 240x2
reshapedMatrix = reshape([matrix1(:); matrix2(:); matrix3(:)], [], 3);