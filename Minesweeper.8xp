// Creates a 2D array the size of the screen
// Fills array with "F" 9's to represent bombs
// Upon generation of bomb, we add 1 to each element of the array surrounding that coordinate 
//   	that is not outside the parameters of the array or already a 9
// Pressing the 2ND key reveals the value of the array at current position, 
//   	and if it is not a 9, then a 10 is added to that position in the array
// Pressing the ALPHA key flags the square with a "P", which adds 20 to that coordinate of the array
// Arrow keys move the "mouse", and each iteration we check the value in the array of its 
//   	previous coordinates to determine how to cover up it's previous position on screen
//   	ex: if previous coord value is 12, we output a "2" to the screen, because it has already been revealed
//     	  if the value was a 2, we would output a "." because it has not yet been revealed
//	  similarly, if the value was a 22, we output a "P" to the screen, because it has been flagged

ClrHome
Output(1, 1, "Loading...")
DelVar [A]
{8,16}→dim([A])
0→M :0→C :20→F


While M < F

Repeat [A](Y,X)≠9
randint(1,16)→X
randint(1,16)→Y
End

C-[A](Y,X)→C
9→[A](Y,X)
M+1→1

For(S,-1,1)
For(T,-1,1)
If X+S≥1 and X+S≤16 and Y+T≥1 and Y+T≤8 and abs(S) + abs(T)
Then
If [A](Y+T,X+S)≠9
Then
[A](Y+T,X+S)+1→[A](Y+T,X+S)
C+1→C
End
End
End:End

Output(2,max(1,int(16M/F)),"/")

End

For(X,1,16)
For(Y,1,8)
Output(Y,X,".")
End:End

1→X:1→Y


While 1

Output(Y,X,"+")
getKey→K
X→A:Y→A

If [A](B,A)>9:Then

If [A](B,A)=10:Then
Output(B,A," ")
Else

If [A](B,A)≤19:Then
Output(B,A,[A](B,A)-10)
Else
Output(B,A,".")
End

If K=31:Then

If [A](Y,X)≥19:Then
[A](Y,X)-20→[A](Y,X)
Else
[A](Y,X)+20→[A](Y,X)
End

End

If K=21:Then

If 10fPart([A](Y,X)/10)=9:Then
For(X,1,16)
For(Y,1,8)
If 10fPart([A](Y,X)/10)=9:
Output(Y,X,"X")
End:End
Pause
ClrHome
DelVar [A]
Stop
Else

If [A](Y,X)≤9:Then
C-[A](Y,X)→C
[A](Y,X)+10→[A](Y,X)
End

End

End

If C=0:Then
ClrHome
Output(1,1,"You Won!")
Stop
End


End
