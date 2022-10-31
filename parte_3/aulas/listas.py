matrix=[[1,2,3], [4,5,6]]

    
transposta_mat = lambda Mat:[[Mat[i][j] for i in range(len(Mat))] for j in range(len(Mat[0]))]
print(transposta_mat(matrix))
