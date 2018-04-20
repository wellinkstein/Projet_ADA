with gestion_pile;

package ABR_adher is 
   type T_Noeud;
   type T_Arbre_adh is access T_Noeud;
   type T_Noeud is record
      Adh:T_Adherent;
      Fg,Fd:T_Arbre_adh;
   end record;
   
   
      
end ABR_adher;
