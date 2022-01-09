# Polish-form-postfixed...numbers
## If an instruction in the assembly language of the considered arithmetic processor is input, it is required to display the instruction evaluation at the output standard.  
- For this requirement, in the instruction there are no variables, it consists only of integers and operations. It is guaranteed that all operations will be unsigned.
## Example
Instruction can be given **2 10 mul 5 div 7 6 under add**.   
The result must either according to the following algorithm:  
• add 2 on the stack;  
• add 10 on the stack;  
• the mul operation is identified, the multiplication between 2 and 10 is applied, 20 is obtained, 2 and 10 are eliminated
from the stack and only 20 are kept;  
• add 5 on the stack;  
• div is identified - acts as 20 div 5, and the result is 4; remove 20 and 5 from the stack,
and only 4 are kept;  
• add 7 on the stack;  
• add 6 on the stack;  
• sub is identified - the difference between 7 and 6 is calculated, 1 is obtained, 7 and 6 are removed from the stack,
and the value 1 is added to the stack. Attention! at this point, on the stack we have 4 (at the base) and 1 in
peak, because below is a binary operation and worked only with arguments 7 and 6, but not with 4
which was already at the base of the stack.  
• add is identified - the sum between 1 and 4 is calculated, 5 is obtained, 1 and 4 are removed from the stack,
add 5;  
• I finished the line, and the result is now at the top of the stack.   
### The result of this calculation is 5.
