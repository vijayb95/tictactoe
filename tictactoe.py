"""
Tic Tac Toe Player
"""

import math
import copy

X = "X"
O = "O"
EMPTY = None


def initial_state():
    """
    Returns starting state of the board.
    """
    return [[EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY],
            [EMPTY, EMPTY, EMPTY]]


def player(board):
    """
    Returns player who has the next turn on a board.
    """
    xcount = len([x for a in board for x in a if x == X])
    ocount = len([O for a in board for o in a if o == O])
    
    if xcount > ocount:
        return O
    else:
        return X


def actions(board):
    """
    Returns set of all possible actions (i, j) available on the board.
    """
    action = set(set())
    for i in range(len(board)):
        for j in range(len(board)):
            if board[i][j] == EMPTY:
                action.add((i,j))
            
    return action


def result(board, action):
    """
    Returns the board that results from making move (i, j) on the board.
    """
    row, col = action
    if board[row][col] is EMPTY:
        tempBoard = copy.deepcopy(board)
        user = player(board)
        tempBoard[row][col] = user
        return tempBoard
    
    else:
        raise Exception("Invalid Move")


def winner(board):
    """
    Returns the winner of the game, if there is one.
    """
    if (all(board[0]) or all(board[1]) or all(board[2])) and (
            board[0][0] == 'X' or board[1][0] == 'X' or board[2][0] == 'X'):
        return 'X'
    elif (all(board[0]) or all(board[1]) or all(board[2])) and (
            board[0][0] == 'O' or board[1][0] == 'O' or board[2][0] == 'O'):
        return 'O'
    elif board[0][0] == 'O' and board[1][1] == 'O' and board[2][2] == 'O':
        return 'O'
    elif board[0][0] == 'X' and board[1][1] == 'X' and board[2][2] == 'X':
        return 'X'
    elif board[0][2] == 'O' and board[1][1] == 'O' and board[2][0] == 'O':
        return 'O'
    elif board[0][2] == 'X' and board[1][1] == 'X' and board[2][0] == 'X':
        return 'X'
    return None


def terminal(board):
    """
    Returns True if game is over, False otherwise.
    """
    if winner(board) == None:
        xcount = len([x for a in board for x in a if x == 'X'])
        ocount = len([O for a in board for o in a if o == 'O'])
        if (xcount + ocount) == 9:
            return True
        return False
    else:
        return True

def utility(board):
    """
    Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
    """
    if winner(board) == 'X':
        return 1
    elif winner(board) == '0':
        return -1
    return 0


def minimax(board):
    """
    Returns the optimal action for the current player on the board.
    """
    bestMove = set()
    return bestMove

def maxValue(board):
    if terminal(board):
        return utility(board)
    else:
        v = float('-inf')
        for action in actions(board):
            v = max(minValue(result(board, action)))
        return v


def minValue(board):
    if terminal(board):
        return utility(board)
    else:
        v = float('inf')
        for action in actions(board):
            v = min(maxValue(result(board, action)))
        return v