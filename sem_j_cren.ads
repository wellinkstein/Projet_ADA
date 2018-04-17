with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;

package sem_j_cren is 
   
    T_Creneau_Aqua is record
      Tabinscrit:T_Tabadherents(1..N);
      Taille:Integer;=0;
      Open:Boolean;
   end record;


   T_Creneau_Fitness is record
      Tabinscrit:T_Tabadherents(1..N);
      Taille:Integer;=0;
      Open:Boolean;
   end record;
      
   
   T_Creneau is record
      Aqua:T_Creneau_Aqua;
      Fitness:T_Creneau_Fitness;
   end record;
         
      
   
      
      
end record;
      
Type T_Jour is array(Integer range 1..6)of T_Creneau;
Type T_Semaine is array(lundi,mardi,mercredi,jundi,vendredi,samedi,dimanche);

Type T_Planning is array(Integer range 1..6)of T_Jour;

      
end sem_j_cren;