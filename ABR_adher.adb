with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;

package body Abr_Adher is 

   function check (P_Pile: IN T_CelluleAdherents ; P_ABR: IN T_Arbre_adh )return boolean is
   begin
      -- True si le nom de la pile est > au nom de l'ABR
      if A/= null then
         if P_Pile.Adherent.Nom > P_Abr.Adh.Nom or
               (P_Pile.Adherent.Nom = P_Abr.Adh.Nom 
                  AND P_Pile.Adherent.Prenom > P_Abr.Adh.Prenom) then
         return (True);
      else
      return (False);
         end if;
      end if;        
   end check;



   Procedure insert_ABR (P : IN T_CelluleAdherents ; A : IN OUT T_Arbre_adh)is
   begin
      
      if A=null then
         A:= new T_Noeud'(P.adherent, null, null);
      elsif check(P.adherent.nom, A.Adh.nom) then
         Inser_Abr(P, A.Fg);
      else
         Insert_Abr(P, A.Fd);
      end if;
   end Insert_Abr;


--je l'ai ajouter dans le menu principale
   Procedure affich_Prefixe_ABR (A : IN T_Arbre_adh) is
      procedure Affich_esc (A : IN T_Arbre_adh; num : IN OUT integer) is
      begin
         if A/=null then
            Put(" L'adherent numero ");
            Put(Num);
            put(" est : ");
            Put(A.Adh.Nom);New_Line;
            num := num + 1;
            Affich_esc (A.Fg, num);
            Affich_esc (A.Fd, num);
         end if;
      end Affich_Esc;

      Num : Integer := 0;
   begin
      esc (A, num);
   end affich_Prefixe_ABR;

end ABR_adher;
