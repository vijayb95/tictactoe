EMPTY = None
X = 'X'

board = [[X, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY]]

if (all(board[0]) or all(board[1]) or all(board[2])) and (
        board[0][0] == 'X' or board[1][0] == 'X' or board[2][0] == 'X'):
    pass
elif (all(board[0]) or all(board[1]) or all(board[2])) and (
        board[0][0] == 'O' or board[1][0] == 'O' or board[2][0] == 'O'):
    pass
elif board[0][0] == 'O' or board[1][1] == 'O' or board[2][2] == 'O':
    pass
elif board[0][0] == 'X' or board[1][1] == 'X' or board[2][2] == 'X':
    pass
elif board[0][2] == 'O' or board[1][1] == 'O' or board[2][0] == 'O':
    pass
elif board[0][2] == 'X' or board[1][1] == 'X' or board[2][0] == 'X':
    pass
pass