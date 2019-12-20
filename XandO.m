classdef XandO

    properties
        board
        past
        future
    end
    
    methods
        function a = XandO
            a.board= '         ';   %creates an empty board to start a game
            a.past=List;
            a.future=List;
        end
        
        
        function disp(a)            %sets up my snazzy board
            disp(['##=======##';...
                '||',' ',a.board(1),' ',a.board(2),' ',a.board(3),' ','||';...
                '||',' ',a.board(4),' ',a.board(5),' ',a.board(6),' ','||';...
                '||',' ',a.board(7),' ',a.board(8),' ',a.board(9),' ','||';...
                '##=======##'])
        end
        
        function f=LegalMoves(a)        %shows where the blank spaces are
            f=strfind(a.board,' ');
        end
        
        function [g,p,f]=Move(a,i)            %does the player's move if it's legal to do so
        B= LegalMoves(a)==i;
        if any(B)==0
            disp('move is not legal');
            g=a;
            p=a.past;
            f=a.future;
        else
            a.board(i)='X';
            x=[i,0];
            a.past=List(x,a.past);
            a.future=List;
                        
%             a.Win;
%             x= a=='You';
%             y= a=='Computer';
%             if x==[1,1,1] || y==[1,1,1,1,1,1,1,1]
%                 g=a.Win;
%             else
%                 a=a.ComputerMove;
%                 g=a;
%             end    
            
            a=a.ComputerMove;
            g=a;

            p=a.past;
            f=a.future;
        end   
        end
        
        function [c,p,f]=ComputerMove(a)      %randomly allocates the computer's move
            if length(a.LegalMoves)>1
                j=randsample(a.LegalMoves,1);
                a.board(j)='O';
                
                L=a.past;
                t=L.tail;
                h=L.head;
                h(2)=j;
                a.past=List(h,t);
                a.future=List;
                
                c=a;
                p=a.past;
                f=a.future;
            else
                a.board(a.LegalMoves)='O';
          
                L=a.past;
                t=L.tail;
                h=L.head;
                h(2)=a.LegalMoves;
                a.past=List(h,t);
                a.future=List;
                
                c=a;
                p=a.past;
                f=a.future;
            end
        end
        
        function [u,p,f]= undo(a)
           if  isNil(a.past)==1
                error('There are no moves to undo')
           else     
            L=a.past;
            h=L.head;
            L=L.tail;
            a.past=L;
            a.future=List(h,a.future);
            p=a.past;
            f=a.future;
            
            a.board(h(1))=' ';
            a.board(h(2))=' ';
            u=a;
           end
        end
        
        function [r,p,f]= redo(a)
            if  isNil(a.future)==1
                error('There are no moves to redo')
            else
                L=a.future;
                h=L.head;
                t=L.tail;
                a.board(h(1))='X';
                a.board(h(2))='O';
                a.future=t;
                a.past=List(h,a.past);
                
                f=a.future;
                p=a.past;
                r=a;
            end
        end 
                
        
        function k=positionsofx(a)      %shows where the 'X's are on the board
            k=strfind(a.board,'X');
        end
        
        function l=positionsofo(a)      %shows where the 'O's are on the board
            l=strfind(a.board,'O');
        end
        
        function [p,z]=Win(a)               %once the game is complete, deduces who has won by going through all the possible winning combinations
            w=[1,5,9];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';   %clears board ready to play again
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';   %clears board ready to play again
                z=a;
                p='Computer';
            end    
            
            w=[3,5,7];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end    
            
             w=[1,2,3];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end    
            
             w=[4,5,6];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end    
            
             w=[7,8,9];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end  
            
             w=[1,4,7];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end  
            
             w=[2,5,8];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end  
            
             w=[3,6,9];
            x=ismember(w,positionsofx(a));
            y=ismember(w,positionsofo(a));
            if all(x)==1
                disp('player has won the game! WOO, YOU ACED IT');
                a.board= '         ';
                z=a;
                p='You';
            elseif all(y)==1
                disp('computer has won the game! LOL YOU SUCK');
                a.board= '         ';
                z=a;
                p='Computer';
            end  
        end
        
        function d=draw(a)          %will say game ends in a draw if all blank spaces are filled
            if isempty(a.LegalMoves)
                disp('GAME ENDS IN A DRAW')
                a.board= '         ';
                d=a;
            else
                disp('game is still in progress')
                d=a;
            end
        end   
            
%         %way too slow atm so need to fix this
%         function m=SmartCompMove(a) %use when there is a chance to win or a chance to block me winning 
%             
%                         r=a.board(1:3);
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             n=s(1);
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end  
% 
%                         r=a.board(4:6);
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             n=s(1)+3;
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%             
%                         r=a.board(7:9);
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             n=s(1)+6;
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%             
%                        r=[a.board(1),a.board(4),a.board(7)];
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             while length(s)==1
%             if s==1
%                 n=1;
%             elseif s==2
%                 n=4;
%             else
%                 n=7;
%             end
%             end
%             
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%              
%             
%                        r=[a.board(2),a.board(5),a.board(8)];
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             while length(s)==1
%             if s==1
%                 n=2;
%             elseif s==2
%                 n=5;
%             else
%                 n=8;
%             end
%             end
%             
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%                        r=[a.board(3),a.board(6),a.board(9)];
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             while length(s)==1
%             if s==1
%                 n=3;
%             elseif s==2
%                 n=6;
%             else
%                 n=9;
%             end
%             end
%             
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%            
%                   r=[a.board(3),a.board(5),a.board(7)];
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             while length(s)==1
%             if s==1
%                 n=3;
%             elseif s==2
%                 n=5;
%             else
%                 n=7;
%             end
%             end
%             
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%             
%                   r=[a.board(1),a.board(5),a.board(9)];
%             s=strfind(r,' ');
%             t=strfind(r,'O');
%             u=strfind(r,'X');
%             while length(s)==1
%             if s==1
%                 n=1;
%             elseif s==2
%                 n=5;
%             else
%                 n=9;
%             end
%             end
%             
%             if length(s)==1 && length(t)==2
%                 a.board(n)='O';
%                 m=a;
%             elseif length(s)==1 && length(u)==2
%                 a.board(n)='O';
%                 m=a;
%             end 
%         end    
    end
end
 
