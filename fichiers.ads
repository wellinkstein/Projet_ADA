with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,Ada.Sequential_IO,declaration_adherent,gestion_pile;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,declaration_adherent,gestion_pile;

package Fichiers is 
   

 

   type T_Tableau_Adherents is array(Integer range 1..N)of T_Adherent;
   Tab_Adh:T_Tableau_Adherents;
   tete_pile:T_Pteurpileadherents;

PACKAGE Fichier_Adherents IS NEW Ada.Sequential_IO(T_tableau_Adherents);
use Fichier_Adherents;
PROCEDURE Save_Adherents(Adherents: IN T_Tableau_Adherents);
PROCEDURE Restore_Adherents(Adherents:OUT T_Tableau_Adherents);
   
      


end fichiers;