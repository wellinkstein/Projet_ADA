WITH Ada.Text_IO,ada.Sequential_IO;
USE Ada.Text_IO;



package body Fichiers is
   
   procedure Create_Tab_Adherents(Tete:T_Pteurpileadherents;A:in out T_Tableau_Adherents)is
   tmp:T_Pteurpileadherents:=Tete;compteur:integer:=1;
   begin
      while tmp /= null loop
        A(Compteur):= Tmp.Adherent;
         Compteur := Compteur+1;
         Tmp:=Tmp.Suiv;
      end loop;
   end Create_Tab_Adherents;
   

  procedure Recup_Pile_Adherents(Tete:in out T_Pteurpileadherents;A:in out T_Tableau_Adherents)is
   compteur:integer:=1;
   begin
      while A(compteur).DateNaissance.Annee /= 1 loop
         Tete:=new T_Celluleadherents'(A(Compteur),Tete);
         Compteur:=Compteur+1;
      end loop;
          
    end Recup_Pile_Adherents;
         

   --USE Fichier_;

   
   
   procedure Save_Adherents(Adherents:T_Tableau_Adherents) IS
      F:Fichier_Adherents.File_Type;
   BEGIN
      begin
         Create_Tab_Adherents(tete_pile,Tab_adh);
         Open(F,Out_File,"save_Adherents");--ouvrir le fichier s'il est existe
      EXCEPTION
         WHEN OTHERS =>Create(F,Name=>"save_Adherents");--si non on creer un nouveau fichier
         END;
      Write(F,Adherents);--on sauvegarde les editeurs saisies
      Close(F);
   END Save_Adherents;

   PROCEDURE Restore_Adherents(Adherents:OUT T_Tableau_Adherents) IS
      F:Fichier_Adherents.File_Type;
   BEGIN
      Open(F,In_File,"save_editeur");
      Read(F,Adherents);
      Close(F);
      Recup_Pile_Adherents(tete_pile,Tab_Adh);
   END Restore_Adherents;

   

   

END fichiers;

