with Ada.Real_Time;
use Ada.Real_Time;
with Ada.Synchronous_Task_Control;
use Ada.Synchronous_Task_Control;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Text_IO;
use  Ada.Text_IO;
with Bufor;

-- Kinga Florek, Micha³ Worsowicz

package body Zadania is

  -- ustalenie zakresu losowych liczb
  subtype randRange is Integer range 1..10;

  protected body Ekran is
    procedure Pisz(S : String) is
    begin
      Put_Line(S);
    end Pisz;
  end Ekran;

   task body Point is
    -- Utowrzenie pakietu losujacego liczby
    package Los_Liczby is new Ada.Numerics.Discrete_Random(randRange);
    use Los_Liczby;
    Nastepny : Ada.Real_Time.Time;
    Okres : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds(1200);
    Gen : Generator;
    X : Integer;
    Y : Integer;
  begin
    Nastepny := Ada.Real_Time.Clock;
    loop
      delay until Nastepny;
      -- Generowanie losowych liczb dla X i Y
      Los_Liczby.Reset(Gen);
      X := Random(Gen);
      Los_Liczby.Reset(Gen);
      Y := Random(Gen);
      Ekran.Pisz("Punkt >> (" & X'Img & "," & Y'Img & ")");
      Bufor.Wstaw(X,Y);
      Nastepny := Nastepny + Okres;
    end loop;
  end Point;

  task body Distance is
    X : Integer := 999;
    Y : Integer := 999;
    X2 : Integer := 999;
    Y2 : Integer := 999;
    Beginning : Float;
    Distance : Float;
  begin
    loop
      Bufor.Pobierz(X,Y);

      -- Obliczanie odleglosci od pocz±tku
      Beginning := Sqrt(Float(X)**2 + Float(Y)**2);
      Ekran.Pisz("Distance << Odleglosc od poczatku = " & Beginning'Img);

      -- Obliczanie odleglosci miedzy punktami (z pominieciem pierwszego, przed nim zadnego nie ma)
      if X2 /= 999 and Y2 /= 999 then
            Distance := Sqrt(Float(abs(X-X2))**2 + Float(abs(Y-Y2))**2);
            Ekran.Pisz("Distance << Odleglosc od poprzedniego punktu = " & Distance'Img);
      end if;
      X2 := X;
      Y2 := Y;
    end loop;

  end Distance;

end Zadania;
