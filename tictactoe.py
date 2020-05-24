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
    if (board[0][0] == X and board[0][1] == X and board[0][2] == X) or (
            board[1][0] == X and board[1][1] == X and board[1][2] == X) or(
                board[2][0] == X and board[2][1] == X and board[2][2] == X):
        return X
    elif (board[0][0] == O and board[0][1] == O and board[0][2] == O) or (
            board[1][0] == O and board[1][1] == O and board[1][2] == O) or(
                board[2][0] == O and board[2][1] == O and board[2][2] == O):
        return O
    elif board[0][0] == O and board[1][1] == O and board[2][2] == O:
        return O
    elif board[0][0] == X and board[1][1] == X and board[2][2] == X:
        return X
    elif board[0][2] == O and board[1][1] == O and board[2][0] == O:
        return O
    elif board[0][2] == X and board[1][1] == X and board[2][0] == X:
        return X
    elif (board[0][0] == X and board[1][0] == X and board[2][0] == X) or (
            board[0][1] == X and board[1][1] == X and board[2][1] == X) or(
                board[0][2] == X and board[1][2] == X and board[2][2] == X):
        return X
    elif (board[0][0] == O and board[1][0] == O and board[2][0] == O) or (
            board[0][1] == O and board[1][1] == O and board[2][1] == O) or(
                board[0][2] == O and board[1][2] == O and board[2][2] == O):
        return O
    return None


def terminal(board):
    """
    Returns True if game is over, False otherwise.
    """
    if winner(board) == None:
        if (sum(row.count(X) for row in board) + sum(row.count(O) for row in board)) == 9:
            return True
        return False
    else:
        return True

def utility(board):
    """
    Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
    """
    if winner(board) == X:
        return 1
    elif winner(board) == O:
        return -1
    return 0


def minimax(board):
    """
    Returns the optimal action for the current player on the board.
    """
    if terminal(board):
        return None
    if player(board) == X:
        bestValue = -1
        bestMove = (-1,-1)
        if sum(row.count(EMPTY) for row in board) == 9:
            return bestMove
        for action in actions(board):
            moveValue = minValue(result(board,action))
            if moveValue == 1:
                bestMove = action
                break
            if moveValue > bestValue:
                bestMove = action
        return bestMove

    if player(board) == O:
        bestValue = 1
        bestMove = (-1,-1)
        if sum(row.count(EMPTY) for row in board) == 9:
            return bestMove
        for action in actions(board):
            moveValue = minValue(result(board,action))
            if moveValue == -1:
                bestMove = action
                break
            if moveValue < bestValue:
                bestMove = action
        return bestMove

def maxValue(board):
    if terminal(board):
        return utility(board)
    else:
        v = float('-inf')
        for action in actions(board):
            v = max(v, minValue(result(board, action)))
            if v == 1:
                break
        return v


def minValue(board):
    if terminal(board):
        return utility(board)
    else:
        v = float('inf')
        for action in actions(board):
            v = min(v, maxValue(result(board, action)))
            if v == -1:
                break
        return v