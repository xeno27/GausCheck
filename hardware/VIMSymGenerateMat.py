#generate char matrix for VIM KiCAD symbol

colDist=3.81
rowDist=-2.53
numCols=8
numRows=16

startPos=[-13.335,21.59]
fontStr="(effects (font (size 1.27 1.27)))"

chars=[["D","E","F","CA","M","N","G","H"],["L","K","J","I","DP","C","B","A"]]

#Example single char
# (text "1D" (at -13.335 21.59 0)
#         (effects (font (size 1.27 1.27)))
#       )

digit=0

for row in range(0,numRows):
  if (row % 2) == 0: #even row (0,2,4..)
    digit+=1
    chID=0
  else :
    chID=1
  for col in range(0,numCols):
    #print("(text \"" + str(digit) + chars[chID][col] + "\" (at " + str(startPos[0]+colDist*col) + " " + str(startPos[1]+rowDist*row) + " 0)")
    print('(text \"{0}{1}\" (at {2:.3f} {3:.3f} 0)'.format(digit,chars[chID][col],startPos[0]+colDist*col,startPos[1]+rowDist*row))
    print('  (effects (font (size 1.27 1.27)))')
    print(')')

