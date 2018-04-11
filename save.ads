package Save is


   subtype I1_31 is Integer range 1..31;
   subtype I1_12 is Integer range 1..12;
   type T_Activite is
         (A,
          F,
          Af);
   type T_Date is
      record
         Jour  : I1_31;
         Mois  : I1_12;
         Annee : Positive;
      end record;
   subtype Mot is String
      (1..20);
   type T_Semaine is
         (Lundi,
          Mardi,
          Mercredi,
          Jeudi,
          Vendredi,
          Samedi);
   type T_Mois is
         (Janvier,
          Fevrier,
          Mars,
          Avril,
          Mai,
          Juin,
          Juillet,
          Aout,
          Septembre,
          Octobre,
          Novembre,
          Decembre);
   type T_Horairecreneaux is
         (C1,
          C2,
          C3,
          C4,
          C5,
          C6);
   type T_Tabadherents is array (Integer range <>) of T_Adherents;--of !!!!!

   type T_Creneaux is
      record
         Nomjour             : T_Semaine;
         Nomactivite         : T_Activite;
         Horaire             : T_Horairecreneaux;
         Tabinscritscreneaux : T_Tabadherents;
      end record;


   type T_Adherent is
      record
         Nom                  : Mot        := (others => ' ');
         Prenom               : Mot        := (others => ' ');
         Datenaissance        : T_Date;
         Datederniereadhesion : T_Date;                        --(= la date du jour)
         Nbseances            : Positive   := 0;
         Typecontrat          : T_Activite;
         Sem1                 : T_Creneaux;                    ------------
         Sem2                 : T_Creneaux;                    ----------------------
      end record;



   type T_Celluleadherents;
   type T_Pteurpileadherents is access T_Celluleadherents;
   type T_Celluleadherents is
      record
         Adherent : T_Adherent;
         Suiv     : T_Pteurpileadherents;
      end record;

end Save;

