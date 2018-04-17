with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;

package ABR_adher is 
   type T_Noeud;
   type T_Arbre_adh is Acess T_Noeud;
   type T_Noeud is record
      Adh:T_Adherent;
      Fg,Fd:T_Arbre_adh;
   end record;
   
   
      
end ABR_adher;