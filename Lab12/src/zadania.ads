-- Kinga Florek, Micha³ Worsowicz

pragma Profile(Ravenscar);

with System;

package Zadania is

  protected Ekran is
    pragma Priority(System.Default_Priority+3);
    procedure Pisz(S : String);
  end Ekran;

  task Point is
    pragma Priority(System.Default_Priority);
  end Point;

  task Distance is
    pragma Priority(System.Default_Priority+1);
  end Distance;

end Zadania;
